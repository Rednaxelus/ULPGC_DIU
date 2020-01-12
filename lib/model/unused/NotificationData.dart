import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../EventModel.dart';

class NotificationData {
  Image thumbnail;
  EventModel event;
  static final DateFormat dateFormat = DateFormat('dd.MM.yyyy hh:mm');

  NotificationData(this.thumbnail, this.event);
}
