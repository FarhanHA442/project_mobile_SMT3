import 'dart:convert';
import "package:http/http.dart" as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/tampilan/dashboard/berita.dart';
import 'package:project/fonts/fonts.dart';
import 'package:project/tampilan/dashboard/dashboard.dart';
import 'package:project/tampilan/navigation bar/navigation_bar.dart';
import 'package:project/tampilan/login register/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //controllerlogin
  final TextEditingController _nisnController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  addPreferences(Map<String, dynamic> data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('nisn', data['data']['nisn']);
    prefs.setString('nama', data['data']['nama']);
    prefs.setString('jenis_kelamin', data['data']['jenis_kelamin']);
    prefs.setString('nomer_hp', data['data']['nomer_hp']);
    prefs.setString('alamat', data['data']['alamat']);
    prefs.setString('tahun_lulusan', data['data']['tahun_lulusan']);
    prefs.setString(
        'status_alumni',
        data['data']['status_alumni'] == null
            ? ""
            : data['data']['status_alumni']);
    prefs.setString('nama_instansi', data['data']['nama_instansi']);
    prefs.setString('password', data['data']['password']);
  }

  Future<void> login(String usernisn, String userpassword) async {
    if (_nisnController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      Map<String, String> data = {
        'nisn': usernisn,
        'password': userpassword,
        'submit_login': 'true',
      };
      var url =
          'http://192.168.1.6/pendasial_web/src/api/controllers/AlumniController.php';
      var response = await http.post(Uri.parse(url), body: data);
      Map<String, dynamic> bodyData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => NavigationBarFirst()));
        addPreferences(bodyData);
      } else if (response.statusCode == 400) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("NISN/Password tidak ditemukan!")));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Isi semua field yang tersedia terlebih dahulu!")));
    }
  }

  //hidden password
  bool _isObscure = true;
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
                Image.asset(
                  'assets/logo ds.png',
                  width: 186,
                  height: 180,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  width: mediaQuery * 0.90,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'LOGIN',
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
                          child: TextFormField(
                              controller: _nisnController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(17),
                                ),
                                hintText: 'Masukkan NISN',
                                labelText: 'NISN',
                              ))),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: TextFormField(
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
                            String usernisn = _nisnController.text;
                            String userpassword = _passwordController.text;
                            login(usernisn, userpassword);
                          },
                          child: Text(
                            "Masuk",
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
                            "Belum memiliki akun?",
                            style: Signika.copyWith(
                                fontSize: 12, color: Colors.black),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RegisterPage()));
                              },
                              child: Text(
                                "Daftar",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
