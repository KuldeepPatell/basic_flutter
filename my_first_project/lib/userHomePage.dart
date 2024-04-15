import 'package:flutter/material.dart';

//                         Switching Screen

class userHomePage extends StatelessWidget {
  var nameFromHome;
  userHomePage(this.nameFromHome);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UserHome'),
      ),
      body: Center(
        child: Text(
          'Welcome, ${nameFromHome.length - 10}',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
