import 'package:flutter/foundation.dart';

import '../data/stock_cash_remain_item.dart';
import '../data/stock_detail_item.dart';
import '../data/stock_inventory_item.dart';
import '../data/stock_item.dart';
import '../data/stock_sale_item.dart';

class StockTableProvider extends ChangeNotifier {
  // Stock data organized by category
  final Map<String, List<StockItem>> _stockData = {
    'leftInventory': [
      StockInventoryItem(name: 'แก้วเย็น', category: 'left'),
      StockInventoryItem(name: 'แก้วร้อน', category: 'left'),
      StockInventoryItem(name: 'ฝาเรียบ', category: 'left'),
      StockInventoryItem(name: 'ฝาร้อน', category: 'left'),
      StockInventoryItem(name: 'เอสเพรสโซ่', category: 'left'),
      StockInventoryItem(name: 'เข้ม', category: 'left'),
      StockInventoryItem(name: 'กลาง', category: 'left'),
      StockInventoryItem(name: 'อ่อน', category: 'left'),
      StockInventoryItem(name: 'มัทฉะ', category: 'left'),
      StockInventoryItem(name: 'ซาเชียร', category: 'left'),
      StockInventoryItem(name: 'ชาแดง', category: 'left'),
      StockInventoryItem(name: 'โอวัลติน', category: 'left'),
      StockInventoryItem(name: 'ไมโล', category: 'left'),
      StockInventoryItem(name: 'โกโก้', category: 'left'),
      StockInventoryItem(name: 'ชาเนสที', category: 'left'),
      StockInventoryItem(name: 'ซาแอปเปิ้ล', category: 'left'),
      StockInventoryItem(name: 'ชาพีช', category: 'left'),
      StockInventoryItem(name: 'ชามะนาว', category: 'left'),
      StockInventoryItem(name: 'ผงมะนาว', category: 'left'),
      StockInventoryItem(name: 'ชาเอิลเกร', category: 'left'),
      StockInventoryItem(name: 'ไวท์มอลต์', category: 'left'),
      StockInventoryItem(name: 'ช็อคน้ำ', category: 'left'),
      StockInventoryItem(name: 'น้ำตาลอ้อย', category: 'left'),
      StockInventoryItem(name: 'คอฟฟี่เมท', category: 'left'),
      StockInventoryItem(name: 'นมข้นจืด', category: 'left'),
    ],
    'rightInventory': [
      StockInventoryItem(name: 'นมข้นหวาน', category: 'right'),
      StockInventoryItem(name: 'นมสดฝาน้ำเงิน', category: 'right'),
      StockInventoryItem(name: 'นมสดฝาขาว', category: 'right'),
      StockInventoryItem(name: 'ชาเขียวมะนาว', category: 'right'),
      StockInventoryItem(name: 'หลอดเล็ก', category: 'right'),
      StockInventoryItem(name: 'หลอดร้อน', category: 'right'),
      StockInventoryItem(name: 'ถุงเดี่ยว', category: 'right'),
      StockInventoryItem(name: 'ถุงคู่', category: 'right'),
      StockInventoryItem(name: 'ทิชชู่', category: 'right'),
      StockInventoryItem(name: 'โซดา', category: 'right'),
      StockInventoryItem(name: 'น้ำผึ้ง', category: 'right'),
      StockInventoryItem(name: 'น้ำส้ม', category: 'right'),
      StockInventoryItem(name: 'น้ำมะพร้าว', category: 'right'),
      StockInventoryItem(name: 'ไซรัปมะพร้าว', category: 'right'),
      StockInventoryItem(name: 'สตอเบอร์รี่', category: 'right'),
      StockInventoryItem(name: 'คิวี่', category: 'right'),
      StockInventoryItem(name: 'แอปเปิ้ล', category: 'right'),
      StockInventoryItem(name: 'บลูเบอร์รี่', category: 'right'),
      StockInventoryItem(name: 'บลูเลมอน', category: 'right'),
      StockInventoryItem(name: 'แคตคาลูป', category: 'right'),
      StockInventoryItem(name: 'เฮลบลูบอย', category: 'right'),
      StockInventoryItem(name: 'คาราเมล', category: 'right'),
      StockInventoryItem(name: 'วานิลลา', category: 'right'),
      StockInventoryItem(name: 'ไวท์ช็อค', category: 'right'),
      StockInventoryItem(name: 'น้ำตาลซอง', category: 'right'),
      StockInventoryItem(name: 'คอฟฟีเมทซอง', category: 'right'),
    ],
    'sales': [
      StockSalesItem(name: 'ร้อน', category: 'top'),
      StockSalesItem(name: 'เย็น', category: 'top'),
      StockSalesItem(name: 'ปั่น', category: 'top'),
      StockSalesItem(name: 'เงินเชียร์ +15', category: 'top'),
      StockSalesItem(name: 'เงินทอนเชียร์ +5', category: 'top'),
      StockSalesItem(name: 'แก้วฟรี', category: 'top'),
    ],
    'cashSummary': [
      StockSummaryItem(name: 'เงินสด', category: 'leftBottom'),
      StockSummaryItem(name: 'โอน', category: 'leftBottom'),
      StockSummaryItem(name: 'เงินทอน', category: 'leftBottom'),
      StockSummaryItem(name: 'ทิป', category: 'leftBottom'),
      StockSummaryItem(name: 'เกิน', category: 'leftBottom'),
      StockSummaryItem(name: 'ขาด', category: 'leftBottom'),
      StockSummaryItem(name: 'รวม', category: 'leftBottom'),
    ],
    'cashDetails': [
      StockCashRemainItem(name: '1000', category: 'bottom'),
      StockCashRemainItem(name: '500', category: 'bottom'),
      StockCashRemainItem(name: '100', category: 'bottom'),
      StockCashRemainItem(name: '50', category: 'bottom'),
      StockCashRemainItem(name: '20', category: 'bottom'),
      StockCashRemainItem(name: 'เหรียญ', category: 'bottom'),
    ],
  };

  Map<String, List<StockItem>> get stockData => _stockData;

  List<StockItem> getTable(String title) => _stockData[title]!;

  void updateInventoryUsed(String category, double value, int index) {
    final list = _stockData[category];

    if (list == null || index >= list.length) return;

    final item = list[index];

    if (item is StockInventoryItem) {
      final updatedItem = item.copyWith(used: value.toString());

      _stockData[category]![index] = updatedItem;
      notifyListeners();
    }
  }

  void updateInventory(String category, double value, int index) {
    final list = _stockData[category];

    if (list == null || index >= list.length) return;

    final item = list[index];

    if (item is StockInventoryItem) {
      final updatedItem = item.copyWith(value: value.toString());

      _stockData[category]![index] = updatedItem;
      notifyListeners();
    }
  }

  void updateRemaining(String category, double value, int index) {
    final list = _stockData[category];

    if (list == null || index >= list.length) return;

    final item = list[index];
    if (item is StockInventoryItem) {
      item.calculateRemaining();
      notifyListeners();
    }
  }
}
