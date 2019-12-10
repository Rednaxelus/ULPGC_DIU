// Flutter code sample for

// This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// widget. The [BottomNavigationBar] has three [BottomNavigationBarItem]
// widgets and the [currentIndex] is set to index 0. The selected item is
// amber. The `_onItemTapped` function changes the selected item's index
// and displays a corresponding message in the center of the [Scaffold].
//
// ![A scaffold with a bottom navigation bar containing three bottom navigation
// bar items. The first one is selected.](https://flutter.github.io/assets-for-api-docs/assets/material/bottom_navigation_bar.png)

import 'package:flutter/material.dart';
import 'package:uni/customBox.dart';

void main() => runApp(MyApp());

final Color colorPrimary = Color.fromARGB(255, 73, 101, 136);
final Color colorSecondary = Colors.amber[800];

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static List<Widget> _widgetOptions = <Widget>[
    Table(
      children: [
        TableRow(
          children: [
            CustomBox("Asignaturas", Icons.collections_bookmark),
            CustomBox("Calendario", Icons.calendar_today),
          ],
        ),
        TableRow(children: [
          CustomBox("Calificaciones", Icons.assignment),
          CustomBox("Exámenes", Icons.insert_drive_file)
        ])
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text('Through the night, we have one shot to live another day'),
        Text('We cannot let a stray gunshot give us away'),
        Text('We will fight up close, seize the moment and stay in it'),
        Text('It’s either that or meet the business end of a bayonet'),
        Text('The code word is ‘Rochambeau,’ dig me?'),
      ],
    ),
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
              border: Border.all(
                  width: 2, //                   <--- border width here
                  color: colorSecondary),
              borderRadius: BorderRadius.all(Radius.circular(
                      20.0) //                 <--- border radius here
                  ),
            ),
            child: FlatButton(
              onPressed: () {},
              child: Text("Login",
                  style: new TextStyle(
                    fontSize: 21.0,
                    color: colorSecondary,
                  )),
            ),
          )
        ],
        backgroundColor: colorPrimary,
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
            icon: Icon(Icons.new_releases),
            title: Text('Noticias importantes'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Facultad EII'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: colorSecondary,
        onTap: _onItemTapped,
      ),
    );
  }
}
