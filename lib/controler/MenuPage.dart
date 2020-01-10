import 'package:flutter/material.dart';
import 'package:uni/view/LabReservations.dart';
import 'package:uni/view/News.dart';

import '../uiElements/customBox.dart';
import '../view/NotificationView.dart';
import '../view/calender.dart';
import 'EventManager.dart';

class MenuPage extends StatefulWidget {
  MenuPage({Key key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static List<Widget> _widgetOptions = <Widget>[
    new NewsScreen(),
    new CalendarScreen(_eventManager),
    new LabReservationScreen(),
  ];

  static final EventManager _eventManager = EventManager();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            title: Text('Noticias'),
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
            title: Text('Solicitar Laboratorio'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).accentColor,
        onTap: _onItemTapped,
      ),
    );
  }
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
