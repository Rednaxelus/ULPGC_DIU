import 'package:intl/intl.dart';

class Lab {
  String name;
  List<DateTime> occupationDates = [];

  static final DateFormat DATE_FORMAT = DateFormat('dd.MM.yyyy hh:mm');

  Lab(this.name);
}
