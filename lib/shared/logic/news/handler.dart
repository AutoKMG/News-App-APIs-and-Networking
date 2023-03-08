import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:news_app/modules/business/business_screen.dart';
import 'package:news_app/modules/science/science_screen.dart';
import 'package:news_app/modules/settings/settings_screen.dart';
import 'package:news_app/modules/sports/sports_screen.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

part 'state.dart';

class NewsHandler extends Cubit<NewsState> {
  NewsHandler() : super(NewsStateInitial());

  int currentIndex = 0;
  List<dynamic> business = [];
  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingsScreen(),
  ];

  List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(NewsStateIndexChanged());
  }

  void getBusinessData() {
    emit(NewsStateGetBusinessLoading());
    DioHelper.getData(
      path: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca'
      },
    ).then((value) {
      business = value.data["articles"];
      print(business[0]["title"]);
      emit(NewsStateGetBusinessSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(NewsStateGetBusinessError(error.toString()));
    });
  }
}
