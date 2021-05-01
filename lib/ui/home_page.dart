import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size);

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
            child: Center(
              child: Container(
                color: Colors.red,
                constraints: BoxConstraints(maxWidth: 250.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Image.asset(
                      'assets/logo.png',
                      height: 50,
                    ),
                    Text(
                      'Hola, \nBienvenido',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          backgroundColor: Colors.red[200]),
                    ),
                    Text(
                      'Que te parece si agregamos \nuna nueva ciudad?',
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
