import 'package:flutter/material.dart';
import 'package:uni/controller/EventRepository.dart';
import 'package:uni/controller/NewsManager.dart';
import 'package:uni/view/LabReservationScreen.dart';
import 'package:uni/view/NewsScreen.dart';

import 'CalenderScreen.dart';

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

  static final EventRepository _eventManager = EventRepository();
  static final NewsRepository _newsManager = NewsRepository();

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
