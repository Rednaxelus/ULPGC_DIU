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
  List<LabModel> _labs;

  @override
  void initState() {
    super.initState();
    _labs = [];
    _labs.add(LabModel("L1-1"));
    _labs.add(LabModel("L1-2"));
    _labs.add(LabModel("L1-3"));
    _labs.last.occupationDates.add(DateTime.now());
    _labs.add(LabModel("L1-4"));
    _labs.add(LabModel("L2-1"));
    _labs.add(LabModel("L2-2"));
    _labs.add(LabModel("L2-3"));
    _labs.add(LabModel("L2-4"));
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
        child: Card(
          color: _determineCardColor(_labs[index].occupationDates),
          child: ListTile(
            title: Text(_labs[index].name),
            subtitle:
                Text(_determineOccupationDate(_labs[index].occupationDates)),
            onTap: () {},
          ),
        ),
      ),
      itemCount: _labs.length,
    );
  }

  Color _determineCardColor(List<DateTime> occupationDates) {
    if (_determineIfFree(occupationDates)) {
      return Colors.green[100];
    }
    return Colors.red[100];
  }

  bool _determineIfFree(List<DateTime> occupationDates) {
    bool isFree = true;
    for (DateTime date in occupationDates) {
      if (date.difference(DateTime.now()).inDays < 1) {
        isFree = false;
        break;
      }
    }
    return isFree;
  }

  String _determineOccupationDate(List<DateTime> occupationDates) {
    if (_determineIfFree(occupationDates)) {
      return "libre";
    }

    DateTime date = occupationDates.first;
    date.add(new Duration(hours: 2));

    return "occupado hasta el " + LabModel.DATE_FORMAT.format(date);
  }
}
