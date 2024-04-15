import 'package:flutter/material.dart';
import 'package:myfirstproject/classic_jacket.dart';
import 'package:myfirstproject/create_account_screen_2.dart';
import 'package:myfirstproject/otp_verification_screen.dart';
import 'package:myfirstproject/selected_item_screen.dart';
import 'package:myfirstproject/shipingScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 251, 252, 255)),
        useMaterial3: true,
      ),
      home: Shipping(),
    );
  }
}
