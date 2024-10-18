import 'package:flutter/material.dart';
import '../models/laporan.dart';
import '../services/api_service.dart';

class AddLaporanScreen extends StatelessWidget {
  final TextEditingController monthController = TextEditingController();
  final TextEditingController incomeController = TextEditingController();
  final TextEditingController expensesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tambah Laporan Keuangan')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: monthController,
              decoration: InputDecoration(labelText: 'Bulan'),
            ),
            TextField(
              controller: incomeController,
              decoration: InputDecoration(labelText: 'Pemasukan'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: expensesController,
              decoration: InputDecoration(labelText: 'Pengeluaran'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blueAccent, 
              ),
              onPressed: () {
                Laporan laporan = Laporan(
                  id: 0, 
                  month: monthController.text,
                  income: int.parse(incomeController.text),
                  expenses: int.parse(expensesController.text),
                );
                ApiService().createLaporan(laporan).then((_) {
                  Navigator.pop(context);
                }).catchError((error) {
                  
                });
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
