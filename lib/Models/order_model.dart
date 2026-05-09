class OrderItem {
  final String coffeeId;
  final String coffeeName;
  final String coffeeImage;
  final double price;
  int quantity;

  OrderItem({
    required this.coffeeId,
    required this.coffeeName,
    required this.coffeeImage,
    required this.price,
    this.quantity = 1,
  });

  Map<String, dynamic> toMap() => {
        'coffeeId': coffeeId,
        'coffeeName': coffeeName,
        'coffeeImage': coffeeImage,
        'price': price,
        'quantity': quantity,
      };

  factory OrderItem.fromMap(Map<String, dynamic> map) => OrderItem(
        coffeeId: map['coffeeId'] ?? '',
        coffeeName: map['coffeeName'] ?? '',
        coffeeImage: map['coffeeImage'] ?? '',
        price: (map['price'] ?? 0).toDouble(),
        quantity: map['quantity'] ?? 1,
      );
}

class OrderModel {
  final String id;
  final String userId;
  final String userName;
  final String userAddress;
  final String userPhone;
  final List<OrderItem> items;
  final double totalAmount;
  final String status;
  final DateTime createdAt;
  final String? estimatedDelivery;

  // Payment fields
  final String paymentMethod;   // 'cod', 'jazzcash', 'easypaisa'
  final String paymentStatus;   // 'pending', 'proof_submitted', 'paid', 'rejected'
  final String? transactionId;
  final String? proofImageBase64;
  final DateTime? proofSubmittedAt;
  final DateTime? verifiedAt;

  OrderModel({
    required this.id,
    required this.userId,
    required this.userName,
    required this.userAddress,
    required this.userPhone,
    required this.items,
    required this.totalAmount,
    required this.status,
    required this.createdAt,
    this.estimatedDelivery,
    this.paymentMethod = 'cod',
    this.paymentStatus = 'pending',
    this.transactionId,
    this.proofImageBase64,
    this.proofSubmittedAt,
    this.verifiedAt,
  });

  factory OrderModel.fromMap(Map<String, dynamic> map, String id) {
    return OrderModel(
      id: id,
      userId: map['userId'] ?? '',
      userName: map['userName'] ?? '',
      userAddress: map['userAddress'] ?? '',
      userPhone: map['userPhone'] ?? '',
      items: (map['items'] as List<dynamic>? ?? [])
          .map((e) => OrderItem.fromMap(e))
          .toList(),
      totalAmount: (map['totalAmount'] ?? 0).toDouble(),
      status: map['status'] ?? 'pending',
      createdAt: map['createdAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'])
          : DateTime.now(),
      estimatedDelivery: map['estimatedDelivery'],
      paymentMethod: map['paymentMethod'] ?? 'cod',
      paymentStatus: map['paymentStatus'] ?? 'pending',
      transactionId: map['transactionId'],
      proofImageBase64: map['proofImageBase64'],
      proofSubmittedAt: map['proofSubmittedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['proofSubmittedAt'])
          : null,
      verifiedAt: map['verifiedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['verifiedAt'])
          : null,
    );
  }

  Map<String, dynamic> toMap() => {
        'userId': userId,
        'userName': userName,
        'userAddress': userAddress,
        'userPhone': userPhone,
        'items': items.map((e) => e.toMap()).toList(),
        'totalAmount': totalAmount,
        'status': status,
        'createdAt': createdAt.millisecondsSinceEpoch,
        'estimatedDelivery': estimatedDelivery,
        'paymentMethod': paymentMethod,
        'paymentStatus': paymentStatus,
        'transactionId': transactionId,
        'proofImageBase64': proofImageBase64,
        'proofSubmittedAt': proofSubmittedAt?.millisecondsSinceEpoch,
        'verifiedAt': verifiedAt?.millisecondsSinceEpoch,
      };
}
