import 'package:intl/intl.dart';

class Helper {
  miliSecondsToDate(num timeStamp) {
    var dateTime = DateTime.fromMicrosecondsSinceEpoch(timeStamp);
    var now = DateTime.now();
    String formattedDate = DateFormat("MMMM d").format(now);
    return formattedDate;
  }

  miliSecondsToDateYear(num timeStamp) {
    var dateTime = DateTime.fromMicrosecondsSinceEpoch(timeStamp);
    var now = DateTime.now();
    String formattedDate = DateFormat("d MMMM y").format(now);
    return formattedDate;
  }
}
