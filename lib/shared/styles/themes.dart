import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/shared/styles/colors.dart';

ThemeData appLightTheme = ThemeData(
  primarySwatch: Colors.deepOrange,
  floatingActionButtonTheme:
      FloatingActionButtonThemeData(backgroundColor: Colors.deepOrange),
  appBarTheme: AppBarTheme(
    titleSpacing: 20,
    backgroundColor: Colors.white,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark),
    elevation: 0.0,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  ),
  scaffoldBackgroundColor: Colors.white,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 20,
    selectedItemColor: Colors.deepOrange,
    type: BottomNavigationBarType.fixed,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
  ),
);

ThemeData appDarkTheme = ThemeData(
  primarySwatch: Colors.deepOrange,
  scaffoldBackgroundColor: darkModeColor,
  appBarTheme: AppBarTheme(
    titleSpacing: 20,
    backgroundColor: darkModeColor,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: darkModeColor,
        statusBarIconBrightness: Brightness.light),
    elevation: 0.0,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: darkModeColor,
    type: BottomNavigationBarType.fixed,
    unselectedItemColor: Colors.white,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(
        color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
  ),
);
