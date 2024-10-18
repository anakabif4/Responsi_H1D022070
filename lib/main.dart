import 'package:flutter/material.dart';
import 'package:keuangan_app/screens/add_laporan_screen.dart';
import 'package:keuangan_app/screens/home_screen.dart';
import 'package:keuangan_app/screens/login_screen.dart';
import 'screens/edit_laporan.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Keuangan',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.white), // Menggunakan bodyText2
        ),
      ),
      home: EditLaporan(
        id: '1',
        month: 'Juli',
        income: 10000008,
        expenses: 80007,
      ),
    );
  }
}
