class Transaction {
  int id;
  final int user;
  final int price;
  final int quantity;
  final String product;
  final String category;
  int timestamp;
  bool basic;

  Transaction({
    this.id = 1000,
    required this.user,
    required this.price,
    required this.quantity,
    required this.product,
    required this.category,
    this.timestamp = 0,
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
      timestamp: int.parse(json['timestamp']),
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
        'timestamp': timestamp,
        'basic': basic,
      };
}
