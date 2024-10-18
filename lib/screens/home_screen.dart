import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registrasi_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Utama'),
        backgroundColor: Color(0xFF0D47A1),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Selamat datang di Aplikasi Keuangan',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      'Laporan ${index + 1}',
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      'Detail laporan ${index + 1}',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFF1A1A1A),
    );
  }
}
