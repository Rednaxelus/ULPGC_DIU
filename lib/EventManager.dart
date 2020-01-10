import 'package:uni/model/Event.dart';

class EventManager {
  final List<Event> events = List<Event>();

  EventManager() {
    events.add(Event('Aplicación de becas cerca', DateTime(2020, 1, 2),
        "no lo olvide", EventType.IMPORTANT));
    events.add(Event('Exam IS2', DateTime(2020, 1, 24, 11, 30),
        "Thema: MVC, Patrones de diseño; Aula: A2-1", EventType.EXAM));
  }
}
