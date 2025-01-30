import 'package:intl/intl.dart';

class DateTimeUtils {
  static String formatDateTime(
    DateTime dateTime, {
    String format = 'yyyy-MM-dd HH:mm',
  }) {
    try {
      final formatter = DateFormat(format);
      return formatter.format(dateTime);
    } catch (e) {
      print('Error formatting date: $e');
      return ''; // Or handle the error in a different way
    }
  }

  static String formatDate(DateTime date, {String format = 'yyyy-MM-dd'}) {
    try {
      final formatter = DateFormat(format);
      return formatter.format(date);
    } catch (e) {
      print('Error formatting date: $e');
      return '';
    }
  }

  static String formatTime(DateTime time, {String format = 'HH:mm'}) {
    try {
      final formatter = DateFormat(format);
      return formatter.format(time);
    } catch (e) {
      print('Error formatting time: $e');
      return '';
    }
  }

  static String formatDayName(DateTime dateTime, {String locale = 'en_US'}) {
    try {
      final formatter = DateFormat('EEEE', locale); // 'EEEE' for full day name
      return formatter.format(dateTime);
    } catch (e) {
      print('Error formatting day name: $e');
      return '';
    }
  }

  static String formatMonthName(DateTime dateTime, {String locale = 'en_US'}) {
    try {
      final formatter =
          DateFormat('MMMM', locale); // 'MMMM' for full month name
      return formatter.format(dateTime);
    } catch (e) {
      print('Error formatting month name: $e');
      return '';
    }
  }

  static String formatMonthNameShort(DateTime dateTime,
      {String locale = 'en_US'}) {
    try {
      final formatter = DateFormat('MMM', locale); // 'MMM' for short month name
      return formatter.format(dateTime);
    } catch (e) {
      print('Error formatting short month name: $e');
      return '';
    }
  }

  static String formatDayNameShort(DateTime dateTime,
      {String locale = 'en_US'}) {
    try {
      final formatter = DateFormat('E', locale); // 'E' for abbreviated day name
      return formatter.format(dateTime);
    } catch (e) {
      print('Error formatting short day name: $e');
      return '';
    }
  }

  static DateTime? parseDateTime(String dateTimeString,
      {String format = 'yyyy-MM-dd HH:mm'}) {
    try {
      final formatter = DateFormat(format);
      return formatter.parse(dateTimeString);
    } catch (e) {
      print('Error parsing date: $e');
      return null;
    }
  }

  static DateTime? parseDate(String dateString,
      {String format = 'yyyy-MM-dd'}) {
    try {
      final formatter = DateFormat(format);
      return formatter.parse(dateString);
    } catch (e) {
      print('Error parsing date: $e');
      return null;
    }
  }

  static DateTime? parseTime(String timeString, {String format = 'HH:mm'}) {
    try {
      final formatter = DateFormat(format);
      return formatter.parse(timeString);
    } catch (e) {
      print('Error parsing time: $e');
      return null;
    }
  }

  static String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  static bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
}
