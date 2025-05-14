import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../data/stock_item.dart';

class AddStockScreen extends StatefulWidget {
  const AddStockScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AddStockScreenState();
}

class _AddStockScreenState extends State<AddStockScreen> {
  // List of stock items from the form
  final List<StockItem> topItems = [
    StockItem(name: 'ร้อน', category: 'top'),
    StockItem(name: 'เย็น', category: 'top'),
    StockItem(name: 'ปั่น', category: 'top'),
    StockItem(name: 'เงินเชียร์ +15', category: 'top'),
    StockItem(name: 'เงินทอนเชียร์ +5', category: 'top'),
    StockItem(name: 'แก้วฟรี', category: 'top'),
  ];

  final List<StockItem> leftItems = [
    StockItem(name: 'แก้วเย็น', category: 'left'),
    StockItem(name: 'แก้วร้อน', category: 'left'),
    StockItem(name: 'ฝาร้อน', category: 'left'),
    StockItem(name: 'ฝาเย็น', category: 'left'),
    StockItem(name: 'เฮลท์แพกโจ้', category: 'left'),
    StockItem(name: 'หลอด', category: 'left'),
    StockItem(name: 'กลาง', category: 'left'),
    StockItem(name: 'ส้อม', category: 'left'),
    StockItem(name: 'มีดจะ', category: 'left'),
    StockItem(name: 'ซาเชียร', category: 'left'),
    StockItem(name: 'ซามอง', category: 'left'),
    StockItem(name: 'ไซวิดอิน', category: 'left'),
    StockItem(name: 'โบวิต', category: 'left'),
    StockItem(name: 'โกวิต', category: 'left'),
    StockItem(name: 'ซาแมคกี้', category: 'left'),
    StockItem(name: 'ซาแอปเปิ้ล', category: 'left'),
    StockItem(name: 'ซาวิตึ้', category: 'left'),
    StockItem(name: 'ซามะนาว', category: 'left'),
    StockItem(name: 'ซามะนาว', category: 'left'),
    StockItem(name: 'ซาเปลือกส้ม', category: 'left'),
    StockItem(name: 'ไซวิดลอด', category: 'left'),
  ];

  final List<StockItem> rightItems = [
    StockItem(name: 'หลอดเล็ก', category: 'right'),
    StockItem(name: 'หลอดร้อน', category: 'right'),
    StockItem(name: 'ถุงเชียร์', category: 'right'),
    StockItem(name: 'ถุงยู', category: 'right'),
    StockItem(name: 'ฝาคัฟ', category: 'right'),
    StockItem(name: 'โจ๊กา', category: 'right'),
    StockItem(name: 'น้ำผึ้ง', category: 'right'),
    StockItem(name: 'น้ำตาล', category: 'right'),
    StockItem(name: 'น้ำแบะแซว', category: 'right'),
    StockItem(name: 'โรวิโมะแซว', category: 'right'),
    StockItem(name: 'สตอเบอร์รี่', category: 'right'),
    StockItem(name: 'คิวี่', category: 'right'),
    StockItem(name: 'แอปเปิ้ล', category: 'right'),
    StockItem(name: 'บลูเบอร์รี่', category: 'right'),
    StockItem(name: 'บลูเลมอน', category: 'right'),
    StockItem(name: 'แคตคาลูย', category: 'right'),
    StockItem(name: 'เชพคูเลอม', category: 'right'),
    StockItem(name: 'ดาว์นอล', category: 'right'),
    StockItem(name: 'วานิลลา', category: 'right'),
    StockItem(name: 'โววิช็อต', category: 'right'),
    StockItem(name: 'น้ำเกาตอง', category: 'right'),
    StockItem(name: 'คอฟฟีเมทตอง', category: 'right'),
  ];

  final List<StockItem> bottomItems = [
    StockItem(name: 'น้ำขวดย่อย', category: 'bottom'),
    StockItem(name: 'คอฟฟี่มาท', category: 'bottom', value: '1000'),
    StockItem(name: 'นมข้นจืด', category: 'bottom', value: '500'),
    StockItem(name: 'นมข้นหวาน', category: 'bottom', value: '100'),
    StockItem(name: 'แม่สตส่งน้ำเย็น', category: 'bottom', value: '50'),
    StockItem(name: 'แม่สตส่งชา', category: 'bottom', value: '20'),
    StockItem(name: 'ซาเชียรนมสาร', category: 'bottom', value: 'เหรียญ'),
  ];

  // Function to update stock item values
  void updateStockItemValue(StockItem item, String value, {String? column}) {
    setState(() {
      if (column == 'แก้ว' || column == 'แพค') {
        item.quantity1 = value;
      } else if (column == 'จำนวนเงิน') {
        item.quantity2 = value;
      } else if (column == 'เริ่มต็อก') {
        item.beginStock = value;
      } else if (column == 'ใช้ไป') {
        item.used = value;
      } else if (column == 'เหลือ') {
        item.remaining = value;
      } else {
        // Default value update
        item.value = value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('นับสต๊อก'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              // TODO: Implement save functionality
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('บันทึกข้อมูลเรียบร้อย')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.print),
            onPressed: () {
              // TODO: Implement print functionality
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('พิมพ์เอกสาร')));
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Responsive layout based on screen width
          if (constraints.maxWidth < 600) {
            // Mobile layout
            return SingleChildScrollView(
              child: Column(
                children: [
                  _buildDateSection(),
                  _buildTopSection(),
                  _buildItemsSection(context, constraints),
                  _buildBottomSection(),
                  _buildTotalSection(),
                ],
              ),
            );
          } else {
            // Tablet/PC layout
            return SingleChildScrollView(
              child: Column(
                children: [
                  Row(children: [Expanded(child: _buildDateSection())]),
                  _buildTopSection(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _buildItemList(leftItems, context, constraints),
                      ),
                      Expanded(
                        child: _buildItemList(rightItems, context, constraints),
                      ),
                    ],
                  ),
                  _buildBottomSection(),
                  _buildTotalSection(),
                ],
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Reset or add new item functionality
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('รีเซ็ตข้อมูล')));
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }

  Widget _buildDateSection() {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'วันที่',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.calendar_today),
                ),
                readOnly: true,
                onTap: () async {
                  // Show date picker functionality
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'กะ',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.access_time),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopSection() {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'ยอดขาย',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 20,
                columns: const [
                  DataColumn(label: Text('ยอดขาย')),
                  DataColumn(label: Text('แก้ว')),
                  DataColumn(label: Text('แพค')),
                  DataColumn(label: Text('จำนวนเงิน')),
                  DataColumn(label: Text('โอน')),
                  DataColumn(label: Text('รายจ่าย')),
                  DataColumn(label: Text('จำนวนเงิน')),
                  DataColumn(label: Text('จำนวนเงินยอดขวด')),
                ],
                rows:
                    topItems.map((item) {
                      return DataRow(
                        cells: [
                          DataCell(Text(item.name)),
                          DataCell(
                            _buildNumberInput(
                              value: item.quantity1,
                              onChanged:
                                  (value) => updateStockItemValue(
                                    item,
                                    value,
                                    column: 'แก้ว',
                                  ),
                            ),
                          ),
                          DataCell(
                            _buildNumberInput(
                              value: item.quantity2,
                              onChanged:
                                  (value) => updateStockItemValue(
                                    item,
                                    value,
                                    column: 'แพค',
                                  ),
                            ),
                          ),
                          DataCell(
                            _buildNumberInput(
                              value: item.value,
                              onChanged:
                                  (value) => updateStockItemValue(
                                    item,
                                    value,
                                    column: 'จำนวนเงิน',
                                  ),
                            ),
                          ),
                          DataCell(
                            _buildNumberInput(
                              value: item.beginStock,
                              onChanged:
                                  (value) => updateStockItemValue(item, value),
                            ),
                          ),
                          DataCell(
                            _buildNumberInput(
                              value: item.used,
                              onChanged:
                                  (value) => updateStockItemValue(item, value),
                            ),
                          ),
                          DataCell(
                            _buildNumberInput(
                              value: item.remaining,
                              onChanged:
                                  (value) => updateStockItemValue(item, value),
                            ),
                          ),
                          DataCell(Text(item.value)),
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

  Widget _buildItemsSection(BuildContext context, BoxConstraints constraints) {
    if (constraints.maxWidth < 600) {
      // Mobile layout - items stacked vertically
      return Column(
        children: [
          _buildItemList(leftItems, context, constraints),
          _buildItemList(rightItems, context, constraints),
        ],
      );
    } else {
      // This is handled in the main build method for tablet/desktop
      return Container();
    }
  }

  Widget _buildItemList(
    List<StockItem> items,
    BuildContext context,
    BoxConstraints constraints,
  ) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'รายการสินค้า',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 20,
                columns: const [
                  DataColumn(label: Text('รายการ')),
                  DataColumn(label: Text('เริ่มต็อก')),
                  DataColumn(label: Text('ใช้ไป')),
                  DataColumn(label: Text('เหลือ')),
                ],
                rows:
                    items.map((item) {
                      return DataRow(
                        cells: [
                          DataCell(Text(item.name)),
                          DataCell(
                            _buildNumberInput(
                              value: item.beginStock,
                              onChanged:
                                  (value) => updateStockItemValue(
                                    item,
                                    value,
                                    column: 'เริ่มต็อก',
                                  ),
                            ),
                          ),
                          DataCell(
                            _buildNumberInput(
                              value: item.used,
                              onChanged:
                                  (value) => updateStockItemValue(
                                    item,
                                    value,
                                    column: 'ใช้ไป',
                                  ),
                            ),
                          ),
                          DataCell(
                            _buildNumberInput(
                              value: item.remaining,
                              onChanged:
                                  (value) => updateStockItemValue(
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

  Widget _buildBottomSection() {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'วัตถุดิบ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 20,
                columns: const [
                  DataColumn(label: Text('รายการ')),
                  DataColumn(label: Text('จำนวน')),
                  DataColumn(label: Text('เริ่มต็อก')),
                  DataColumn(label: Text('ใช้ไป')),
                  DataColumn(label: Text('เหลือ')),
                ],
                rows:
                    bottomItems.map((item) {
                      return DataRow(
                        cells: [
                          DataCell(Text(item.name)),
                          DataCell(Text(item.value)),
                          DataCell(
                            _buildNumberInput(
                              value: item.beginStock,
                              onChanged:
                                  (value) => updateStockItemValue(
                                    item,
                                    value,
                                    column: 'เริ่มต็อก',
                                  ),
                            ),
                          ),
                          DataCell(
                            _buildNumberInput(
                              value: item.used,
                              onChanged:
                                  (value) => updateStockItemValue(
                                    item,
                                    value,
                                    column: 'ใช้ไป',
                                  ),
                            ),
                          ),
                          DataCell(
                            _buildNumberInput(
                              value: item.remaining,
                              onChanged:
                                  (value) => updateStockItemValue(
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

  Widget _buildTotalSection() {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'รวมยอดเงิน',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: _buildTotalField('เงิน', '0')),
                const SizedBox(width: 16),
                Expanded(child: _buildTotalField('ขาด', '0')),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTotalField(String label, String value) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      controller: TextEditingController(text: value),
      readOnly: true,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildNumberInput({
    String? value,
    required Function(String) onChanged,
  }) {
    return SizedBox(
      width: 80,
      child: TextField(
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          border: OutlineInputBorder(),
        ),
        controller: TextEditingController(text: value),
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onChanged: onChanged,
      ),
    );
  }
}
