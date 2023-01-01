import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/fonts/fonts.dart';
import 'package:project/tampilan/login register/login.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var jenis_kelamin;
  final TextEditingController _nisnController = TextEditingController();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nomorHPController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();

  final _key = new GlobalKey<FormState>();

  checkForm() {
    final form = _key.currentState;
    if (form!.validate()) {
      form.save();
      register(
          _nisnController.text,
          _namaController.text,
          jenis_kelamin,
          _nomorHPController.text,
          _passwordController.text,
          _passwordConfirmController.text);
    }
  }

  Future<void> register(String nisn, String nama, String jenis_kelamin,
      String nomor, String password, String passwordConfirm) async {
    if (_nisnController.text.isNotEmpty &&
        _namaController.text.isNotEmpty &&
        jenis_kelamin != "-1" &&
        _nomorHPController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _passwordConfirmController.text.isNotEmpty) {
      Map<String, String> data = {
        'nisn': nisn,
        'nama_alumni': nama,
        'jenis_kelamin': jenis_kelamin,
        'nomer_hp': nomor,
        'password': password,
        'confirm_password': passwordConfirm,
        'submit_registration': 'true',
      };
      if (password == passwordConfirm) {
        var url =
            'http://192.168.1.6/pendasial_web/src/api/controllers/AlumniController.php';
        var response = await http.post(Uri.parse(url), body: data);

        var bodyData = jsonDecode(response.body);
        if (response.statusCode == 200) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("NISN berhasil terdaftar!")));
        } else if (response.statusCode == 400) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Siswa tidak berstatus Alumni!")));
        } else if (response.statusCode == 401) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("NISN tidak ditemukan!")));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Password tidak sama dengan konfirmasi password!")));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Isi semua field yang tersedia terlebih dahulu!")));
    }
  }

  //hidden password
  bool _isObscure = true;

  //dropdown
  var _value = "-1";

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
    child: Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(61, 131, 97, 1),
              Color.fromRGBO(28, 103, 88, 1)
            ],
          ),
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                width: mediaQuery * 0.90,
                child: Form(
                  key: _key,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'DAFTAR',
                        style: Signika.copyWith(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: TextField(
                            controller: _nisnController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(17),
                              ),
                              hintText: 'Masukkan NISN',
                              labelText: 'NISN',
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: TextField(
                            controller: _namaController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(17),
                              ),
                              hintText: 'Masukkan Nama',
                              labelText: 'Nama',
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 15.0),
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
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: TextField(
                            controller: _nomorHPController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(17),
                              ),
                              hintText: 'Masukkan No. HP/WA',
                              labelText: 'No. HP/WA',
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: TextField(
                            controller: _passwordController,
                            obscureText: _isObscure,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(17),
                              ),
                              hintText: 'Masukkan Password',
                              labelText: 'PASSWORD',
                              suffixIcon: IconButton(
                                icon: Icon(_isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: (() {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                }),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: TextField(
                            controller: _passwordConfirmController,
                            obscureText: _isObscure,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(17),
                              ),
                              hintText: 'Konfirmasi Password',
                              labelText: 'KONFIRMASI PASSWORD',
                              suffixIcon: IconButton(
                                icon: Icon(_isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: (() {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                }),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 200,
                        height: 45,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(68, 106, 70, 1),
                          ),
                          onPressed: () {
                            checkForm();
                          },
                          child: Text(
                            "Daftar",
                            style: Signika.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Sudah memiliki akun?",
                            style: Signika.copyWith(
                                fontSize: 12, color: Colors.black),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              },
                              child: Text(
                                "Masuk",
                                style: Signika.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 5,
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }
}
