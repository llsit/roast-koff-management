import 'stock_item.dart';

class StockCashRemainItem extends StockItem {
  String name;
  String category;
  String? value;
  String? summary;

  StockCashRemainItem({
    required this.name,
    required this.category,
    this.value,
    this.summary,
  });

  // Copy with method to create a new instance with some updated values
  StockCashRemainItem copyWith({
    String? name,
    String? category,
    String? value,
    String? summary,
  }) {
    return StockCashRemainItem(
      name: name ?? this.name,
      category: category ?? this.category,
      value: value ?? this.value,
      summary: summary ?? this.summary,
    );
  }
}
