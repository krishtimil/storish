class Transaction {
  int id;
  final int user;
  final double price;
  final int quantity;
  final String product;
  final String category;
  final DateTime timestamp;
  bool basic;

  Transaction({
    this.id = 1000,
    required this.user,
    required this.price,
    required this.quantity,
    required this.product,
    required this.category,
    required this.timestamp,
    this.basic = false,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      user: json['user'],
      price: json['price'],
      quantity: json['quantity'],
      product: json['product'],
      category: json['category'],
      timestamp: DateTime.parse(json['timestamp']),
      basic: json['basic'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'user': user,
        'price': price,
        'quantity': quantity,
        'product': product,
        'category': category,
        'timestamp': timestamp.toIso8601String(),
        'basic': basic,
      };
}
