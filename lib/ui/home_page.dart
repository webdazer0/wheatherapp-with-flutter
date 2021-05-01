import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // Per visualizza l'alto e l'altezza del dispositivo
    print(MediaQuery.of(context).size);

    //Style custom per far assomigliare un ElevatedButton a quello deprecato RaisedButton
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      onPrimary: Colors.black,
      primary: Colors.grey[300],
      minimumSize: Size(88, 36),
      padding: EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
    );

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
                // color: Colors.red,
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
                    const SizedBox(
                      height: 80,
                    ),
                    Text(
                      'Hola, \nBienvenido',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    GestureDetector(
                      onTap: () => print('Ciaooooo, hai premuto su un Gesture Detector'),
                      child: Text(
                        'Que te parece si agregamos \nuna nueva ciudad?',
                        textAlign: TextAlign.start,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    RaisedButton(
                      onPressed: () => print('Ciao'),
                      elevation: 0,
                      splashColor: Color(0xFF346FFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          15.0,
                        ),
                      ),
                      child: Text(
                        'Aggiungi Città'
                      )
                    ),
                    ElevatedButton(
                      onPressed: () => print('Ciaoxxxxxx'),
                      style: raisedButtonStyle,
                      child: Text(
                        'Aggiungi Città 2'
                      )
                    )
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
