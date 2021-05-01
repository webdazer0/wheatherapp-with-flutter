import 'package:flutter/material.dart';
import 'package:wheatherapp/ui/common/header_widget.dart';
import 'package:wheatherapp/ui/common/debouncer.dart';

class AddCityPage extends StatefulWidget {
  @override
  _AddCityPageState createState() => _AddCityPageState();
}

class _AddCityPageState extends State<AddCityPage> {
  final debouncer = Debouncer();

  void onChangedText(String text) {
    debouncer.run(() {
      if(text.length > 3) print('text:  $text');
    });
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
          ],
        ),
      ),
    );
  }
}
