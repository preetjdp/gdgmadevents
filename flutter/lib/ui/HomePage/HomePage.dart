import 'package:app_flutter/ui/HomePage/EventCard.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../blocs/events_bloc.dart';
import '../../models/event_model.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  final List<String> imgList = [
    'https://pbs.twimg.com/media/Dsv7e9bXoAAwFT0.jpg:large',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://madmeetup.com/img/cover.jpg',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  void initState() {
    bloc.fetchAllEvents();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      // physics: AlwaysScrollableScrollPhysics(),
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: CarouselSlider(
              items: [1, 2, 3, 4, 5, 6].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        image: DecorationImage(
                          image: NetworkImage(imgList[i - 1]),
                          fit: BoxFit.cover,
                        ),
                      ),
                      // child: Text(
                      //   'text $i',
                      //   style: TextStyle(fontSize: 16.0),
                      // )
                    );
                  },
                );
              }).toList(),
              height: 200.0,
              autoPlay: true),
        ),
        StreamBuilder(
          stream: bloc.allevents,
          builder: (context, AsyncSnapshot<EventModel> snapshot) {
            if (snapshot.hasData) {
              return SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                delegate: SliverChildBuilderDelegate(
                    (context, index) => EventCard(
                          singleEvent: snapshot.data.event[index],
                        ),
                    childCount: snapshot.data.event.length),
              );
            }
            else if (snapshot.hasError) {
              return SliverToBoxAdapter(child: Text('Error!!!!!! Solve ASAP'));
            }
            return SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()));
          },
        )
      ],
    );
  }
}
