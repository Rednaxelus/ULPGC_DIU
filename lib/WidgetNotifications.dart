import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WidgetNotifications extends StatelessWidget {
  final NotificationData nd = NotificationData(
      "Tester", Image.asset('assets/images/logo.png'), DateTime(2019, 3, 1));

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
            child: NotificationEntity(nd),
          ),
          const PopupMenuItem<WhyFarther>(
            value: WhyFarther.smarter,
            child: Text('Being a lot smarter'),
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
  String text;
  Image thumbnail;
  DateTime dateTime;
  static final DateFormat dateFormat = DateFormat('dd.MM.yyyy hh:mm');

  NotificationData(this.text, this.thumbnail, this.dateTime);
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
            Text(notificationData.text),
            Text(NotificationData.dateFormat.format(notificationData.dateTime)),
          ],
        )
      ],
    ));
  }
}
