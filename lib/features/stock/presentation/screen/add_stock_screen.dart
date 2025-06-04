import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roast_koff_management/features/stock/data/stock_sale_item.dart';
import 'package:roast_koff_management/features/stock/provider/stock_table_viewmodel.dart';

import '../../../../core/utils/constants.dart';
import '../../data/stock_cash_remain_item.dart';
import '../../data/stock_detail_item.dart';
import '../../data/stock_inventory_item.dart';
import '../../data/stock_item.dart';
import '../widgets/custom_data_table.dart';
import '../widgets/text_input_field.dart';

class AddStockScreen extends StatefulWidget {
  const AddStockScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AddStockScreenState();
}

class _AddStockScreenState extends State<AddStockScreen> {
  final TextEditingController _dateController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  late StockTableViewModel stockTableViewModel;
  late Map<String, List<StockItem>> _stockData;

  List<TextEditingController> valueInventoryControllers = [];
  List<TextEditingController> usedInventoryControllers = [];
  List<TextEditingController> remainingInventoryControllers = [];

  @override
  void initState() {
    super.initState();
    // _dateController.text = DateFormat('dd/MM/yyyy').format(_selectedDate);

  }

  void _initializeInventoryControllers() {
    final stockProvider = Provider.of<StockTableViewModel>(
      context,
      listen: false,
    );
    final items = stockProvider.getTable('leftInventory') + stockProvider.getTable('rightInventory');

    valueInventoryControllers =
        items.map((item) {
          if (item is StockInventoryItem) {
            return TextEditingController(text: item.value.toString());
          }
          return TextEditingController(text: '0');
        }).toList();

    usedInventoryControllers =
        items.map((item) {
          if (item is StockInventoryItem) {
            return TextEditingController(text: item.used.toString());
          }
          return TextEditingController(text: '0');
        }).toList();

    remainingInventoryControllers =
        items.map((item) {
          if (item is StockInventoryItem) {
            return TextEditingController(text: item.remaining.toString());
          }
          return TextEditingController(text: '0');
        }).toList();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    stockTableViewModel = Provider.of<StockTableViewModel>(
      context,
      listen: false,
    );
    _stockData = stockTableViewModel.stockData;
    _initializeInventoryControllers();
  }

  @override
  void dispose() {
    // _dateController.dispose();
    super.dispose();
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
    stockTableViewModel.resetData();
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
              'leftInventory',
            ),
            _buildSalesSection(),
            _buildInventorySection(
              _stockData['rightInventory']!,
              'วัตถุดิบ (2)',
              'rightInventory',
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
                    context
                        .watch<StockTableViewModel>()
                        .stockData['leftInventory']!,
                    'วัตถุดิบ (1)',
                    'leftInventory',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildInventorySection(
                    context
                        .watch<StockTableViewModel>()
                        .stockData['leftInventory']!,
                    'วัตถุดิบ (2)',
                    'rightInventory',
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
                  // DataColumn(label: Text('รายจ่ายอื่นๆ')),
                  // DataColumn(
                  //   label: Text(
                  //     'จำนวนเงิน',
                  //     style: TextStyle(fontWeight: FontWeight.bold),
                  //   ),
                  // ),
                ],
                rows:
                    _stockData['sales']!.map((item) {
                      final index = _stockData['sales']!.indexOf(item);
                      return DataRow(
                        cells: [
                          DataCell(Text((item as StockSalesItem).name)),
                          DataCell(
                            TextInputField(
                              value: item.used,
                              onChanged: (value) {
                                stockTableViewModel.updateSalesUsed(
                                  'sales',
                                  value,
                                  index,
                                );
                              },
                            ),
                          ),
                          DataCell(
                            TextInputField(
                              value: item.usedCustomer,
                              onChanged: (value) {
                                stockTableViewModel.updateSalesUsedCustomer(
                                  'sales',
                                  value,
                                  index,
                                );
                              },
                            ),
                          ),
                          DataCell(
                            TextInputField(
                              value: item.summary,
                              onChanged: (value) {
                                stockTableViewModel.updateSummary(
                                  'sales',
                                  value,
                                  index,
                                );
                              },
                            ),
                          ),
                          // DataCell(
                          //   NumberInputField(
                          //     value: item.beginStock,
                          //     onChanged:
                          //         (value) => _updateStockItemValue(item, value),
                          //     width: 120,
                          //   ),
                          // ),
                          // DataCell(
                          //   NumberInputField(
                          //     value: item.used,
                          //     onChanged:
                          //         (value) => _updateStockItemValue(item, value),
                          //   ),
                          // ),
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
  Widget _buildInventorySection(
    List<StockItem> items,
    String title,
    String tableId,
  ) {
    void updateControllers(List<StockItem> items) {
      for (int i = 0; i < items.length; i++) {
        String valueText = '';
        String usedText = '';
        String remainingText = '';

        if (items[i] is StockInventoryItem) {
          final stockItem = items[i] as StockInventoryItem;
          valueText = stockItem.value.toString();
          usedText = stockItem.used.toString();
          remainingText = stockItem.remaining.toString();
        }

        if (valueInventoryControllers[i].text != valueText) {
          valueInventoryControllers[i].text = valueText;
        }
        if (usedInventoryControllers[i].text != usedText) {
          usedInventoryControllers[i].text = usedText;
        }
        if (remainingInventoryControllers[i].text != remainingText) {
          remainingInventoryControllers[i].text = remainingText;
        }
      }
    }

    return Consumer<StockTableViewModel>(
      builder: (context, stockProvider, child) {
        final items = stockProvider.getTable(tableId);

        if (valueInventoryControllers.isEmpty &&
            usedInventoryControllers.isEmpty &&
            remainingInventoryControllers.isEmpty) {
          updateControllers;
        }

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
                          final index = items.indexOf(item);
                          return DataRow(
                            cells: [
                              DataCell(Text((item as StockInventoryItem).name)),
                              DataCell(
                                TextInputField(
                                  value: item.value,
                                  onChanged: (value) {
                                    stockTableViewModel.updateInventory(
                                      tableId,
                                      value,
                                      index,
                                    );
                                  },
                                ),
                              ),
                              DataCell(
                                TextInputField(
                                  value: item.used,
                                  onChanged: (value) {
                                    stockTableViewModel.updateInventoryUsed(
                                      tableId,
                                      value,
                                      index,
                                    );
                                  },
                                ),
                              ),
                              DataCell(
                                TextInputField(
                                  value: item.remaining,
                                  onChanged: (value) {
                                    stockTableViewModel.updateRemaining(
                                      tableId,
                                      value,
                                      index,
                                    );
                                  },
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
      },
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
                          DataCell(Text((item as StockSummaryItem).name)),
                          DataCell(
                            TextInputField(
                              value: item.summary,
                              onChanged: (value) {
                                stockTableViewModel.updateCashSummary(
                                  'cashSummary',
                                  value,
                                  _stockData['cashSummary']!.indexOf(item),
                                );
                              },
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
                          DataCell(Text((item as StockCashRemainItem).name)),
                          DataCell(
                            TextInputField(
                              value: item.value,
                              onChanged: (value) {
                                stockTableViewModel.updateCashRemaining(
                                  'cashDetails',
                                  value,
                                  _stockData['cashDetails']!.indexOf(item),
                                );
                              },
                            ),
                          ),
                          DataCell(
                            TextInputField(
                              value: item.summary,
                              onChanged: (value) {
                                stockTableViewModel.updateCashSummaryRemaining(
                                  'cashDetails',
                                  value,
                                  _stockData['cashDetails']!.indexOf(item),
                                );
                              },
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
