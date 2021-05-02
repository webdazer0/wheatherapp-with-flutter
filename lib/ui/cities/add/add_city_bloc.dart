import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wheatherapp/model/City.dart';
import 'package:wheatherapp/ui/common/debouncer.dart';
import 'package:http/http.dart' as http;

class AddCityBloc extends ChangeNotifier {
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
    loading = true;
    notifyListeners();

    final url = '$uri?appid=$apiKey&units=$celsius&q=$city&lang=it';
    final url2 = 'https://www.metaweather.com/api/location/search/?query=$city';

    final res = await http.get(Uri.parse(url2));
    final data = jsonDecode(res.body) as List;


      cities = data.map((e) => City.fromJson(e)).toList();
      loading = false;
      notifyListeners();
    print(res.body);
    print(cities);
  }

  void addCity(City city) async {
    final url3 = 'https://www.metaweather.com/api/location/${city.id}';

    final res = await http.get(Uri.parse(url3));
    final data = jsonDecode(res.body) as List;
  }
}
