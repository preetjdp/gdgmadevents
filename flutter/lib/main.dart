import 'package:app_flutter/ui/HomePage/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    title: 'GDG MAD',
    home: Home(),
  ));
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('GDG MAD', style: TextStyle(color: Colors.black)),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search, color: Colors.black),
                //  onPressed: showSearch(context: context, delegate: DataSearch());
                onPressed: () {
                  showSearch(context: context, delegate: DataSearch());
                })
          ]),
      body: Container(child: HomePage()),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final cities = [
    "Mumbai",
    "Delhi",
    "Kerla",
    "Malad",
    "Borivali",
    "Samsung",
    "Xiaomi"
  ];

  final recentCities = ["Kerla", "Malad", "Borivali", "Samsung", "Xiaomi"];

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [IconButton(icon: Icon(Icons.clear), onPressed: () {
      query = '';
    })];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null); 
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {}

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    final suggestionList = query.isEmpty ? recentCities : cities;
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
            leading: Icon(Icons.location_city),
            title: Text(suggestionList[index]),
          ),
      itemCount: suggestionList.length,
    );
  }
}
