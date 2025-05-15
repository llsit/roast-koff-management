class StockItem {
  String name;
  String category;
  String? quantity1;  // แก้ว/จำนวน
  String? quantity2;  // เยติ
  String? value;      // จำนวนเงิน
  String? beginStock; // เริ่มต้น/เติมสต๊อก
  String? used;       // ใช้ไป/ยอดรวม
  String? remaining;  // เหลือ

  StockItem({
    required this.name,
    required this.category,
    this.quantity1,
    this.quantity2,
    this.value,
    this.beginStock,
    this.used,
    this.remaining,
  });

  // Copy with method to create a new instance with some updated values
  StockItem copyWith({
    String? name,
    String? category,
    String? quantity1,
    String? quantity2,
    String? value,
    String? beginStock,
    String? used,
    String? remaining,
  }) {
    return StockItem(
      name: name ?? this.name,
      category: category ?? this.category,
      quantity1: quantity1 ?? this.quantity1,
      quantity2: quantity2 ?? this.quantity2,
      value: value ?? this.value,
      beginStock: beginStock ?? this.beginStock,
      used: used ?? this.used,
      remaining: remaining ?? this.remaining,
    );
  }

  // Calculate the remaining stock based on the beginning stock and used values
  void calculateRemaining() {
    if (beginStock != null && used != null &&
        beginStock!.isNotEmpty && used!.isNotEmpty) {
      try {
        int begin = int.parse(beginStock!);
        int usedAmount = int.parse(used!);
        int remain = begin - usedAmount;
        remaining = remain.toString();
      } catch (e) {
        // Handle parsing errors
        remaining = '';
      }
    }
  }

  // Convert to JSON for storage
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'category': category,
      'quantity1': quantity1,
      'quantity2': quantity2,
      'value': value,
      'beginStock': beginStock,
      'used': used,
      'remaining': remaining,
    };
  }

  // Create a StockItem from JSON
  factory StockItem.fromJson(Map<String, dynamic> json) {
    return StockItem(
      name: json['name'],
      category: json['category'],
      quantity1: json['quantity1'],
      quantity2: json['quantity2'],
      value: json['value'],
      beginStock: json['beginStock'],
      used: json['used'],
      remaining: json['remaining'],
    );
  }
}