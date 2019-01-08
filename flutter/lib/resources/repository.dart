import 'dart:async';

import 'event_api_provider.dart';
import '../models/event_model.dart';

class Repository {
  final eventsApiProvider = EventApiProvider();
  Future<EventModel> fetchAllEvents () => eventsApiProvider.fetchEventList();
}