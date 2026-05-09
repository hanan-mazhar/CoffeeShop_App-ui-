import 'package:cloud_firestore/cloud_firestore.dart';
import '../Models/order_model.dart';

class OrderService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Place new order
  Future<String?> placeOrder(OrderModel order) async {
    try {
      DocumentReference ref = await _db.collection('orders').add(order.toMap());
      return ref.id;
    } catch (e) {
      return null;
    }
  }

  // Get user orders — NO composite index needed (filter in-memory after single-field query)
  Stream<List<OrderModel>> getUserOrders(String userId) {
    return _db
        .collection('orders')
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((snap) {
      final orders = snap.docs
          .map((doc) => OrderModel.fromMap(doc.data(), doc.id))
          .toList();
      // Sort client-side to avoid needing a composite Firestore index
      orders.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      return orders;
    });
  }

  // Get single order
  Stream<OrderModel?> getOrder(String orderId) {
    return _db.collection('orders').doc(orderId).snapshots().map((doc) {
      if (doc.exists) {
        return OrderModel.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }
      return null;
    });
  }

  // Admin: Get all orders — sort client-side
  Stream<List<OrderModel>> getAllOrders() {
    return _db.collection('orders').snapshots().map((snap) {
      final orders = snap.docs
          .map((doc) => OrderModel.fromMap(doc.data(), doc.id))
          .toList();
      orders.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      return orders;
    });
  }

  // Admin: Update order status
  Future<bool> updateOrderStatus(String orderId, String status) async {
    try {
      await _db.collection('orders').doc(orderId).update({'status': status});
      return true;
    } catch (e) {
      return false;
    }
  }
}
