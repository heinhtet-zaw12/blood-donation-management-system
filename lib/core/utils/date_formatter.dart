import 'package:intl/intl.dart';

extension DateTimeFormatting on String {
  DateTime toDateTime() => DateTime.parse(this).toLocal();

  String toFormattedTime() {
    return DateFormat('hh:mm a').format(toDateTime());
  }

  String toFormattedDate() {
    return DateFormat('dd MMM yyyy').format(toDateTime());
  }
}