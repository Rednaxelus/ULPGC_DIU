import 'package:intl/intl.dart';

class LabModel {
  String name;
  List<DateTime> occupationDates = [];

  static final DateFormat DATE_FORMAT = DateFormat('dd.MM.yyyy hh:mm');

  LabModel(this.name);
}
