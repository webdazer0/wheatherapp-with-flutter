import 'package:flutter/material.dart';
import 'package:wheatherapp/ui/cities/add/add_city_page.dart';
import 'package:wheatherapp/ui/common/header_widget.dart';
import 'package:wheatherapp/ui/ui_constants.dart';

class CitiesPage extends StatelessWidget {

  /* Metodo per cambiare "Activity" -> AddCityPage */
  void _handleNavigatePress(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(
          milliseconds: 400,
        ),
        /* pageBuilder: (ctx, animation1, animation2) => FadeTransition(
          opacity: animation1, 
          child: AddCityPage(),
          ), */
        pageBuilder: (ctx, animation1, animation2) => SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0.0, 1.0),
            end: Offset(0.0, 0.0),
          ).animate(animation1),
          child: AddCityPage(),
        ),
      ));
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
      floatingActionButton: FloatingActionButton(
         child: Icon(Icons.add),
         onPressed: () => _handleNavigatePress(context),
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