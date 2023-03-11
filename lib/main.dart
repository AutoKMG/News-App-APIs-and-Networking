import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/news_layout.dart';
import 'package:news_app/shared/bloc_observer.dart';
import 'package:news_app/shared/logic/news/handler.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
import 'package:news_app/shared/styles/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsHandler(),
      child: BlocConsumer<NewsHandler, NewsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          NewsHandler newsHandler = BlocProvider.of<NewsHandler>(context);
          return MaterialApp(
            title: 'News App',
            debugShowCheckedModeBanner: false,
            themeMode: newsHandler.isDark ? ThemeMode.dark : ThemeMode.light,
            theme: appLightTheme,
            darkTheme: appDarkTheme,
            home: Directionality(
              textDirection:
                  newsHandler.isRTL ? TextDirection.rtl : TextDirection.ltr,
              child: NewsLayout(),
            ),
          );
        },
      ),
    );
  }
}
