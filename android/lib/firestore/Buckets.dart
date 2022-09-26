import 'package:intl/intl.dart';

class buckets{
  static const dairy="dairy";
  static const dairyId="dairyIds";
  static const milkdates="milkDates";
  static const name="name";

  DateTime now= DateTime.now();
  late var month1= now.month;

 // late String date=DateFormat('dMy').format(now).toString();
 // final String formatter=DateFormat('dMy').format(now);
}