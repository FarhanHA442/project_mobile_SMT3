import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/fonts/fonts.dart';

void main() {
  runApp(ManajemenAkun());
}

class ManajemenAkun extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ManajemenAkunPage(),
    );
  }
}

class ManajemenAkunPage extends StatelessWidget {
@override
  Widget build(BuildContext context) {
    return MaterialApp (
      debugShowCheckedModeBanner: false,
    home: Scaffold (
      body: Container (
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10),
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // tulisan Akun
                SizedBox(
                  height: 51,
                ),
                Text(
                  "Akun",
                  style: 
                  Signika. copyWith(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold)
                  ),
                  // tulisan Data diri
                SizedBox(
                  height: 40,
                ),
                Column(),
                Text(
                  "Data Diri",
                style: 
                Signika. copyWith(fontSize: 20, color: Color.fromRGBO(109, 109, 109, 1)),
                ),
                // memberi garis dibawah Data diri
                SizedBox(
                  height: 10,
                ),
                Container(
                height: 1,
                width: 336,
                color: Colors.black54,
                ),
                // tulisan Password
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Password",
                style: 
                Signika. copyWith(fontSize: 20, color: Color.fromRGBO(109, 109, 109, 1)),
                ),
                // memberi garis dibawah Password
                SizedBox(
                  height: 10,
                ),
                Container(
                height: 1,
                width: 336,
                color: Colors.black54,
                ),
                // tulisan status alumni
                SizedBox(
                  height: 20,
                ),
                Column(),
                Text(
                  "Status Alumni",
                style: 
                Signika. copyWith(fontSize: 20, color: Color.fromRGBO(109, 109, 109, 1)),
                ),
                // memberi garis dibawah status alumni
                SizedBox(
                  height: 10,
                ),
                Container(
                height: 1,
                width: 336,
                color: Colors.black54,
                ),
                // tulisan Keluar akun
                SizedBox(
                  height: 20,
                ),
                Column(),
                Text(
                  "Keluar Akun",
                style: 
                Signika. copyWith(fontSize: 20, color: Color.fromRGBO(109, 109, 109, 1)),
                ),
                // memberi garis dibawah keluar akun
                SizedBox(
                  height: 10,
                ),
                Container(
                height: 1,
                width: 336,
                color: Colors.black54,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    ),
    );
  }
}