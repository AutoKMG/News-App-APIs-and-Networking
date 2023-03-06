import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/news_layout.dart';
import 'package:news_app/shared/bloc_observer.dart';
import 'package:news_app/shared/logic/news/handler.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

// Stateless
// Stateful

// class MyApp

class MyApp extends StatelessWidget {
  // constructor
  // build

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsHandler(),
      child: MaterialApp(
        title: 'News App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: AppBarTheme(
                backgroundColor: Colors.white,
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark),
                elevation: 0.0,
                iconTheme: IconThemeData(color: Colors.black),
                titleTextStyle: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            scaffoldBackgroundColor: Colors.white,
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              elevation: 20,
              selectedItemColor: Colors.deepOrange,
              type: BottomNavigationBarType.fixed,
            )),
        home: NewsLayout(),
      ),
    );
  }
}
