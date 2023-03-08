import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/logic/news/handler.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewsHandler newsHandler = BlocProvider.of<NewsHandler>(context);
    return BlocConsumer<NewsHandler, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("News App"),
            actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
          ),
          body: newsHandler.screens[newsHandler.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: newsHandler.bottomNavItems,
            currentIndex: newsHandler.currentIndex,
            onTap: (value) {
              newsHandler.changeIndex(value);
            },
          ),
        );
      },
    );
  }
}
