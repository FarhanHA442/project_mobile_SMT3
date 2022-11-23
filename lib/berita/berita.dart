import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/fonts/fonts.dart';

void main() {
  runApp(Berita());
}

class Berita extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BeritaPage(),
    );
  }
}

class BeritaPage extends StatelessWidget {
@override
  Widget build(BuildContext context) {
    return MaterialApp (
    home: Scaffold(
      body: Container(
        color: Colors.white,
          width: double.infinity,
          height: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            "PENDASIAL",
            style: 
                Signika. copyWith(fontSize: 25, color: Colors.black),
            ),
          Container(
            height: 1,
            width: 336,
            color: Colors.black54,
            ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                "Come On Alumni 2021",
                style: 
                Signika. copyWith(fontSize: 25, color: Colors.black),
                ),
          SizedBox(
            height: 10,
          ),
            ],
          ),
          Row(
            children: [
              Image.asset(
              'assets/foto sekolah dashboard.png',
              width: 186,
              height: 180,           
            ),
            ],
          ),
          Row(
            children: [
              Text(
                "A new way to find colleges, alumni and friends. \n"
                "\nHigh school alumni is a great way to connect with graduates\nof your almamater.\nThe alumni website will allow you to create your own page,\nincluding pictures and a biography of your life since graduation.\n"
                "\nHigh School alumni are free to access their contacts, grades,\nand more.",
                style: 
                Signika. copyWith(fontSize: 14, color: Colors.black),
                ),
            ],
          ),
        ],
      ),
      ),
    ),
    );
  }
}
