import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/tampilan/manajemen akun/data_diri.dart';
import 'package:project/fonts/fonts.dart';
import 'package:project/tampilan/login register/login.dart';
import 'package:project/tampilan/navigation%20bar/navigation_bar.dart';
import 'package:project/tampilan/manajemen akun/password.dart';
import 'package:project/tampilan/manajemen akun/status_alumni.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ManajemenAkunPage extends StatefulWidget {
  @override
  State<ManajemenAkunPage> createState() => _ManajemenAkunPageState();
}

class _ManajemenAkunPageState extends State<ManajemenAkunPage> {
  SharedPrefsLogOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('nisn');
    prefs.remove('nama');
    prefs.remove('jenis_kelamin');
    prefs.remove('nomer_hp');
    prefs.remove('alamat');
    prefs.remove('tahun_lulusan');
    prefs.remove('status_alumni');
    prefs.remove('nama_instansi');
    prefs.remove('password');

    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Berhasil Keluar dari Aplikasi")));
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

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
                  Text("Manajemen Akun",
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
                              content: Text(
                                "Apakah yakin keluar aplikasi?",
                                style: Signika.copyWith(
                                    fontSize: 20, color: Colors.black),
                              ),
                              actions: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        SharedPrefsLogOut();
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
