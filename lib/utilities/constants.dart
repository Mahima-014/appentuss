import 'package:flutter/material.dart';
class Constants
{
  //Routes
  static const String loginScreenRoute = '/loginScreen';
  static const String signupScreenRoute = '/signupScreen';
  static const String secondScreenRoute = '/secondScreen';
  static const String homeScreenRoute = '/homeScreen';

  //custom function for button

  static InputDecoration buildInputDecoration(IconData icons, String hinttext) {
    return InputDecoration(
      hintText: hinttext,
      prefixIcon: IconButton(
        icon: Icon(icons),
        onPressed: null,
        color: Colors.blue,
      ),
      filled: true,
      fillColor: Colors.white,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          const Radius.circular(15.0),
        ),
        borderSide: BorderSide(color: Colors.blue, width: 1.5),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          const Radius.circular(15.0),
        ),
        borderSide: BorderSide(
          color: Colors.blue,
          width: 1.5,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          const Radius.circular(15.0),
        ),
        borderSide: BorderSide(
          color: Colors.blue,
          width: 1.5,
        ),
      ),
    );
  }
  //function for appbar
  static AppBar appBar(String title)
    {
    return AppBar(
      title: Text(
        '$title',
      ),
      actions: <Widget>[
    IconButton(
    icon: Icon(
      Icons.person,
      color: Colors.white,
    ),
      onPressed: () {
    // do something
    },
    )]);

    }
}