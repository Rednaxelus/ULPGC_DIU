import 'package:intl/intl.dart';

class EventModel {
  String title;
  DateTime dateTime;
  String description;
  EventType eventType;
  static final DateFormat dateFormat = DateFormat('hh:mm');
  EventModel(this.title, this.dateTime, this.description, this.eventType);
}

enum EventType { EXAM, IMPORTANT, LEISURE, ASSIGNMENT }
