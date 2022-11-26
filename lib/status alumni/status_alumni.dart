import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/fonts/fonts.dart';

void main() {
  runApp(StatusAlumni());
}

class StatusAlumni extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StatusAlumniPage(),
    );
  }
}

class StatusAlumniPage extends StatelessWidget {
  var _value = "-1";
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
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Password",
                      style:
                          Signika.copyWith(fontSize: 25, color: Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
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
                      child: Text('\tStatus'),
                      value: "-1",
                    ),
                    DropdownMenuItem(
                      child: Text('\tBekerja'),
                      value: "1",
                    ),
                    DropdownMenuItem(
                      child: Text('\tKuliah'),
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
                child: TextField(
                    decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                  hintText: '\tMasukkan Instansi',
                  labelText: '\tInstansi',
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
                  hintText: '\tFile Pendukung',
                  labelText: '\tFile Pendukung',
                )),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(249, 7, 22, 1)),
                    child: Center(
                      child: Text(
                        "Batal",
                        style:
                            Signika.copyWith(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  )),
                  SizedBox(
                    width: 50,
                  ),
                  Expanded(
                      child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(0, 84, 26, 1)),
                    child: Center(
                      child: Text(
                        "Simpan",
                        style:
                            Signika.copyWith(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
