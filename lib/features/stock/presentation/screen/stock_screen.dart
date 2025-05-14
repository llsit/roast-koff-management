import 'package:flutter/material.dart';
import 'package:roast_koff_management/features/stock/presentation/widgets/stock_table.dart';

class StockScreen extends StatelessWidget {
  const StockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("การนับสต๊อก", style: TextStyle(fontSize: 20)),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 14,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/add-stock');
                  },
                  child: const Text('เพิ่ม Sheet'),
                ),
              ],
            ),
            const SizedBox(width: 16),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: StockTable(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
