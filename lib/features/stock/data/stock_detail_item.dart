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
}
