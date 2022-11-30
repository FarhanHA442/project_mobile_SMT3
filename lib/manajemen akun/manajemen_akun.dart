import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/dashboard/dashboard.dart';
import 'package:project/data%20diri/data_diri.dart';
import 'package:project/fonts/fonts.dart';
import 'package:project/login/login.dart';
import 'package:project/password/password.dart';
import 'package:project/status%20alumni/status_alumni.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
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
                    Text("Akun",
                        style: Signika.copyWith(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    // tulisan Data diri
                    SizedBox(
                      height: 40,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DataDiri()));
                        },
                        child: Text(
                          "Data Diri",
                          style: Signika.copyWith(
                              fontSize: 20,
                              color: Color.fromRGBO(109, 109, 109, 1)),
                        )),
                    // memberi garis dibawah Data diri
                    Container(
                      height: 1,
                      width: 336,
                      color: Colors.black54,
                    ),
                    // tulisan Password
                    SizedBox(
                      height: 20,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PasswordPage()));
                        },
                        child: Text(
                          "Password",
                          style: Signika.copyWith(
                              fontSize: 20,
                              color: Color.fromRGBO(109, 109, 109, 1)),
                        )),
                    // memberi garis dibawah Password
                    Container(
                      height: 1,
                      width: 336,
                      color: Colors.black54,
                    ),
                    // tulisan status alumni
                    SizedBox(
                      height: 20,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StatusAlumniPage()));
                        },
                        child: Text(
                          "Status Alumni",
                          style: Signika.copyWith(
                              fontSize: 20,
                              color: Color.fromRGBO(109, 109, 109, 1)),
                        )),
                    // memberi garis dibawah status alumni
                    Container(
                      height: 1,
                      width: 336,
                      color: Colors.black54,
                    ),
                    // tulisan Keluar akun
                    SizedBox(
                      height: 20,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        child: Text(
                          "Keluar Akun",
                          style: Signika.copyWith(
                              fontSize: 20,
                              color: Color.fromRGBO(109, 109, 109, 1)),
                        )),
                    // memberi garis dibawah keluar akun
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
