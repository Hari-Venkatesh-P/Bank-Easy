import 'package:flutter/material.dart';

import './simpleinterest.dart';

import './compoundinterest.dart';

void main() {
  runApp(MaterialApp(
    title: "Bank Easy",
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.deepPurpleAccent,
      accentColor: Colors.deepPurple,
    ),
    debugShowCheckedModeBanner: false,
    home: home(),
  ));
}

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Bank Easy"),
        ),
        body: Padding(
            padding: EdgeInsets.only(top: 230.0, left: 100.0),
            child: Column(
              children: <Widget>[
                Container(
                  color:Colors.black12,
                    margin:
                        EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 50),
                    width: 200.0,
                    height: 80.0,
                    child: RaisedButton(
                        color: Colors.deepPurpleAccent,
                        child: Text("SIMPLE INTEREST"),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SIForm()));
                        })),
                Container(
                    width: 200.0,
                    height: 80.0,
                    child: RaisedButton(
                        color: Colors.deepPurpleAccent,
                        child: Text("COMPOUND INTEREST"),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CIForm()));
                        })),
              ],
            )));
  }
}
