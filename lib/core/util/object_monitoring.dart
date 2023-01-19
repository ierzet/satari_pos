import 'package:flutter/material.dart';

class ObjectMonitoring extends StatelessWidget {
  final List<List<String>> data;

  const ObjectMonitoring({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          DataColumn(label: Text('Column 1')),
          DataColumn(label: Text('Column 2')),
          DataColumn(label: Text('Column 3')),
        ],
        rows: data
            .map((item) => DataRow(cells: [
                  DataCell(Text(item[0])),
                  DataCell(Text(item[1])),
                  DataCell(Text(item[2])),
                ]))
            .toList(),
      ),
    );
  }
}
