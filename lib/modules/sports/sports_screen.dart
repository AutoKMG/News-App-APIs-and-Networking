import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/logic/news/handler.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewsHandler newsHandler = BlocProvider.of<NewsHandler>(context);
    return BlocConsumer<NewsHandler, NewsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return articlesScreenBuilder(newsHandler.sports, context);
      },
    );
  }
}
