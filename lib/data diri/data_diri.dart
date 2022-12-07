import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/dashboard/dashboard.dart';
import 'package:project/fonts/fonts.dart';
import 'package:project/manajemen%20akun/manajemen_akun.dart';
import 'package:project/navigation%20bar/navigation_bar.dart';

class DataDiriPage extends StatelessWidget {
  var _value = "-1";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NavigationBarSecond()));
          },
          icon: Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10),
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Data Diri",
                    style: Signika.copyWith(fontSize: 25, color: Colors.black),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                  decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
                hintText: '\tMasukkan NISN',
                labelText: '\tNISN',
              )),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                  decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
                hintText: '\tMasukkan Nama',
                labelText: '\tNama',
              )),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
                value: _value,
                items: [
                  DropdownMenuItem(
                    child: Text('\tJenis Kelamin'),
                    value: "-1",
                  ),
                  DropdownMenuItem(
                    child: Text('\tLaki-laki'),
                    value: "1",
                  ),
                  DropdownMenuItem(
                    child: Text('\tPerempuan'),
                    value: "2",
                  ),
                ],
                onChanged: (v) {},
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 300,
                ),
                child: TextField(
                    maxLines: null,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                      hintText: '\tMasukkan Alamat',
                      labelText: '\tAlamat',
                    )),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                  decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
                hintText: '\tMasukkan Tahun Lulus',
                labelText: '\tTahun Lulus',
              )),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                  decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
                hintText: '\tMasukkan Nomor HP',
                labelText: '\tNomor HP',
              )),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 150,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(249, 7, 22, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NavigationBarSecond()));
                    },
                    child: Text(
                      "Batal",
                      style: Signika.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  width: 150,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(0, 84, 26, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NavigationBarSecond()));
                    },
                    child: Text(
                      "Simpan",
                      style: Signika.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
