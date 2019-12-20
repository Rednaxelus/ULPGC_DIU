import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uni/model/Event.dart';
import 'package:uni/model/EventManager.dart';

class WidgetNotifications extends StatefulWidget {
  final List<NotificationData> _notificationDatas;

  WidgetNotifications(EventManager eventManager)
      : _notificationDatas = eventManager.events
      .map((event) =>
      NotificationData(Image.asset('assets/images/logo.png'), event))
      .toList();

  @override
  _WidgetNotificationsState createState() => _WidgetNotificationsState();
}

class _WidgetNotificationsState extends State<WidgetNotifications> {
  NotificationData _selection;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PopupMenuButton<NotificationData>(
        onSelected: (NotificationData result) {
          setState(() {
            _selection = result;
            widget._notificationDatas.add(_selection);
          });
        },
        itemBuilder: (BuildContext context) =>
            widget._notificationDatas
                .map((x) =>
                PopupMenuItem<NotificationData>(
                  value: x,
                  child: NotificationEntity(x),
                ))
                .toList(),
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
    );
  }
}

class NotificationData {
  Image thumbnail;
  Event event;
  static final DateFormat dateFormat = DateFormat('dd.MM.yyyy hh:mm');

  NotificationData(this.thumbnail, this.event);
}

class NotificationEntity extends StatelessWidget {
  final NotificationData notificationData;

  NotificationEntity(this.notificationData);

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
