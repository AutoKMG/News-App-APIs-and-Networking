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
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca'
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
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca'
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
