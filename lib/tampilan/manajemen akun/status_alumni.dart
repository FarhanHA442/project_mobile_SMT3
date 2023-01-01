import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/fonts/fonts.dart';
import 'package:project/tampilan/manajemen%20akun/manajemen_akun.dart';
import 'package:project/tampilan/navigation%20bar/navigation_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StatusAlumniPage extends StatefulWidget {
  @override
  State<StatusAlumniPage> createState() => _StatusAlumniPageState();
}

class _StatusAlumniPageState extends State<StatusAlumniPage> {
  //dropdown
  var _value = "-1";
  File filePickerVal = File('');
  //filepicker
  final TextEditingController txtFilePicker = TextEditingController();
  FilePickerResult? result;

  var status_alumni;
  final TextEditingController _namaInstansiController = TextEditingController();
  final _key = new GlobalKey<FormState>();

  checkForm() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final form = _key.currentState;
    if (form!.validate()) {
      form.save();
      updateStatus(
        status_alumni,
        _namaInstansiController.text,
      );
    }
  }

  Future<void> updateStatus(String status_alumni, String nama_instansi) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (status_alumni != "-1" &&
        _namaInstansiController.text.isNotEmpty &&
        txtFilePicker.text.isNotEmpty) {
      try {
        var uri = Uri.parse(
            'http://192.168.1.6/pendasial_web/src/api/controllers/AlumniController.php');
        var request = http.MultipartRequest('POST', uri);

        request.fields['nisn'] = prefs.getString('nisn').toString();
        request.fields['status_alumni'] = status_alumni;
        request.fields['nama_instansi'] = nama_instansi;
        request.fields['update_status'] = 'true';

        request.files.add(http.MultipartFile('img_pendukung',
            filePickerVal.readAsBytes().asStream(), filePickerVal.lengthSync(),
            filename: filePickerVal.path.split('/').last));
        var res = await request.send();
        var responseBytes = await res.stream.toBytes();
        var responseString = utf8.decode(responseBytes);

        var responseCode = res.statusCode;
        final data = jsonDecode(responseString);
        if (responseCode == 200) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => NavigationBarSecond()));
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                  "Permintaan mengubah status alumni dikirim! Silahkan tunggu!")));
        } else if (responseCode == 400) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Sertakan foto validasi")));
        }
      } catch (e) {}
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Isi semua field yang tersedia terlebih dahulu")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NavigationBarSecond()));
            },
            icon: Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          child: Form(
            key: _key,
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
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                    ),
                    onSaved: (e) => status_alumni = e,
                    value: _value,
                    items: [
                      DropdownMenuItem(
                        child: Text('\tStatus'),
                        value: "-1",
                      ),
                      DropdownMenuItem(
                        child: Text('\tKuliah'),
                        value: "1",
                      ),
                      DropdownMenuItem(
                        child: Text('\tBekerja'),
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
                      controller: _namaInstansiController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                        hintText: '\tMasukkan Instansi',
                        hintStyle: TextStyle(color: Colors.black),
                        labelStyle: TextStyle(color: Colors.black),
                        labelText: '\tInstansi',
                      )),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        child: TextFormField(
                            readOnly: true,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "Tidak ada file yang dipilih";
                              } else {
                                return null;
                              }
                            },
                            controller: txtFilePicker,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13),
                              ),
                              // hintText: '\tFile Pendukung',
                              labelText: '\tFile Pendukung',
                            )),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    //button file picker
                    Container(
                      width: 100,
                      height: 50,
                      margin: EdgeInsets.only(right: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 63, 76, 180),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        onPressed: () async {
                          FilePickerResult? result = await FilePicker.platform
                              .pickFiles(
                                  allowMultiple: false,
                                  type: FileType.custom,
                                  allowedExtensions: ['jpg', 'jpeg', 'png']);
                          if (result == null) {
                            print("Tidak ada file yang dipilih");
                          } else {
                            setState(() {
                              txtFilePicker.text = result.files.single.name;
                              filePickerVal =
                                  File(result.files.single.path.toString());
                            });
                          }
                        },
                        child: Text(
                          "Pilih File",
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
                          checkForm();
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
        ),
      ),
    );
  }
}
