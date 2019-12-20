import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'Event.dart';

class NotificationData {
  Image thumbnail;
  Event event;
  static final DateFormat dateFormat = DateFormat('dd.MM.yyyy hh:mm');

  NotificationData(this.thumbnail, this.event);
}
