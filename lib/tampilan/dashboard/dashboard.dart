import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/tampilan/dashboard/berita.dart';
import 'package:project/fonts/fonts.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double categoryHeight =
        MediaQuery.of(context).size.height * 0.30 - 50;

    return Scaffold(
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
              style: Signika.copyWith(fontSize: 25, color: Colors.black),
            ),
            Container(
              height: 1,
              width: 376,
              color: Colors.black54,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              alignment: Alignment.topLeft,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Berita",
                        style: Signika.copyWith(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ]),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                margin: EdgeInsets.only(
                  right: 20,
                  left: 20,
                ),
                height: categoryHeight,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        InkWell(
                          // onTap: onTap,
                          child: Container(
                            // margin: EdgeInsets.all(10),
                            child: Card(
                              child: Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width: 200,
                                      child: Image.asset(
                                          "assets/foto sekolah dashboard.png",
                                          fit: BoxFit.cover,),
                                    ),
                                    // SizedBox(
                                    //   width: 20,
                                    // ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(top: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Text(
                                              "Judul",
                                              style: Signika.copyWith(
                                                  fontSize: 15,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Icon(
                                                  Icons.calendar_today,
                                                  size: 12,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text("Tanggal"),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          // onTap: onTap,
                          child: Container(
                            // margin: EdgeInsets.all(10),
                            child: Card(
                              child: Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width: 200,
                                      child: Image.asset(
                                          "assets/foto sekolah dashboard.png",
                                          fit: BoxFit.cover,),
                                    ),
                                    // SizedBox(
                                    //   width: 20,
                                    // ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(top: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Text(
                                              "Judul",
                                              style: Signika.copyWith(
                                                  fontSize: 15,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Icon(
                                                  Icons.calendar_today,
                                                  size: 12,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text("Tanggal"),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          // onTap: onTap,
                          child: Container(
                            // margin: EdgeInsets.all(10),
                            child: Card(
                              child: Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width: 200,
                                      child: Image.asset(
                                          "assets/foto sekolah dashboard.png",
                                          fit: BoxFit.cover,),
                                    ),
                                    // SizedBox(
                                    //   width: 20,
                                    // ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(top: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Text(
                                              "Judul",
                                              style: Signika.copyWith(
                                                  fontSize: 15,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Icon(
                                                  Icons.calendar_today,
                                                  size: 12,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text("Tanggal"),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          // onTap: onTap,
                          child: Container(
                            // margin: EdgeInsets.all(10),
                            child: Card(
                              child: Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width: 200,
                                      child: Image.asset(
                                          "assets/foto sekolah dashboard.png",
                                          fit: BoxFit.cover,),
                                    ),
                                    // SizedBox(
                                    //   width: 20,
                                    // ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(top: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Text(
                                              "Judul",
                                              style: Signika.copyWith(
                                                  fontSize: 15,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Icon(
                                                  Icons.calendar_today,
                                                  size: 12,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text("Tanggal"),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          // onTap: onTap,
                          child: Container(
                            // margin: EdgeInsets.all(10),
                            child: Card(
                              child: Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width: 200,
                                      child: Image.asset(
                                          "assets/foto sekolah dashboard.png",
                                          fit: BoxFit.cover,),
                                    ),
                                    // SizedBox(
                                    //   width: 20,
                                    // ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(top: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Text(
                                              "Judul",
                                              style: Signika.copyWith(
                                                  fontSize: 15,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Icon(
                                                  Icons.calendar_today,
                                                  size: 12,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text("Tanggal"),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          // onTap: onTap,
                          child: Container(
                            // margin: EdgeInsets.all(10),
                            child: Card(
                              child: Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width: 200,
                                      child: Image.asset(
                                          "assets/foto sekolah dashboard.png",
                                          fit: BoxFit.cover,),
                                    ),
                                    // SizedBox(
                                    //   width: 20,
                                    // ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(top: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Text(
                                              "Judul",
                                              style: Signika.copyWith(
                                                  fontSize: 15,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Icon(
                                                  Icons.calendar_today,
                                                  size: 12,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text("Tanggal"),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ],
                  
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}