class Laporan {
  final int id;
  final String month;
  final int income;
  final int expenses;

  Laporan(
      {required this.id,
      required this.month,
      required this.income,
      required this.expenses});

  factory Laporan.fromJson(Map<String, dynamic> json) {
    return Laporan(
      id: json['id'],
      month: json['month'],
      income: json['income'],
      expenses: json['expenses'],
    );
  }
}
