import 'package:flutter/material.dart';
import 'package:uni/controler/EventManager.dart';

import '../../model/unused/NotificationData.dart';

class NotificationView extends StatefulWidget {
  final List<NotificationData> _notificationData;

  NotificationView(EventManager eventManager)
      : _notificationData = eventManager.events
            .map((event) =>
                NotificationData(Image.asset('assets/images/logo.png'), event))
            .toList();

  @override
  _NotificationViewState createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  NotificationData _selection;
  int _number = 2;

  @override
  Widget build(BuildContext context) {
    if (_number == 0) {
      return Container();
    }
    return FlatButton(
      onPressed: () {},
      child: Container(
        child: PopupMenuButton<NotificationData>(
          onSelected: (NotificationData result) {
            setState(() {
              _selection = result;
              widget._notificationData.remove(_selection);
              _number--;
            });
          },
          itemBuilder: (BuildContext context) => widget._notificationData
              .map((x) => PopupMenuItem<NotificationData>(
                    value: x,
                    child: NotificationItem(x),
                  ))
              .toList(),
          child: Row(
            children: <Widget>[
              Text('$_number',
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
    );
  }
}

class NotificationItem extends StatelessWidget {
  final NotificationData notificationData;

  NotificationItem(this.notificationData);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: <Widget>[
        notificationData.thumbnail,
        Column(
          children: <Widget>[
            Text(notificationData.event.title),
            Text(NotificationData.dateFormat
                .format(notificationData.event.dateTime)),
          ],
        )
      ],
    ));
  }
}
