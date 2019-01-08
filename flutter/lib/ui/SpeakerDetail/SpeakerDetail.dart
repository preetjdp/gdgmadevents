import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SpeakerDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     elevation: 0.0,
    //     backgroundColor: Colors.transparent,
    //   ),
    //   body: Container(
    //     decoration: BoxDecoration(
    //         gradient: LinearGradient(
    //       colors: <Color>[new Color(0x00736AB7), new Color(0xFF010916)],
    //       stops: [0.0, 0.5],
    //       begin: const FractionalOffset(0.0, 0.0),
    //       end: const FractionalOffset(0.0, 1.0),
    //     )),
    //     child: Column(
    //       // mainAxisAlignment: MainAxisAlignment.center,
    //       children: <Widget>[
    //         Container(
    //           height: 220.0,
    //           width: MediaQuery.of(context).size.width,
    //           child: Stack(
    //             children: <Widget>[
    //               Container(
    //                 height: 160.0,
    //                 width: MediaQuery.of(context).size.width,
    //                 margin: EdgeInsets.only(top: 50.0, left: 30.0, right: 30.0),
    //                 decoration: BoxDecoration(
    //                     color: Color.fromRGBO(18, 0, 94, 1.0),
    //                     borderRadius: BorderRadius.all(Radius.circular(8.0)),
    //                     boxShadow: [
    //                       BoxShadow(
    //                         color: Colors.red,
    //                         offset: new Offset(10.0, 5.0),
    //                         blurRadius: 20.0
    //                       )
    //                     ]),
    //               ),
    //               Container(
    //                   margin: EdgeInsets.only(left: 40.0),
    //                   child: Hero(tag: 'test', child: SpeakerCard())),
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color.fromRGBO(33, 33, 33, 1.0),
        child: Icon(
          Icons.favorite,
          color: Colors.redAccent,
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            floating: true,
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Container(
              // color: Colors.orangeAccent,
              height: 225.0,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 160.0,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: 55.0, left: 30.0, right: 30.0),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(18, 0, 94, 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.red,
                              offset: new Offset(10.0, 5.0),
                              blurRadius: 20.0)
                        ]),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 42.0,
                            width: 220.0,
                            margin: EdgeInsets.only(bottom: 10.0, left: 20.0),
                            // color: Colors.blueAccent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Container(
                                  height: 42.0,
                                  width: 42.0,
                                  color: Color.fromRGBO(85, 172, 238, 1),
                                  child: IconButton(
                                    icon: Icon(FontAwesomeIcons.twitter),
                                    onPressed: () {},
                                  ),
                                ),
                                Container(
                                  height: 42.0,
                                  width: 42.0,
                                  color: Color.fromRGBO(255, 228, 0, 1),
                                  child: IconButton(
                                    icon: Icon(FontAwesomeIcons.snapchatGhost),
                                    onPressed: () {},
                                  ),
                                ),
                                Container(
                                  height: 42.0,
                                  width: 42.0,
                                  color: Colors.black,
                                  child: IconButton(
                                    color: Colors.white,
                                    icon: Icon(FontAwesomeIcons.mediumM),
                                    onPressed: () {},
                                  ),
                                ),
                                Container(
                                  height: 42.0,
                                  width: 42.0,
                                  color: Color.fromRGBO(242, 103, 152, 1),
                                  child: IconButton(
                                    icon: Icon(FontAwesomeIcons.dribbble),
                                    onPressed: () {},
                                  ),
                                )
                              ],
                            ),
                          ),
                        ]),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 40.0),
                      child: Hero(tag: 'test', child: SpeakerCard())),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                      margin: EdgeInsets.all(10.0),
                      height: 150.0,
                      color: Colors.grey,
                    ),
                childCount: 10),
          )
        ],
      ),
    );
  }
}

class SpeakerCard extends StatelessWidget {
  const SpeakerCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: Colors.greenAccent,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        image: DecorationImage(
            image: NetworkImage(
                'https://pbs.twimg.com/profile_images/1065955693444792320/7Abo5iwb_400x400.jpg'),
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
              'Avani shah',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          )),
        ),
      ]),
    );
  }
}
