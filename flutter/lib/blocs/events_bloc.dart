import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/event_model.dart';

class EventsBloc {
  final _repository = Repository();
  final _eventsFetcher = PublishSubject<EventModel>();

  Observable<EventModel> get allevents => _eventsFetcher.stream;
  
  fetchAllEvents() async {
    EventModel eventModel = await _repository.fetchAllEvents();
    _eventsFetcher.sink.add(eventModel);
  }

  dispose() {
    _eventsFetcher.close();
  }
}

final bloc = EventsBloc();