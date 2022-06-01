import 'package:intl/intl.dart';

String formatDate(DateTime dateTime) {
  DateFormat dateFormat = DateFormat('dd/MM/yyyy');
  return dateFormat.format(dateTime);
}