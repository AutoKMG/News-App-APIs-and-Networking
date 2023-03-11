import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/logic/news/handler.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NewsHandler newsHandler = BlocProvider.of<NewsHandler>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: defaultFormField(
              context: context,
              controller: newsHandler.searchControllor,
              type: TextInputType.text,
              onChange: (value) {
                print(value);
                newsHandler.getSearchData(value);
              },
              validate: (String value) {
                if (value.isEmpty) {
                  return 'Please enter any input';
                }
                return null;
              },
              label: 'Search',
              prefix: Icons.search,
            ),
          ),
          Expanded(
            child: articlesScreenBuilder(
              newsHandler.searchResult,
              context,
              isSearch: true,
            ),
          ),
        ],
      ),
    );
  }
}
