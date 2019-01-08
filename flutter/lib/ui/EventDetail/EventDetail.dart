import 'package:app_flutter/ui/SpeakerDetail/SpeakerDetail.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../models/event_model.dart';

class EventDetail extends StatefulWidget {
  final Event singleEvent;

  EventDetail({this.singleEvent});

  @override
  EventDetailState createState() {
    return new EventDetailState();
  }
}

class EventDetailState extends State<EventDetail> {
  GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(widget.singleEvent.name,
              style: TextStyle(color: Colors.black)),
          centerTitle: true),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.favorite),
        onPressed: () {},
      ),
      body: Container(
        child: Column(children: <Widget>[
          Container(
            height: 180.0,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              image: DecorationImage(
                image: NetworkImage(
                    'https://www.bing.com/az/hprichbg/rb/SilentNight_EN-IN5210251480_1920x1080.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: 30.0,
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 5.0),
            child: Text(
              'Talks',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ),
          Container(
              height: 160.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.singleEvent.agenda.length,
                physics: CustomScrollPhysics(),
                itemExtent: MediaQuery.of(context).size.width - 50,
                itemBuilder: (context, index) => Container(
                    padding: EdgeInsets.all(8.0),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: <Widget>[
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SpeakerDetail()));
                            },
                            child: Hero(
                                tag: 'test' + widget.singleEvent.agenda[index].speaker.id.toString(),
                                child: SpeakerCard(
                                  speaker:
                                      widget.singleEvent.agenda[index].speaker,
                                ))),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                            ),
                            child: Center(
                                child: Text(
                              widget.singleEvent.agenda[index].name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40.0,
                                  height: 0.8,
                                  fontWeight: FontWeight.w600),
                            )),
                          ),
                        )
                      ],
                    )),
              )),
          Container(
            height: 30.0,
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 5.0),
            child: Text(
              'Address',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ),
          Container(
            height: 180.0,
            margin: EdgeInsets.all(6.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              child: GoogleMap(
                onMapCreated: (GoogleMapController controller) {
                  setState(() {
                    mapController = controller;
                    mapController.addMarker(MarkerOptions(
                        position: LatLng(widget.singleEvent.venue.latLng[0],
                            widget.singleEvent.venue.latLng[1])));
                    mapController.animateCamera(
                      CameraUpdate.newCameraPosition(
                        CameraPosition(
                          bearing: 270.0,
                          target: LatLng(widget.singleEvent.venue.latLng[0],
                              widget.singleEvent.venue.latLng[1]),
                          tilt: 30.0,
                          zoom: 15.0,
                        ),
                      ),
                    );
                  });
                },
                options: GoogleMapOptions(
                  cameraPosition: CameraPosition(
                      target: LatLng(19.0760, 72.8777), zoom: 10.0),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}

class SpeakerCard extends StatelessWidget {
  final Speaker speaker;
  const SpeakerCard({Key key, this.speaker}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 4.0, right: 4.0),
      decoration: BoxDecoration(
        color: Colors.greenAccent,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        image: DecorationImage(
            image: NetworkImage(
                speaker.image ),
            fit: BoxFit.cover),
      ),
      height: 144.0,
      width: 100.0,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        Container(
          height: 25.0,
          decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0))),
          child: Center(
              child: Material(
            color: Colors.transparent,
            child: Text(
              speaker.name ,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          )),
        ),
      ]),
    );
  }
}

class CustomScrollPhysics extends ScrollPhysics {
  CustomScrollPhysics({
    ScrollPhysics parent,
  }) : super(parent: parent);

  final double numOfItems = 4.0 - 1;

  @override
  CustomScrollPhysics applyTo(ScrollPhysics ancestor) {
    return new CustomScrollPhysics(parent: buildParent(ancestor));
  }

  double _getPage(ScrollPosition position) {
    return position.pixels / (position.maxScrollExtent / numOfItems);
  }

  double _getPixels(ScrollPosition position, double page) {
    return page * (position.maxScrollExtent / numOfItems);
  }

  double _getTargetPixels(
      ScrollPosition position, Tolerance tolerance, double velocity) {
    double page = _getPage(position);
    if (velocity < -tolerance.velocity)
      page -= 0.5;
    else if (velocity > tolerance.velocity) page += 0.5;
    return _getPixels(position, page.roundToDouble());
  }

  @override
  Simulation createBallisticSimulation(
      ScrollMetrics position, double velocity) {
    if ((velocity <= 0.0 && position.pixels <= position.minScrollExtent) ||
        (velocity >= 0.0 && position.pixels >= position.maxScrollExtent))
      return super.createBallisticSimulation(position, velocity);
    final Tolerance tolerance = this.tolerance;
    final double target = _getTargetPixels(position, tolerance, velocity);
    if (target != position.pixels)
      return new ScrollSpringSimulation(
          spring, position.pixels, target, velocity,
          tolerance: tolerance);
    return null;
  }
}
