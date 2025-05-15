import 'package:flutter/material.dart';

import '../../../../core/utils/constants.dart';
import '../../data/stock_item.dart';
import '../widgets/custom_data_table.dart';
import '../widgets/number_input_field.dart';

class AddStockScreen extends StatefulWidget {
  const AddStockScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AddStockScreenState();
}

class _AddStockScreenState extends State<AddStockScreen> {
  final TextEditingController _dateController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    // _dateController.text = DateFormat('dd/MM/yyyy').format(_selectedDate);
  }

  @override
  void dispose() {
    // _dateController.dispose();
    super.dispose();
  }

  // Stock data organized by category
  final Map<String, List<StockItem>> _stockData = {
    'sales': [
      StockItem(name: 'ร้อน', category: 'top'),
      StockItem(name: 'เย็น', category: 'top'),
      StockItem(name: 'ปั่น', category: 'top'),
      StockItem(name: 'เงินเชียร์ +15', category: 'top'),
      StockItem(name: 'เงินทอนเชียร์ +5', category: 'top'),
      StockItem(name: 'แก้วฟรี', category: 'top'),
    ],
    'leftInventory': [
      StockItem(name: 'แก้วเย็น', category: 'left'),
      StockItem(name: 'แก้วร้อน', category: 'left'),
      StockItem(name: 'ฝาเรียบ', category: 'left'),
      StockItem(name: 'ฝาร้อน', category: 'left'),
      StockItem(name: 'เอสเพรสโซ่', category: 'left'),
      StockItem(name: 'เข้ม', category: 'left'),
      StockItem(name: 'กลาง', category: 'left'),
      StockItem(name: 'อ่อน', category: 'left'),
      StockItem(name: 'มัทฉะ', category: 'left'),
      StockItem(name: 'ซาเชียร', category: 'left'),
      StockItem(name: 'ชาแดง', category: 'left'),
      StockItem(name: 'โอวัลติน', category: 'left'),
      StockItem(name: 'ไมโล', category: 'left'),
      StockItem(name: 'โกโก้', category: 'left'),
      StockItem(name: 'ชาเนสที', category: 'left'),
      StockItem(name: 'ซาแอปเปิ้ล', category: 'left'),
      StockItem(name: 'ชาพีช', category: 'left'),
      StockItem(name: 'ชามะนาว', category: 'left'),
      StockItem(name: 'ผงมะนาว', category: 'left'),
      StockItem(name: 'ชาเอิลเกร', category: 'left'),
      StockItem(name: 'ไวท์มอลต์', category: 'left'),
      StockItem(name: 'ช็อคน้ำ', category: 'left'),
      StockItem(name: 'น้ำตาลอ้อย', category: 'left'),
      StockItem(name: 'คอฟฟี่เมท', category: 'left'),
      StockItem(name: 'นมข้นจืด', category: 'left'),
    ],
    'rightInventory': [
      StockItem(name: 'นมข้นหวาน', category: 'right'),
      StockItem(name: 'นมสดฝาน้ำเงิน', category: 'right'),
      StockItem(name: 'นมสดฝาขาว', category: 'right'),
      StockItem(name: 'ชาเขียวมะนาว', category: 'right'),
      StockItem(name: 'หลอดเล็ก', category: 'right'),
      StockItem(name: 'หลอดร้อน', category: 'right'),
      StockItem(name: 'ถุงเดี่ยว', category: 'right'),
      StockItem(name: 'ถุงคู่', category: 'right'),
      StockItem(name: 'ทิชชู่', category: 'right'),
      StockItem(name: 'โซดา', category: 'right'),
      StockItem(name: 'น้ำผึ้ง', category: 'right'),
      StockItem(name: 'น้ำส้ม', category: 'right'),
      StockItem(name: 'น้ำมะพร้าว', category: 'right'),
      StockItem(name: 'ไซรัปมะพร้าว', category: 'right'),
      StockItem(name: 'สตอเบอร์รี่', category: 'right'),
      StockItem(name: 'คิวี่', category: 'right'),
      StockItem(name: 'แอปเปิ้ล', category: 'right'),
      StockItem(name: 'บลูเบอร์รี่', category: 'right'),
      StockItem(name: 'บลูเลมอน', category: 'right'),
      StockItem(name: 'แคตคาลูป', category: 'right'),
      StockItem(name: 'เฮลบลูบอย', category: 'right'),
      StockItem(name: 'คาราเมล', category: 'right'),
      StockItem(name: 'วานิลลา', category: 'right'),
      StockItem(name: 'ไวท์ช็อค', category: 'right'),
      StockItem(name: 'น้ำตาลซอง', category: 'right'),
      StockItem(name: 'คอฟฟีเมทซอง', category: 'right'),
    ],
    'cashSummary': [
      StockItem(name: 'เงินสด', category: 'leftBottom'),
      StockItem(name: 'โอน', category: 'leftBottom'),
      StockItem(name: 'เงินทอน', category: 'leftBottom'),
      StockItem(name: 'ทิป', category: 'leftBottom'),
      StockItem(name: 'เกิน', category: 'leftBottom'),
      StockItem(name: 'ขาด', category: 'leftBottom'),
      StockItem(name: 'รวม', category: 'leftBottom'),
    ],
    'cashDetails': [
      StockItem(name: '1000', category: 'bottom'),
      StockItem(name: '500', category: 'bottom'),
      StockItem(name: '100', category: 'bottom'),
      StockItem(name: '50', category: 'bottom'),
      StockItem(name: '20', category: 'bottom'),
      StockItem(name: 'เหรียญ', category: 'bottom'),
    ],
  };

  // Function to update stock item values
  void _updateStockItemValue(StockItem item, String value, {String? column}) {
    setState(() {
      switch (column) {
        case 'แก้ว':
        case 'แพค':
          item.quantity1 = value;
          break;
        case 'จำนวนเงิน':
          item.quantity2 = value;
          break;
        case 'เริ่มต็อก':
          item.beginStock = value;
          break;
        case 'ใช้ไป':
          item.used = value;
          break;
        case 'เหลือ':
          item.remaining = value;
          break;
        default:
          item.value = value;
      }
    });
  }

  // Show a snackbar message
  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        width: 300,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  // Save stock data
  void _saveStockData() {
    // TODO: Implement save functionality to database or file
    _showMessage('บันทึกข้อมูลเรียบร้อย');
  }

  // Print stock data
  void _printStockData() {
    // TODO: Implement print functionality
    _showMessage('กำลังพิมพ์เอกสาร');
  }

  // Reset stock data
  void _resetStockData() {
    setState(() {
      _stockData.forEach((key, items) {
        for (var item in items) {
          item.quantity1 = '';
          item.quantity2 = '';
          item.value = '';
          item.beginStock = '';
          item.used = '';
          item.remaining = '';
        }
      });
    });
    _showMessage('รีเซ็ตข้อมูลเรียบร้อย');
  }

  // Show date picker
  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        // _dateController.text = DateFormat('dd/MM/yyyy').format(_selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'นับสต๊อก',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 2,
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveStockData,
            tooltip: 'บันทึก',
          ),
          IconButton(
            icon: const Icon(Icons.print),
            onPressed: _printStockData,
            tooltip: 'พิมพ์',
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return constraints.maxWidth < 600
              ? _buildMobileLayout()
              : _buildDesktopLayout();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _resetStockData,
        backgroundColor: AppColors.primary,
        tooltip: 'รีเซ็ตข้อมูล',
        child: const Icon(Icons.refresh),
      ),
    );
  }

  // Mobile layout
  Widget _buildMobileLayout() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _buildDateSection(),
            _buildInventorySection(
              _stockData['leftInventory']!,
              'วัตถุดิบ (1)',
            ),
            _buildSalesSection(),
            _buildInventorySection(
              _stockData['rightInventory']!,
              'วัตถุดิบ (2)',
            ),
            _buildCashSummarySection(),
            _buildCashDetailsSection(),
          ],
        ),
      ),
    );
  }

  // Desktop/Tablet layout
  Widget _buildDesktopLayout() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildDateSection(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _buildInventorySection(
                    _stockData['leftInventory']!,
                    'วัตถุดิบ (1)',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildInventorySection(
                    _stockData['rightInventory']!,
                    'วัตถุดิบ (2)',
                  ),
                ),
              ],
            ),
            _buildSalesSection(),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildCashSummarySection()),
                const SizedBox(width: 16),
                Expanded(child: _buildCashDetailsSection()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Date selection section
  Widget _buildDateSection() {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _dateController,
                decoration: InputDecoration(
                  labelText: 'วันที่',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  prefixIcon: const Icon(
                    Icons.calendar_today,
                    color: AppColors.primary,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: AppColors.primary,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                readOnly: true,
                onTap: _selectDate,
              ),
            ),
            const SizedBox(width: 16),
            ElevatedButton.icon(
              onPressed: () {
                // TODO: Submit data for selected date
                _showMessage('ข้อมูลของวันที่ ${_dateController.text}');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              icon: const Icon(Icons.check),
              label: const Text("ตกลง"),
            ),
          ],
        ),
      ),
    );
  }

  // Sales section
  Widget _buildSalesSection() {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.monetization_on, color: AppColors.primary),
                const SizedBox(width: 8),
                Text(
                  'ยอดขาย',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            const Divider(height: 24),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: CustomDataTable(
                columns: const [
                  DataColumn(label: Text('ยอดขาย')),
                  DataColumn(label: Text('แก้ว')),
                  DataColumn(label: Text('เยติ')),
                  DataColumn(
                    label: Text(
                      'จำนวนเงิน',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(label: Text('รายจ่ายอื่นๆ')),
                  DataColumn(
                    label: Text(
                      'จำนวนเงิน',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
                rows:
                    _stockData['sales']!.map((item) {
                      return DataRow(
                        cells: [
                          DataCell(Text(item.name)),
                          DataCell(
                            NumberInputField(
                              value: item.quantity1,
                              onChanged:
                                  (value) => _updateStockItemValue(
                                    item,
                                    value,
                                    column: 'แก้ว',
                                  ),
                            ),
                          ),
                          DataCell(
                            NumberInputField(
                              value: item.quantity2,
                              onChanged:
                                  (value) => _updateStockItemValue(
                                    item,
                                    value,
                                    column: 'เยติ',
                                  ),
                            ),
                          ),
                          DataCell(
                            NumberInputField(
                              value: item.value,
                              onChanged:
                                  (value) => _updateStockItemValue(
                                    item,
                                    value,
                                    column: 'จำนวนเงิน',
                                  ),
                            ),
                          ),
                          DataCell(
                            NumberInputField(
                              value: item.beginStock,
                              onChanged:
                                  (value) => _updateStockItemValue(item, value),
                              width: 120,
                            ),
                          ),
                          DataCell(
                            NumberInputField(
                              value: item.used,
                              onChanged:
                                  (value) => _updateStockItemValue(item, value),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Inventory section
  Widget _buildInventorySection(List<StockItem> items, String title) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.inventory_2, color: AppColors.primary),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            const Divider(height: 24),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: CustomDataTable(
                columns: const [
                  DataColumn(label: Text('รายการ')),
                  DataColumn(label: Text('เติมสต๊อก')),
                  DataColumn(label: Text('ใช้ไป')),
                  DataColumn(label: Text('เหลือ')),
                ],
                rows:
                    items.map((item) {
                      return DataRow(
                        cells: [
                          DataCell(Text(item.name)),
                          DataCell(
                            NumberInputField(
                              value: item.beginStock,
                              onChanged:
                                  (value) => _updateStockItemValue(
                                    item,
                                    value,
                                    column: 'เริ่มต็อก',
                                  ),
                            ),
                          ),
                          DataCell(
                            NumberInputField(
                              value: item.used,
                              onChanged:
                                  (value) => _updateStockItemValue(
                                    item,
                                    value,
                                    column: 'ใช้ไป',
                                  ),
                            ),
                          ),
                          DataCell(
                            NumberInputField(
                              value: item.remaining,
                              onChanged:
                                  (value) => _updateStockItemValue(
                                    item,
                                    value,
                                    column: 'เหลือ',
                                  ),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Cash summary section
  Widget _buildCashSummarySection() {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.payments, color: AppColors.primary),
                const SizedBox(width: 8),
                Text(
                  'ยอดเงินรวม',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            const Divider(height: 24),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: CustomDataTable(
                columns: const [
                  DataColumn(label: Text('รายการ')),
                  DataColumn(label: Text('จำนวนเงิน')),
                ],
                rows:
                    _stockData['cashSummary']!.map((item) {
                      return DataRow(
                        cells: [
                          DataCell(Text(item.name)),
                          DataCell(
                            NumberInputField(
                              value: item.beginStock,
                              onChanged:
                                  (value) => _updateStockItemValue(
                                    item,
                                    value,
                                    column: 'จำนวนเงิน',
                                  ),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Cash details section
  Widget _buildCashDetailsSection() {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.attach_money, color: AppColors.primary),
                const SizedBox(width: 8),
                Text(
                  'ยอดเงินคงเหลือ',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            const Divider(height: 24),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: CustomDataTable(
                columns: const [
                  DataColumn(label: Text('รายการ')),
                  DataColumn(label: Text('จำนวน')),
                  DataColumn(label: Text('ยอดรวม')),
                ],
                rows:
                    _stockData['cashDetails']!.map((item) {
                      return DataRow(
                        cells: [
                          DataCell(Text(item.name)),
                          DataCell(
                            NumberInputField(
                              value: item.beginStock,
                              onChanged:
                                  (value) => _updateStockItemValue(
                                    item,
                                    value,
                                    column: 'จำนวน',
                                  ),
                            ),
                          ),
                          DataCell(
                            NumberInputField(
                              value: item.used,
                              onChanged:
                                  (value) => _updateStockItemValue(
                                    item,
                                    value,
                                    column: 'ยอดรวม',
                                  ),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
