import 'package:intl/intl.dart';

class DateUtility {
  // Private constructor to prevent instantiation.
  DateUtility._();

  // Getter for the current date.
  static DateTime get currentDate => DateTime.now();

  // Formatted date string.
  static String get formattedCurrentDate {
    final formatter = DateFormat('EEE, dd MMMM yyyy');
    return formatter.format(currentDate);
  }
}
