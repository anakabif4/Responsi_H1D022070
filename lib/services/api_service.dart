import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/laporan.dart';

class ApiService {
  final String baseUrl = 'http://103.196.155.42/api';

  Future<List<Laporan>> getAllLaporan() async {
    final response = await http.get(Uri.parse('$baseUrl/laporan_bulanan'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Laporan.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load laporan');
    }
  }

  Future<void> createLaporan(Laporan laporan) async {
    final response = await http.post(
      Uri.parse('$baseUrl/laporan_bulanan'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'month': laporan.month,
        'income': laporan.income,
        'expenses': laporan.expenses,
      }),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create laporan');
    }
  }
}
