import 'package:flutter/material.dart';
import 'package:wheatherapp/ui/common/header_widget.dart';
import 'package:wheatherapp/ui/ui_constants.dart';

class CitiesPage extends StatelessWidget {
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
      floatingActionButton: FloatingActionButton(
         child: Icon(Icons.add),
         onPressed: () => print('Ciaone 🤣!'),
         backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            HeaderWidget(
              title: 'Le mie città',
            ),
            Expanded(
              child: Center(
                child: Text("Nessuna città selezionata :'( "),
              ),
              
            )
          ],
        ),
      ),
    );
  }
}