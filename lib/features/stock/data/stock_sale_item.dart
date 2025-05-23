import 'package:roast_koff_management/features/stock/data/stock_item.dart';

class StockSalesItem extends StockItem {
  String name;
  String category;
  String? used;
  String? usedCustomer;
  String? summary;

  StockSalesItem({
    required this.name,
    required this.category,
    this.used,
    this.usedCustomer,
    this.summary,
  });
}
