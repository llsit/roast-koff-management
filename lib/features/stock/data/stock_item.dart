class StockItem {
  final String name;
  final String category;
  String value;
  String quantity1;
  String quantity2;
  String beginStock;
  String used;
  String remaining;

  StockItem({
    required this.name,
    required this.category,
    this.value = '',
    this.quantity1 = '',
    this.quantity2 = '',
    this.beginStock = '',
    this.used = '',
    this.remaining = '',
  });
}
