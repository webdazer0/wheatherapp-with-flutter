import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wheatherapp/model/City.dart';
import 'package:wheatherapp/ui/common/header_widget.dart';
import 'package:wheatherapp/ui/common/debouncer.dart';
import 'package:http/http.dart' as http;
import 'package:wheatherapp/ui/common/loader_widget.dart';
import 'package:wheatherapp/ui/ui_constants.dart';

class AddCityPage extends StatefulWidget {
  @override
  _AddCityPageState createState() => _AddCityPageState();
}

class _AddCityPageState extends State<AddCityPage> {
  final debouncer = Debouncer();

  List<City> cities = [];
  bool loading = false;

  final String uri = 'https://api.openweathermap.org/data/2.5/weather/';
  final String apiKey = '737a55574b6c9d2e464d6307f8469006';
  final String celsius = 'metric';

  void onChangedText(String text) {
    debouncer.run(() {
      if (text.isNotEmpty) {
        requestSearch(text);
        print('text:  $text');
      }
    });
  }

  void requestSearch(String city) async {
    setState(() {
      loading = true;
    });

    final url = '$uri?appid=$apiKey&units=$celsius&q=$city&lang=it';
    final url2 = 'https://www.metaweather.com/api/location/search/?query=$city';

    final res = await http.get(Uri.parse(url2));
    final data = jsonDecode(res.body) as List;

    setState(() {
      cities = data.map((e) => City.fromJson(e)).toList();
      loading = false;
    });
    print(res.body);
    print(cities);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            HeaderWidget(
              title: 'Aggiungere Città',
            ),
            const SizedBox(
              height: 15,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: TextField(
                onChanged: onChangedText,
                decoration: InputDecoration(
                  hintText: 'Cerca città',
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cities.length,
                itemBuilder: (context, index) {
                  print(cities.length);
                  final city = cities[index];
                  return ListTile(
                    title: Text(
                      city.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.add,
                        color: primaryColor,
                      ),
                      onPressed: () => print("HEEY"),
                    ),
                  );
                },
              ),
            ),
            if(loading)
            Center(
              child: LoaderWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
