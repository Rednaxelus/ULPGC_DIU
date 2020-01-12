import 'package:flutter/material.dart';
import 'package:uni/controler/NewsManager.dart';
import 'package:uni/view/LabReservationScreen.dart';
import 'package:uni/view/NewsScreen.dart';

import '../controler/EventManager.dart';
import '../uiElements/unused/NotificationView.dart';
import '../uiElements/unused/customBox.dart';
import 'CalenderScreen
class MenuPage extends StatefulWidget {
  MenuPage({Key key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int _selectedIndex = 1;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static List<Widget> _widgetOptions = <Widget>[
    new NewsScreen(_newsManager),
    new CalendarScreen(_eventManager),
    new LabReservationScreen(),
  ];

  static final EventManager _eventManager = EventManager();
  static final NewsManager _newsManager = NewsManager();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            title: Text('Noticias' + _newsManager.displayNewNewsNotification()),
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 30,
              child: Image.asset(
                "assets/images/logo.png",
                fit: BoxFit.contain,
              ),
            ),
            title: Text('Calendario'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Laboratorios'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).accentColor,
        onTap: _onItemTapped,
      ),
    );
  }
}

AppBar _createCustomAppBar(BuildContext context, EventManager _eventManager) {
  return AppBar(
    title: const Text('ULPGC EII'),
    actions: <Widget>[
      Container(
        margin: const EdgeInsets.all(5.0),
        padding: const EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          color: Color.fromARGB(0, 0, 0, 0),
        ),
        child: new NotificationView(_eventManager),
      ),
    ],
    backgroundColor: Theme
        .of(context)
        .primaryColor,
  );
}

class PreTable extends StatelessWidget {
  const PreTable({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: [
            CustomBoxForOptions("Asignaturas", Icons.collections_bookmark),
            CustomBoxForOptions("Configuración", Icons.settings),
          ],
        ),
        TableRow(children: [
          CustomBoxForOptions("Calificaciones", Icons.assignment),
          CustomBoxForOptions("Exámenes", Icons.insert_drive_file)
        ])
      ],
    );
  }
}
