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
extension NullableDateFormatting on String? {
  String toCustomFormattedDateOrEmpty() {
    if (this == null || this!.isEmpty) return "";
    try {
      final inputFormat = DateFormat('dd-MM-yyyy');
      final dateTime = inputFormat.parse(this!);
      return DateFormat('dd MMM yyyy').format(dateTime);
    } catch (e) {
      return "";
    }
  }
}