import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditLaporan extends StatefulWidget {
  final String id;
  final String month;
  final int income;
  final int expenses;

  EditLaporan(
      {required this.id,
      required this.month,
      required this.income,
      required this.expenses});

  @override
  _EditLaporanState createState() => _EditLaporanState();
}

class _EditLaporanState extends State<EditLaporan> {
  final TextEditingController _monthController = TextEditingController();
  final TextEditingController _incomeController = TextEditingController();
  final TextEditingController _expensesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _monthController.text = widget.month;
    _incomeController.text = widget.income.toString();
    _expensesController.text = widget.expenses.toString();
  }

  Future<void> _updateLaporan() async {
    final response = await http.put(
      Uri.parse(
          'http://103.196.155.42/api/laporan_bulanan/${widget.id}/update'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'month': _monthController.text,
        'income': int.parse(_incomeController.text),
        'expenses': int.parse(_expensesController.text),
      }),
    );

    if (response.statusCode == 200) {
      Navigator.pop(context, true);
    } else {
      throw Exception('Failed to update laporan');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Laporan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _monthController,
              decoration: InputDecoration(labelText: 'Month'),
            ),
            TextField(
              controller: _incomeController,
              decoration: InputDecoration(labelText: 'Income'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _expensesController,
              decoration: InputDecoration(labelText: 'Expenses'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blueAccent,
              ),
              onPressed: _updateLaporan,
              child: Text('Update Laporan'),
            ),
          ],
        ),
      ),
    );
  }
}
