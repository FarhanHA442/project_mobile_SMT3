import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/fonts/fonts.dart';
import 'package:project/tampilan/manajemen%20akun/manajemen_akun.dart';
import 'package:project/tampilan/navigation%20bar/navigation_bar.dart';

class StatusAlumniPage extends StatefulWidget {
  @override
  State<StatusAlumniPage> createState() => _StatusAlumniPageState();
}

class _StatusAlumniPageState extends State<StatusAlumniPage> {
  //dropdown
  var _value = "-1";
  //filepicker
  FilePickerResult? result;

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
                    "Status Alumni",
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
                // hintText: '\tFile Pendukung',
                labelText: '\tFile Pendukung',
              )),
            ),
            SizedBox(
              height: 25,
            ),
            //File Picker
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (result != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Selected file:',
                          style: Signika.copyWith(
                              fontSize: 16, color: Colors.black),
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: result?.files.length ?? 0,
                            itemBuilder: (context, index) {
                              return Text(result?.files[index].name ?? '',
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold));
                            }),
                      ],
                    ),
                  ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 150,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 63, 76, 180),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    onPressed: () async {
                      result = await FilePicker.platform
                          .pickFiles(allowMultiple: true);
                      if (result == null) {
                        print("No file selected");
                      } else {
                        setState(() {});
                        result?.files.forEach((element) {
                          print(element.name);
                        });
                      }
                    },
                    child: Text(
                      "File Picker",
                      style: Signika.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            //Batal dan Simpan
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
