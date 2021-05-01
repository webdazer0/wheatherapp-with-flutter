import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(

        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/welcome.jpg',
              fit: BoxFit.cover,
            ),
          ),

          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/logo.png', 
                  height: 50,
                ),
              ],
            ),
          )

        ],
      ),
    );
  }
}