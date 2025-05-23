import 'stock_item.dart';

class StockSummaryItem extends StockItem {
  String name;
  String category;
  String? summary;

  StockSummaryItem({required this.name, required this.category, this.summary});
}
