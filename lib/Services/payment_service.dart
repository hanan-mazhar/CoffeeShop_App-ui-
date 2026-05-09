import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // ── Admin Payment Settings ─────────────────────────────────────────────────
  Future<Map<String, String>> getPaymentNumbers() async {
    try {
      final doc = await _db.collection('settings').doc('payment').get();
      if (doc.exists) {
        final data = doc.data()!;
        return {
          'jazzcash': data['jazzcash'] ?? '',
          'easypaisa': data['easypaisa'] ?? '',
        };
      }
      return {'jazzcash': '', 'easypaisa': ''};
    } catch (e) {
      return {'jazzcash': '', 'easypaisa': ''};
    }
  }

  Future<void> updatePaymentNumbers({
    required String jazzcash,
    required String easypaisa,
  }) async {
    await _db.collection('settings').doc('payment').set({
      'jazzcash': jazzcash,
      'easypaisa': easypaisa,
      'updatedAt': DateTime.now().millisecondsSinceEpoch,
    });
  }

  Stream<Map<String, String>> paymentNumbersStream() {
    return _db
        .collection('settings')
        .doc('payment')
        .snapshots()
        .map((doc) {
      if (!doc.exists) return {'jazzcash': '', 'easypaisa': ''};
      final data = doc.data()!;
      return {
        'jazzcash': data['jazzcash'] ?? '',
        'easypaisa': data['easypaisa'] ?? '',
      };
    });
  }

  // ── Submit Payment Proof ───────────────────────────────────────────────────
  Future<void> submitPaymentProof({
    required String orderId,
    required String userId,
    required String method,
    required String transactionId,
    required String proofImageBase64,
  }) async {
    await _db.collection('orders').doc(orderId).update({
      'paymentMethod': method,
      'paymentStatus': 'proof_submitted',
      'transactionId': transactionId,
      'proofImageBase64': proofImageBase64,
      'proofSubmittedAt': DateTime.now().millisecondsSinceEpoch,
    });
  }

  // ── Admin: Verify or Reject Payment ───────────────────────────────────────
  Future<void> verifyPayment(String orderId, bool approved) async {
    await _db.collection('orders').doc(orderId).update({
      'paymentStatus': approved ? 'paid' : 'rejected',
      if (approved) 'status': 'confirmed',
      'verifiedAt': DateTime.now().millisecondsSinceEpoch,
    });
  }

  // ── Streams ────────────────────────────────────────────────────────────────
  Stream<List<PaymentRecord>> getUserPayments(String userId) {
    return _db
        .collection('orders')
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((snap) {
      final list = snap.docs
          .where((d) => d.data()['paymentMethod'] != 'cod')
          .map((doc) => PaymentRecord.fromMap(doc.data(), doc.id))
          .toList();
      list.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      return list;
    });
  }

  Stream<List<PaymentRecord>> getPendingProofs() {
    return _db
        .collection('orders')
        .where('paymentStatus', isEqualTo: 'proof_submitted')
        .snapshots()
        .map((snap) => snap.docs
            .map((doc) => PaymentRecord.fromMap(doc.data(), doc.id))
            .toList());
  }
}

class PaymentRecord {
  final String id;
  final String userId;
  final double amount;
  final String method;
  final String status;
  final String? transactionId;
  final String? proofImageBase64;
  final DateTime createdAt;

  PaymentRecord({
    required this.id,
    required this.userId,
    required this.amount,
    required this.method,
    required this.status,
    this.transactionId,
    this.proofImageBase64,
    required this.createdAt,
  });

  factory PaymentRecord.fromMap(Map<String, dynamic> map, String id) {
    return PaymentRecord(
      id: id,
      userId: map['userId'] ?? '',
      amount: (map['totalAmount'] ?? 0).toDouble(),
      method: map['paymentMethod'] ?? 'cod',
      status: map['paymentStatus'] ?? 'pending',
      transactionId: map['transactionId'],
      proofImageBase64: map['proofImageBase64'],
      createdAt: map['createdAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'])
          : DateTime.now(),
    );
  }
}
