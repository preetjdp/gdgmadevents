class EventModel {
  List<Event> event;

  EventModel({this.event});

  EventModel.fromJson(Map<String, dynamic> json) {
    if (json['event'] != null) {
      event = new List<Event>();
      json['event'].forEach((v) {
        event.add(new Event.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.event != null) {
      data['event'] = this.event.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Event {
  int id;
  String name;
  String desc;
  int time;
  String date;
  Venue venue;
  List<Agenda> agenda;

  Event(
      {this.id,
      this.name,
      this.desc,
      this.time,
      this.date,
      this.venue,
      this.agenda});

  Event.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    desc = json['desc'];
    time = json['time'];
    date = json['date'];
    venue = json['venue'] != null ? new Venue.fromJson(json['venue']) : null;
    if (json['agenda'] != null) {
      agenda = new List<Agenda>();
      json['agenda'].forEach((v) {
        agenda.add(new Agenda.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['desc'] = this.desc;
    data['time'] = this.time;
    data['date'] = this.date;
    if (this.venue != null) {
      data['venue'] = this.venue.toJson();
    }
    if (this.agenda != null) {
      data['agenda'] = this.agenda.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Venue {
  String address;
  String link;
  List<double> latLng;

  Venue({this.address, this.link, this.latLng});

  Venue.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    link = json['link'];
    latLng = json['latLng'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['link'] = this.link;
    data['latLng'] = this.latLng;
    return data;
  }
}

class Agenda {
  String name;
  Speaker speaker;
  String start;
  String end;

  Agenda({this.name, this.speaker, this.start, this.end});

  Agenda.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    speaker =
        json['speaker'] != null ? new Speaker.fromJson(json['speaker']) : null;
    start = json['start'];
    end = json['end'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.speaker != null) {
      data['speaker'] = this.speaker.toJson();
    }
    data['start'] = this.start;
    data['end'] = this.end;
    return data;
  }
}

class Speaker {
  int id;
  String name;
  String image;
  String twitter;

  Speaker({this.id, this.name, this.image, this.twitter});

  Speaker.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    twitter = json['twitter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['twitter'] = this.twitter;
    return data;
  }
}
