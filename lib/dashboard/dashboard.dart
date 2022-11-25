import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/fonts/fonts.dart';


class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
@override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                "Event Alumni",
                style: 
                Signika. copyWith(fontSize: 25, color: Colors.black),
                ),
            ],
          ),
          Row(
            children: [
              Container(
              width: 180,
              height: 150,
              decoration: new BoxDecoration(
                  color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 2,
                    spreadRadius: 0,
                    offset: Offset(0, 0)
                  ),
                ],
              ),
            ),
            ],
          ),
          SizedBox(
              height: 30,
            ),
            //bawahnya event
            Expanded(   //agar bisa full sampai bawah
            child: Container(
            decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow (
                color: Colors.black54,
                blurRadius: 10,
                spreadRadius: 0,
                offset: Offset(0, 0)
            ),
          ],
            ),
              child: Padding(
                padding: const EdgeInsets.all(190), //jarak kanan kiri
                child: Column(
                  children: [
                  ],
                ),
              ),        
            ),
          ),
          ],
        ),
        ),
      ),
    );
  }
}