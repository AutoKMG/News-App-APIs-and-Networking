import 'package:bloc/bloc.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/business/business_screen.dart';
import 'package:news_app/modules/science/science_screen.dart';
import 'package:news_app/modules/settings/settings_screen.dart';
import 'package:news_app/modules/sports/sports_screen.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

part 'state.dart';

class NewsHandler extends Cubit<NewsState> {
  NewsHandler() : super(NewsStateInitial()) {
    isDark = CacheHelper.getBoolean(key: 'isDark') ?? false;
    isRTL = CacheHelper.getBoolean(key: 'isRTL') ?? false;
    selectedCountry = CacheHelper.getString(key: 'selectedCountry') ?? 'us';
    getBusinessData();
    getSportsData();
    getScienceData();
  }
  String apiKey = 'baa537631ad14271b3e3971ce3a16f82';
  bool isRTL;
  bool isDark;
  int currentIndex = 0;
  String selectedCountry;
  var searchControllor = TextEditingController();

  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];
  List<dynamic> searchResult = [];
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
    CacheHelper.putBoolean(key: 'isRTL', value: isRTL).then((_) {
      emit(NewsStateToggleDirectionality());
    });
  }

  void toggleDarkTheme() {
    isDark = !isDark;
    CacheHelper.putBoolean(key: 'isDark', value: isDark).then((_) {
      emit(NewsStateToggleDarkTheme());
    });
  }

  void changeCountry(String country) {
    selectedCountry = country;
    CacheHelper.putString(key: 'selectedCountry', value: country).then((_) {
      getBusinessData();
      getScienceData();
      getSportsData();
      emit(NewsStateCountryChanged());
    });
  }

  void getBusinessData() {
    emit(NewsStateGetBusinessLoading());
    DioHelper.getData(
      path: 'v2/top-headlines',
      query: {
        'country': selectedCountry,
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
        'country': selectedCountry,
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
        'country': selectedCountry,
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

  void getSearchData(String keyword) {
    print(keyword);
    emit(NewsStateGetSearchLoading());
    DioHelper.getData(
      path: 'v2/everything',
      query: {
        'q': '$keyword',
        'apiKey': apiKey,
      },
    ).then((value) {
      searchResult = value.data["articles"];
      emit(NewsStateGetSearchSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(NewsStateGetSearchError(error.toString()));
    });
  }
}
