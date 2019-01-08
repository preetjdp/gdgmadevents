import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/event_model.dart';

class EventApiProvider {
  Client client = Client();
  final String _url = 'https://www.jasonbase.com/things/DBQw.json';

  Future<EventModel> fetchEventList() async {
    print('Entered Fetch Event');
    final response = await client
        .get(_url);
    // print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return EventModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
