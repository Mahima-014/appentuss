import 'package:appentus_task/utilities/constants.dart';
import 'package:appentus_task/utilities/db_helper.dart';
import 'package:appentus_task/views/home_screen.dart';
import 'package:appentus_task/views/login_screen.dart';
import 'package:appentus_task/views/second_screen.dart';
import 'package:appentus_task/views/signup_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialize();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes:
      {
        '/': (context) => LoginScreen(),
        Constants.loginScreenRoute : (context) => LoginScreen(),
        Constants.signupScreenRoute : (context) => SignupScreen(),
        Constants.homeScreenRoute:(context)=>HomeScreen(),
        Constants.secondScreenRoute:(context)=>SecondScreen(),
      },
    );
  }
  void initialize() {
    DbManager.connectToDB();
  }
}
