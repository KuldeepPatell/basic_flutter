import 'package:flutter/material.dart';
// import 'package:form/Views/log_in.dart';
import 'package:form/Views/splash_screen.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
// import 'package:form/log_in.dart';
// import 'package:form/Views/splash_screen.dart';

Future<void> main() async {
  sqfliteFfiInit();

  databaseFactory = databaseFactoryFfi;
  WidgetsFlutterBinding.ensureInitialized();
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
      home: SplashScreen(),
    );
  }
}
