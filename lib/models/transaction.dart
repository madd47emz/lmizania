class Transaction {
  int id;
  String title;
  double amount;
  DateTime date;
  bool type; // 1 Income or 0 Expense
  String category;

  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.type,
    required this.category,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
    id: json["id"],
    title: json["title"],
    amount: json["amount"],
    date: DateTime.parse(json["date"]),
    type: json["type"],
    category: json["category"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "amount": amount,
    "date": date.toString(),
    "type": type,
    "category": category,
  };
}
