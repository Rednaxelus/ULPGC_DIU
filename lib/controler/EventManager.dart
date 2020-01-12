import 'package:uni/model/EventModel.dart';

class EventManager {
  final List<EventModel> events = List<EventModel>();

  EventManager() {
    events.add(EventModel('Aplicación de becas cerca', DateTime(2020, 1, 2),
        "No lo olvide", EventType.IMPORTANT));
    events.add(EventModel('Entrega P4 EC', DateTime(2020, 1, 2, 10, 30),
        "Gestión de memoría", EventType.ASSIGNMENT));
    events.add(EventModel('Entrega P5 EC', DateTime(2020, 1, 14, 10, 30),
        "Gestión de memoría 2", EventType.ASSIGNMENT));
    events.add(EventModel('Exam IS2', DateTime(2020, 1, 24, 11, 30),
        "Thema: MVC, Patrones de diseño; Aula: A2-1", EventType.EXAM));
  }
}
