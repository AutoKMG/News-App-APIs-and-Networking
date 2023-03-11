import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/search/search.dart';
import 'package:news_app/shared/logic/news/handler.dart';

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
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SearchScreen();
                        },
                      ),
                    );
                  },
                  icon: Icon(Icons.search))
            ],
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
