import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/logic/news/handler.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsHandler, NewsState>(builder: (context, state) {
      NewsHandler newsHandler = BlocProvider.of<NewsHandler>(context);
      return Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Dark Theme',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Switch(
                  value: newsHandler.isDark,
                  onChanged: (_) {
                    newsHandler.toggleDarkTheme();
                  },
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Right-To-Left',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Switch(
                  value: newsHandler.isRTL,
                  onChanged: (_) {
                    newsHandler.changeDirection();
                  },
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}
