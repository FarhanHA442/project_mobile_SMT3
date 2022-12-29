import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/model/BeritaData.dart';
import 'package:project/tampilan/dashboard/dashboard.dart';
import 'package:project/fonts/fonts.dart';
import 'package:project/tampilan/navigation%20bar/navigation_bar.dart';
import 'package:project/data/api_Berita.dart';

class BeritaPage extends StatelessWidget {
  final BeritaDataList berita;
  late Future<BeritaData> beritaData;
  String imageBeritaUrl = 'http://192.168.98.191/pendasial_web/img/berita_image/';
  BeritaPage({Key? key, required this.berita}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double categoryHeight =
        MediaQuery.of(context).size.height * 0.30 - 50;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NavigationBarFirst()));
          },
          icon: Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: Text("Detail Berita",
            style: Signika.copyWith(
              fontSize: 24,
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          children: [
            Container(
              height: 1,
              width: 376,
              color: Colors.black54,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 10),
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Text(
                    berita.judul,
                    style: Signika.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 10, right: 10),
              child: Image.network(
                '${imageBeritaUrl}${berita.thumbnail_berita}',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 10, bottom: 20, right: 2),
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Text(
                    berita.deskripsi_berita,
                    style: Signika.copyWith(fontSize: 16, color: Colors.black),
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
