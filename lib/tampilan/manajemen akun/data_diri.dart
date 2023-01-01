import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/tampilan/dashboard/dashboard.dart';
import 'package:project/fonts/fonts.dart';
import 'package:project/tampilan/manajemen%20akun/manajemen_akun.dart';
import 'package:project/tampilan/navigation%20bar/navigation_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataDiriPage extends StatefulWidget {
  @override
  State<DataDiriPage> createState() => _DataDiriPageState();
}

class _DataDiriPageState extends State<DataDiriPage> {
  var jenis_kelamin;

  final TextEditingController _nisnController = TextEditingController();

  final TextEditingController _namaController = TextEditingController();

  final TextEditingController _alamatController = TextEditingController();

  final TextEditingController _tahunLulusanController = TextEditingController();

  final TextEditingController _nomorHPController = TextEditingController();

  final _key = new GlobalKey<FormState>();

  checkForm() {
    final form = _key.currentState;
    if (form!.validate()) {
      form.save();
      updateProfile(
        _nisnController.text,
        _namaController.text,
        jenis_kelamin,
        _alamatController.text,
        _tahunLulusanController.text,
        _nomorHPController.text,
      );
    }
  }

  Future<void> updateProfile(String nisn, String nama, String jenis_kelamin,
      String alamat, String tahun_lulusan, String nomer_hp) async {
    if (_nisnController.text.isNotEmpty &&
        _namaController.text.isNotEmpty &&
        _alamatController.text.isNotEmpty &&
        _tahunLulusanController.text.isNotEmpty &&
        _nomorHPController.text.isNotEmpty &&
        jenis_kelamin != "-1") {
      Map<String, String> data = {
        'nisn': nisn,
        'nama_alumni': nama,
        'jenis_kelamin': jenis_kelamin,
        'alamat': alamat,
        'tahun_lulus': tahun_lulusan,
        'nomer_hp': nomer_hp,
        'update_profile': 'true',
      };
      var uri = Uri.parse(
          'http://192.168.1.6/pendasial_web/src/api/controllers/AlumniController.php');
      var response = await http.post(uri, body: data);
      if (response.statusCode == 200) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => NavigationBarSecond()));
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Data diri berhasil diubah!")));
        saveDataPreferences(nisn, nama, alamat, tahun_lulusan, nomer_hp);
      } else if (response.statusCode == 400) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Error, silahkan coba lagi nanti!")));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Isi field yang tersedia terlebih dahulu!")));
    }
  }

  storeData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _nisnController.text = prefs.getString('nisn').toString();
    _namaController.text = prefs.getString('nama').toString();
    _alamatController.text = prefs.getString('alamat').toString();
    _tahunLulusanController.text = prefs.getString('tahun_lulusan').toString();
    _nomorHPController.text = prefs.getString('nomer_hp').toString();
  }

  saveDataPreferences(String nisn, String nama, String alamat,
      String tahun_lulusan, String nomer_hp) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('nisn', nisn);
    prefs.setString('nama', nama);
    prefs.setString('alamat', alamat);
    prefs.setString('tahun_lulusan', tahun_lulusan);
    prefs.setString('nomer_hp', nomer_hp);
  }

  var _value = "-1";

  @override
  Widget build(BuildContext context) {
    storeData();
    final mediaQuery = MediaQuery.of(context).size.width;
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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NavigationBarSecond()));
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
                      "Data Diri",
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
                child: TextField(
                    readOnly: true,
                    controller: _nisnController,
                    decoration: InputDecoration(
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
                    controller: _namaController,
                    decoration: InputDecoration(
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
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                  onSaved: (e) => jenis_kelamin = e,
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
                      controller: _alamatController,
                      maxLines: null,
                      decoration: InputDecoration(
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
                    controller: _tahunLulusanController,
                    decoration: InputDecoration(
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
                    controller: _nomorHPController,
                    decoration: InputDecoration(
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
