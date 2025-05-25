import 'package:roast_koff_management/features/stock/data/stock_item.dart';

class StockSalesItem extends StockItem {
  String name;
  String category;
  String? price;
  String? used;
  String? usedCustomer;
  String? summary;

  StockSalesItem({
    required this.name,
    required this.category,
    this.price,
    this.used,
    this.usedCustomer,
    this.summary,
  });

  // Copy with method to create a new instance with some updated values
  StockSalesItem copyWith({
    String? name,
    String? category,
    String? price,
    String? used,
    String? usedCustomer,
    String? summary,
  }) {
    return StockSalesItem(
      name: name ?? this.name,
      category: category ?? this.category,
      price: price ?? this.price,
      used: used ?? this.used,
      usedCustomer: usedCustomer ?? this.usedCustomer,
      summary: summary ?? this.summary,
    );
  }

  // Calculate the summary sales based on the beginning stock and used values
  void calculateRemaining() {
    if (used != null &&
        usedCustomer != null &&
        price != null &&
        used!.isNotEmpty &&
        usedCustomer!.isNotEmpty &&
        price!.isNotEmpty) {
      try {
        double usedAmount = double.parse(used!);
        double usedCustomerAmount = double.parse(usedCustomer!);
        double priceAmount = double.parse(price!);
        double summaryAmount = (usedAmount + usedCustomerAmount) * priceAmount;
        summary = summaryAmount.toString();
      } catch (e) {
        // Handle parsing errors
        summary = '';
      }
    }
  }
}
