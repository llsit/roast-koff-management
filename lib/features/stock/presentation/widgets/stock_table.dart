import 'package:flutter/material.dart';

class StockTable extends StatelessWidget {
  const StockTable({super.key});

  @override
  Widget build(BuildContext context) {
    final stockList = [
      {'name': '2025-05-13-stock01', 'date': '2025-05-13', 'user': 'คุณเอ'},
      {'name': '2025-05-13-stock02', 'date': '2025-05-12', 'user': 'คุณบี'},
    ];

    return Expanded(
      child: DataTable(
        columnSpacing: 30,
        headingRowColor: WidgetStateColor.resolveWith(
          (states) => Colors.grey[200]!,
        ),
        columns: const [
          DataColumn(label: Center(child: Text('วันที่'))),
          DataColumn(label: Center(child: Text('ชื่อไฟล์'))),
          DataColumn(label: Center(child: Text('ลงโดย'))),
          DataColumn(
            label: SizedBox(width: 50, child: Center(child: Text('ดาวน์โหลด'))),
          ),
          DataColumn(
            label: SizedBox(width: 50, child: Center(child: Text('ลบ'))),
          ),
          DataColumn(
            label: SizedBox(width: 50, child: Center(child: Text('แก้ไข'))),
          ),
        ],
        rows:
            stockList.map((item) {
              return DataRow(
                cells: [
                  DataCell(Text(item['date']!)),
                  DataCell(Text(item['name']!)),
                  DataCell(Text(item['user']!)),
                  DataCell(
                    Center(
                      child: IconButton(
                        icon: const Icon(Icons.download),
                        onPressed: () {
                          // ทำการดาวน์โหลดไฟล์ PDF/Excel หรือข้อมูลตามต้องการ
                        },
                      ),
                    ),
                  ),
                  DataCell(
                    Center(
                      child: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          // ทำการลบ
                        },
                      ),
                    ),
                  ),
                  DataCell(
                    Center(
                      child: IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          // ทำการแก้ไข
                        },
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
      ),
    );
  }
}
