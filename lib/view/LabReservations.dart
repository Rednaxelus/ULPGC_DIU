import 'package:flutter/material.dart';
import 'package:uni/model/LabModel.dart';

class LabReservationScreen extends StatefulWidget {
  LabReservationScreen();

  @override
  State<StatefulWidget> createState() {
    return _LabReservationScreenState();
  }
}

class _LabReservationScreenState extends State<LabReservationScreen> {
  List<Lab> _labs;

  @override
  void initState() {
    super.initState();
    _labs = [];
    _labs.add(Lab("L1-1"));
    _labs.add(Lab("L1-2"));
    _labs.add(Lab("L1-3"));
    _labs.add(Lab("L1-4"));
    _labs.add(Lab("L2-1"));
    _labs.add(Lab("L2-2"));
    _labs.add(Lab("L2-3"));
    _labs.add(Lab("L2-4"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).primaryColor,
      //   title: Text('Calendario'),
      // ),
      body: SafeArea(
        child: _buildLabList(),
      ),
    );
  }

  Widget _buildLabList() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1.5, color: Colors.black12),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 4.0),
        child: ListTile(
          title: Text(_labs[index].name),
          onTap: () {},
        ),
      ),
      itemCount: _labs.length,
    );
  }
}
