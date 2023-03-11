import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/logic/news/handler.dart';
import 'package:country_picker/country_picker.dart';

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
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Country: ${newsHandler.selectedCountry}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      showCountryPicker(
                        context: context,
                        countryListTheme: CountryListThemeData(
                          flagSize: 25,
                          backgroundColor: Colors.white,
                          textStyle:
                              TextStyle(fontSize: 16, color: Colors.blueGrey),
                          bottomSheetHeight:
                              MediaQuery.of(context).size.height * 0.95,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                          inputDecoration: InputDecoration(
                            labelText: 'Search',
                            hintText: 'Start typing to search',
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color(0xFF8C98A8).withOpacity(0.2),
                              ),
                            ),
                          ),
                        ),
                        onSelect: (Country country) =>
                            newsHandler.changeCountry(country.countryCode),
                      );
                    },
                    child: Text("Change")),
              ],
            )
          ],
        ),
      );
    });
  }
}
