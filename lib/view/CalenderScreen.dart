import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
import 'package:uni/controler/EventManager.dart';

import '../model/EventModel.dart';

class CalendarScreen extends StatefulWidget {
  CalendarScreen(this._eventManager);

  final EventManager _eventManager;

  @override
  State<StatefulWidget> createState() {
    return _CalendarScreenState();
  }
}

class _CalendarScreenState extends State<CalendarScreen> {
  void _handleNewDate(date) {
    setState(() {
      _selectedDay = date;
      _selectedEvents = _events[_selectedDay] ?? [];
    });
    print(_selectedEvents);
  }

  Map _eventToMap(EventModel event) {
    return {
      'name': event.title,
      'isDone': true,
      'type': event.eventType,
      'date': EventModel.dateFormat.format(event.dateTime),
      'description': event.description
    };
  }

  List _selectedEvents;
  DateTime _selectedDay;

  _addEvent(EventModel event) {
    DateTime dateWithoutTimeOfDay =
        DateTime(event.dateTime.year, event.dateTime.month, event.dateTime.day);

    if (_events == null) {
      _events = {
        dateWithoutTimeOfDay: [
          _eventToMap(event),
        ]
      };
    } else if (_events.containsKey(dateWithoutTimeOfDay)) {
      _events[dateWithoutTimeOfDay].add(_eventToMap(event));
    } else {
      _events[dateWithoutTimeOfDay] = [_eventToMap(event)];
    }
  }

  Map<DateTime, List<Map>> _events;

  @override
  void initState() {
    super.initState();

    widget._eventManager.events.forEach((e) => _addEvent(e));

    _selectedEvents = _events[_selectedDay] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              child: Calendar(
                  events: _events,
                  onRangeSelected: (range) =>
                      print("Range is ${range.from}, ${range.to}"),
                  onDateSelected: (date) => _handleNewDate(date),
                  isExpandable: true,
                  isExpanded: true,
                  showTodayIcon: true,
                  eventDoneColor: Colors.green,
                  eventColor: Colors.grey),
            ),
            _buildEventList()
          ],
        ),
      ),
    );
  }

  Widget _buildEventList() {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) => Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1.5, color: Colors.black12),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 4.0),
          child: ListTile(
            leading: _determineIcon(_selectedEvents[index]['type']),
            title: Text(_selectedEvents[index]['name']),
            trailing: Text("Hora: " + _selectedEvents[index]['date']),
            subtitle: Text(_selectedEvents[index]['description']),
            onTap: () {
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (BuildContext context) {
                  TextStyle _descriptionTextStyle =
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
                  TextStyle _descriptionTextStyle2 = TextStyle(fontSize: 18);
                  return SimpleDialog(
                    contentPadding: EdgeInsets.all(0),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0)),
                    children: <Widget>[
                      Container(
                        height: 50,
                        decoration: new BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.red[300],
                          borderRadius: new BorderRadius.vertical(
                              top: new Radius.circular(10.0)),
                        ),
                        child: Center(
                          child: Text(
                            _selectedEvents[index]['name'],
                            style: Theme.of(context).textTheme.display1,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.calendar_today),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "24.1.2020",
                                  style: _descriptionTextStyle,
                                ),
                                SizedBox(
                                  width: 28,
                                ),
                                Icon(Icons.access_time),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  _selectedEvents[index]['date'],
                                  style: _descriptionTextStyle,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.location_on),
                                SizedBox(
                                  width: 5,
                                ),
                                Flexible(
                                  child: Text("Aula A2-1",
                                      style: _descriptionTextStyle),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            Text(
                                "Se muestra un ejemplo de una aplicación usando el estilo arquitectónico Model-View-Controller (Modelo-Vista-Controlador, MVC). Se modifica MoneyCalculator introduciendo las clases de Modelo. ",
                                style: _descriptionTextStyle2),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
        itemCount: _selectedEvents.length,
      ),
    );
  }

  Icon _determineIcon(selectedEvent) {
    switch (selectedEvent) {
      case EventType.EXAM:
        {
          return Icon(Icons.edit);
        }
        break;

      case EventType.IMPORTANT:
        {
          return Icon(Icons.warning);
        }
        break;

      case EventType.LEISURE:
        {
          return Icon(Icons.audiotrack);
        }
        break;
      case EventType.ASSIGNMENT:
        {
          return Icon(Icons.assignment);
        }
        break;

      default:
        {
          return Icon(Icons.error_outline);
        }
        break;
    }
  }
}
