// Convert DateTime object to a string yyyymmdd
String convertDateTimeToString(DateTime dateTime) {
  // Year in the format -> yyyy
  String year = dateTime.year.toString();

  // Month in the format -> mm
  String month = dateTime.month.toString();
  if (month.length == 1) {
    month = '0$month'; // => '0'+month;
  }

  // Day in the format -> dd
  String day = dateTime.day.toString();
  if (day.length == 1) {
    day = '0$day'; // => '0'+day;
  }

  String yyyymmdd = year + month + day;

  return yyyymmdd;
}
