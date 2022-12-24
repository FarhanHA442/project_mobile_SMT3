import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/model/BeritaData.dart';
import 'package:project/tampilan/dashboard/dashboard.dart';
import 'package:project/fonts/fonts.dart';
import 'package:project/tampilan/navigation%20bar/navigation_bar.dart';

class BeritaPage extends StatelessWidget {
  final BeritaDataList berita;

  const BeritaPage({Key? key, required this.berita}) : super(key: key);
  
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
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: Text(berita.deskripsi_berita),
      ),
    );
  }
}
