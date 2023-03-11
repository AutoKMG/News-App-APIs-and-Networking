import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/business/business_screen.dart';
import 'package:news_app/modules/science/science_screen.dart';
import 'package:news_app/modules/settings/settings_screen.dart';
import 'package:news_app/modules/sports/sports_screen.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

part 'state.dart';

class NewsHandler extends Cubit<NewsState> {
  NewsHandler() : super(NewsStateInitial()) {
    getBusinessData();
    getSportsData();
    getScienceData();
  }
  String apiKey = '3afd108e1ee1445c80a26fd0cfaa356e';
  bool isRTL = false;
  bool isDark = false;
  int currentIndex = 0;
  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];
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

  void changeDirection() {
    isRTL = !isRTL;
    emit(NewsStateToggleDirectionality());
  }

  void toggleDarkTheme() {
    isDark = !isDark;
    emit(NewsStateToggleDarkTheme());
  }

  void getBusinessData() {
    emit(NewsStateGetBusinessLoading());
    DioHelper.getData(
      path: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': apiKey,
      },
    ).then((value) {
      business = value.data["articles"];
      emit(NewsStateGetBusinessSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(NewsStateGetBusinessError(error.toString()));
    });
  }

  void getSportsData() {
    emit(NewsStateGetSportsLoading());
    DioHelper.getData(
      path: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': apiKey,
      },
    ).then((value) {
      sports = value.data["articles"];
      emit(NewsStateGetSportsSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(NewsStateGetSportsError(error.toString()));
    });
  }

  void getScienceData() {
    emit(NewsStateGetScienceLoading());
    DioHelper.getData(
      path: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': apiKey,
      },
    ).then((value) {
      science = value.data["articles"];
      emit(NewsStateGetScienceSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(NewsStateGetScienceError(error.toString()));
    });
  }
}
