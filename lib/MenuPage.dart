import 'package:flutter/material.dart';

import 'calender.dart';
import 'customBox.dart';

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
            CustomBox("Asignaturas", Icons.collections_bookmark),
            CustomBox("hfghhhg", Icons.ac_unit),
          ],
        ),
        TableRow(children: [
          CustomBox("Calificaciones", Icons.assignment),
          CustomBox("Exámenes", Icons.insert_drive_file)
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
            child: FlatButton(
              onPressed: () {},
              child: Row(
                children: <Widget>[
                  Text("13",
                      style: new TextStyle(
                        fontSize: 21.0,
                        color: Theme.of(context).accentColor,
                      )),
                  Icon(
                    Icons.new_releases,
                    color: Theme.of(context).accentColor,
                    size: 24.0,
                  ),
                ],
              ),
            ),
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
