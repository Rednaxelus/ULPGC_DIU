import 'package:uni/model/Event.dart';

class EventManager {
  final List<Event> events = List<Event>();

  EventManager() {
    events.add(Event('Aplicación de becas cerca', DateTime(2019, 3, 1),
        "porfa si quieres..."));
    events.add(Event('2334Aplicación de becas cerca', DateTime(2019, 4, 2),
        "porfa si d..."));
  }
}
