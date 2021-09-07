import 'package:intl/intl.dart';

class DashboardItem {
  String title, desc, icon;
  String unit;
  int value;

  DashboardItem({
    this.title,
    this.desc = '',
    this.icon = '',
    this.value,
    this.unit,
  });

  String get valueString {
    final formatter = NumberFormat("#,###", "en_US");
    return formatter.format(value);
  }
}