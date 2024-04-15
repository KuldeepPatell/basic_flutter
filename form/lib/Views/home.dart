import 'package:flutter/material.dart';
import 'package:form/Views/navbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/user_details.jpg'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        drawer: NavBar(),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            'Home',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 26, 26, 26)),
          ),
          centerTitle: true,
        ),
        body: Container(),
      ),
    );
  }
}
