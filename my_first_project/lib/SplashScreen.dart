import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_first_project/main.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 5), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(title: 'Hello'),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.blue,
      child: Center(
          child: Text(
        'Welcome',
        style: TextStyle(
            fontSize: 40, fontWeight: FontWeight.w500, color: Colors.white),
      )),
    ));
  }
}
