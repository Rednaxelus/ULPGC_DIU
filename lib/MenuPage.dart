import 'package:flutter/material.dart';

import 'EventManager.dart';
import 'calender.dart';
import 'uiElements/customBox.dart';
import 'view/NotificationView.dart';

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
    Table(
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
    ),
    CalendarScreen(),
    Text(
      'Bienvenvido',
      style: optionStyle,
    ),
  ];

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
            child: new NotificationView(EventManager()),
          ),
        ],
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('Clases'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text('Calendario'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Facultad EII'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).accentColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
