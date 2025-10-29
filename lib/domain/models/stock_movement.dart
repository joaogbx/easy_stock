class StockMovement {
  final int id;
  final String type;
  final DateTime createdAt;
  final int quantity;
  final int companyId;
  final int productId;
  final int userId;

  StockMovement({
    required this.id,
    required this.type,
    required this.createdAt,
    required this.quantity,
    required this.companyId,
    required this.productId,
    required this.userId,
  });

  factory StockMovement.fromJson(Map<String, dynamic> json) {
    return StockMovement(
      id: json['id'],
      type: json['type'],
      createdAt: DateTime.parse(json['created_at']),
      quantity: json['quantity'],
      companyId: json['company_id'],
      productId: json['product_id'],
      userId: json['user_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'created_at': createdAt.toIso8601String(),
      'quantity': quantity,
      'company_id': companyId,
      'product_id': productId,
      'user_id': userId,
    };
  }

  StockMovement copyWith({
    int? id,
    String? type,
    DateTime? createdAt,
    int? quantity,
    int? companyId,
    int? productId,
    int? userId,
  }) {
    return StockMovement(
      id: id ?? this.id,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      quantity: quantity ?? this.quantity,
      companyId: companyId ?? this.companyId,
      productId: productId ?? this.productId,
      userId: userId ?? this.userId,
    );
  }
}
