import 'package:flutter/material.dart';

class StockTable extends StatelessWidget {
  const StockTable({super.key});

  @override
  Widget build(BuildContext context) {
    final stockList = [
      {'name': 'stock01', 'date': '2025-05-13', 'user': 'คุณเอ'},
      {'name': 'stock02', 'date': '2025-05-12', 'user': 'คุณบี'},
    ];

    return Expanded(
      child: DataTable(
        columnSpacing: 30,
        headingRowColor: MaterialStateColor.resolveWith(
          (states) => Colors.grey[200]!,
        ),
        columns: const [
          DataColumn(label: Text('วันที่')),
          DataColumn(label: Text('ชื่อไฟล์')),
          DataColumn(label: Text('ลงโดย')),
          DataColumn(label: Text('ดาวน์โหลด')),
        ],
        rows:
            stockList.map((item) {
              return DataRow(
                cells: [
                  DataCell(Text(item['date']!)),
                  DataCell(Text(item['name']!)),
                  DataCell(Text(item['user']!)),
                  DataCell(
                    IconButton(
                      icon: const Icon(Icons.download),
                      onPressed: () {
                        // ทำการดาวน์โหลดไฟล์ PDF/Excel หรือข้อมูลตามต้องการ
                      },
                    ),
                  ),
                ],
              );
            }).toList(),
      ),
    );
  }
}
