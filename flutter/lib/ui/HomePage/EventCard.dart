import 'package:app_flutter/ui/EventDetail/EventDetail.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/event_model.dart';

class EventCard extends StatelessWidget {
  final Event singleEvent;

  EventCard({this.singleEvent});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => EventDetail(singleEvent: singleEvent,)));
      },
      child: Card(
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(6.0))),
                height: 50.0,
                child: Center(
                  child: Text(
                    singleEvent.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                height: 50.0,
                margin: EdgeInsets.all(5.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container( 
                              decoration: BoxDecoration(color: Colors.white),
                              height: 20.0,
                              width: 100.0,
                              child: Text(
                                singleEvent.date,
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(color: Colors.white),
                              height: 20.0,
                              width: 60.0,
                              child: Text(
                                DateTime.fromMillisecondsSinceEpoch(
                                            singleEvent.time)
                                        .hour
                                        .toString() +
                                    ':' +
                                    DateTime.fromMillisecondsSinceEpoch(
                                            singleEvent.time)
                                        .minute
                                        .toString(),
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ]),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: IconButton(
                          icon: Icon(
                            Icons.location_on,
                            color: Colors.white54,
                          ),
                          onPressed: () {
                            launch(singleEvent.venue.link);
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
          ),
    );
  }
}
