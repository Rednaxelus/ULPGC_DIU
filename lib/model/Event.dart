import 'package:intl/intl.dart';

class Event {
  String title;
  DateTime dateTime;
  String description;
  EventType eventType;
  static final DateFormat dateFormat = DateFormat('hh:mm');
  static final DateFormat completeDateFormat = DateFormat('dd.MM.yyyy hh:mm');

  Event(this.title, this.dateTime, this.description, this.eventType);
}

enum EventType { EXAM, IMPORTANT, LEISURE, ASSIGNMENT }
