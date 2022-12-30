import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/data/api_Berita.dart';
import 'package:project/model/BeritaData.dart';
import 'package:project/tampilan/dashboard/berita.dart';
import 'package:project/fonts/fonts.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  apiBerita api_berita = apiBerita();
  late Future<BeritaData> beritaData;
  String imageBeritaUrl = 'http://10.10.3.148/pendasial_web/img/berita_image/';

  @override
  void initState() {
    // TODO: implement initState
    beritaData = api_berita.getBeritaData();
    super.initState();
  }

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
          children: <Widget>[
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
                // width: MediaQuery.of(context).size.width * 0.9,
                margin: EdgeInsets.only(
                  right: 10,
                  left: 10,
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
                child: FutureBuilder(
                  future: beritaData,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          print('Returned ${index} times');
                          return BeritaItems(
                              judul: '${snapshot.data.beritaList[index].judul}',
                              thumbnail_berita:
                                  '${imageBeritaUrl}${snapshot.data.beritaList[index].thumbnail_berita}',
                              tanggal_berita:
                                  '${snapshot.data.beritaList[index].tanggal_berita}',
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => BeritaPage(
                                          berita: snapshot.data.beritaList[index],
                                        )));
                              });
                        },
                        itemCount: snapshot.data.beritaList.length,
                      );
                    } else if (snapshot.hasError) {
                      print('Has Error : ${snapshot.error}');
                      return Text("Error");
                    } else {
                      print('Loading');
                      return Text("Loading");
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget BeritaItems(
      {required String judul,
      required String thumbnail_berita,
      required String tanggal_berita,
      required Function()? onTap}) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      alignment: Alignment.topCenter,
      child: InkWell(
        onTap: onTap,
        child: Card(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 200,
                child: Image.network(
                  thumbnail_berita,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      judul,
                      style:
                          Signika.copyWith(fontSize: 15, color: Colors.black),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.calendar_today,
                          size: 12,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(tanggal_berita),
                      ],
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
