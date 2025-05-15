import 'package:flutter/material.dart';

class CustomDataTable extends StatelessWidget {
  final List<DataColumn> columns;
  final List<DataRow> rows;
  final double? columnSpacing;
  final double? horizontalMargin;
  final Color? headerColor;
  final Color? rowColor;
  final Color? alternateRowColor;

  const CustomDataTable({
    super.key,
    required this.columns,
    required this.rows,
    this.columnSpacing = 24,
    this.horizontalMargin = 12,
    this.headerColor,
    this.rowColor,
    this.alternateRowColor,
  });

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columnSpacing: columnSpacing,
      horizontalMargin: horizontalMargin,
      headingRowColor:
          headerColor != null
              ? WidgetStateProperty.all<Color>(headerColor!)
              : WidgetStateProperty.all<Color>(Colors.grey.shade100),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      columns:
          columns.map((column) {
            return DataColumn(
              label: DefaultTextStyle(
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                child: column.label,
              ),
            );
          }).toList(),
      rows: rows,
      dataRowColor: WidgetStateProperty.resolveWith<Color?>((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.selected)) {
          return Theme.of(context).colorScheme.primary;
        }
        return null; // Use default value for other states
      }),
      border: TableBorder(
        horizontalInside: BorderSide(color: Colors.grey.shade300),
      ),
    );
  }
}
