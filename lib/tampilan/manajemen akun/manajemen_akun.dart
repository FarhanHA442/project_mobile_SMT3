import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/tampilan/manajemen akun/data_diri.dart';
import 'package:project/fonts/fonts.dart';
import 'package:project/tampilan/login register/login.dart';
import 'package:project/tampilan/navigation%20bar/navigation_bar.dart';
import 'package:project/tampilan/manajemen akun/password.dart';
import 'package:project/tampilan/manajemen akun/status_alumni.dart';

class ManajemenAkunPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                builder: (context) => DataDiriPage()));
                      },
                      child: Text(
                        "Data Diri",
                        style:
                            Signika.copyWith(fontSize: 20, color: Colors.black),
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
                        style:
                            Signika.copyWith(fontSize: 20, color: Colors.black),
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
                        style:
                            Signika.copyWith(fontSize: 20, color: Colors.black),
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
                      onPressed: () => showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: Text(
                                "Logout",
                                style: Signika.copyWith(
                                    fontSize: 20, color: Colors.black),
                              ),
                              content: Text(
                                "Apakah yakin keluar aplikasi?",
                                style: Signika.copyWith(
                                    fontSize: 20, color: Colors.black),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()));
                                  },
                                  child: Text(
                                    "Iya",
                                    style: Signika.copyWith(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                NavigationBarSecond()));
                                  },
                                  child: Text(
                                    "Tidak",
                                    style: Signika.copyWith(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      child: Text(
                        "Keluar Akun",
                        style:
                            Signika.copyWith(fontSize: 20, color: Colors.black),
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
    );
  }
}
