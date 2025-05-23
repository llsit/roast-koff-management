import 'stock_item.dart';

class StockInventoryItem extends StockItem {
  String name;
  String category;
  String? value;
  String? used;
  String? remaining;

  StockInventoryItem({
    required this.name,
    required this.category,
    this.value,
    this.used,
    this.remaining,
  });

  // Copy with method to create a new instance with some updated values
  StockInventoryItem copyWith({
    String? name,
    String? category,
    String? value,
    String? used,
    String? remaining,
  }) {
    return StockInventoryItem(
      name: name ?? this.name,
      category: category ?? this.category,
      value: value ?? this.value,
      used: used ?? this.used,
      remaining: remaining ?? this.remaining,
    );
  }

  // Calculate the remaining stock based on the beginning stock and used values
  void calculateRemaining() {
    if (value != null &&
        used != null &&
        value!.isNotEmpty &&
        used!.isNotEmpty) {
      try {
        int begin = int.parse(value!);
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
      'value': value,
      'used': used,
      'remaining': remaining,
    };
  }

  // Create a StockItem from JSON
  factory StockInventoryItem.fromJson(Map<String, dynamic> json) {
    return StockInventoryItem(
      name: json['name'],
      category: json['category'],
      value: json['value'],
      used: json['used'],
      remaining: json['remaining'],
    );
  }
}
