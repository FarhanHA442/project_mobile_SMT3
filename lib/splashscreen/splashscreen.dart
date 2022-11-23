import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/fonts/fonts.dart';

void main() {
  runApp(SplashScreen());
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreenPage(),
    );
  }
}

class SplashScreenPage extends StatelessWidget {
@override
  Widget build(BuildContext context) {
    return MaterialApp (
      debugShowCheckedModeBanner: false,
    home: Scaffold (
      body: Container (
          width: double.infinity,
          decoration: BoxDecoration (
            gradient: LinearGradient (
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: 
             [Color.fromRGBO(61, 131, 97, 1), 
              Color.fromRGBO(28, 103, 88, 1)],
            ),
        ),
        child: Column(
          children: [
          SizedBox (
              height: 150,
            ),
            Image.asset('assets/logo ds.png' , 
              width: 206, 
              height: 200,
          ),
          SizedBox (
              height: 20,
          ),
          Text(
            "Welcome To \n Pendasial",
            style: 
              Signika. copyWith(fontSize: 24, color: Colors.white) ,textAlign: TextAlign.center,
            ),
          SizedBox (
              height: 20,
          ),
          Text(
            "Laman ini diperuntukkan untuk \n mengelola pendataan alumni yang \n dilaksanakan oleh SMA Darus Sholah.",
            style: 
              Signika. copyWith(fontSize: 14, color: Colors.white) ,textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ),
    );
  }
}