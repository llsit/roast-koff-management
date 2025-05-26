import 'stock_item.dart';

class StockSummaryItem extends StockItem {
  String name;
  String category;
  String? summary;

  StockSummaryItem({required this.name, required this.category, this.summary});

  // Copy with method to create a new instance with some updated values
  StockSummaryItem copyWith({
    String? name,
    String? category,
    String? summary,
  }) {
    return StockSummaryItem(
      name: name ?? this.name,
      category: category ?? this.category,
      summary: summary ?? this.summary,
    );
  }
}
