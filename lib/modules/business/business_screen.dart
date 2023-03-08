import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/logic/news/handler.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewsHandler newsHandler = BlocProvider.of<NewsHandler>(context);
    return BlocConsumer<NewsHandler, NewsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is! NewsStateGetBusinessLoading,
          builder: (context) {
            return ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return buildArticleItem();
              },
              separatorBuilder: (context, index) {
                return myDividor();
              },
              itemCount: 10,
            );
          },
          fallback: (context) {
            return Center(child: CircularProgressIndicator());
          },
        );
      },
    );
  }
}
