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
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PopupMenuButton<WhyFarther>(
        onSelected: (WhyFarther result) {
          //setState(() {
          //_selection = result;
          // });
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<WhyFarther>>[
          PopupMenuItem<WhyFarther>(
            value: WhyFarther.harder,
            child: NotificationEntity(widget._notificationDatas.first),
          ),
          PopupMenuItem<WhyFarther>(
            value: WhyFarther.smarter,
            child: NotificationEntity(widget._notificationDatas.elementAt(1)),
          ),
          const PopupMenuItem<WhyFarther>(
            value: WhyFarther.selfStarter,
            child: Text('Being a self-starter'),
          ),
          const PopupMenuItem<WhyFarther>(
            value: WhyFarther.tradingCharter,
            child: Text('Placed in charge of trading charter'),
          ),
        ],
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

// This is the type used by the popup menu below.
enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

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
