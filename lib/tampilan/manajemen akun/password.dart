import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:project/fonts/fonts.dart';
import 'package:project/tampilan/manajemen%20akun/manajemen_akun.dart';
import 'package:project/tampilan/navigation%20bar/navigation_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PasswordPage extends StatefulWidget {
  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  final TextEditingController _passwordLamaController = TextEditingController();

  final TextEditingController _passwordBaruController = TextEditingController();

  final TextEditingController _passwordBaruConfirmController =
      TextEditingController();

  final _key = new GlobalKey<FormState>();

  checkForm() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final form = _key.currentState;
    if (form!.validate()) {
      form.save();
      updatePassword(
          prefs.getString('nisn').toString(),
          _passwordLamaController.text,
          _passwordBaruController.text,
          _passwordBaruConfirmController.text);
    }
  }

  Future<void> updatePassword(String nisn, String password_lama,
      String password_baru, String password_confirm) async {
    if (_passwordLamaController.text.isNotEmpty &&
        _passwordBaruController.text.isNotEmpty &&
        _passwordBaruConfirmController.text.isNotEmpty) {
      Map<String, String> data = {
        'nisn': nisn,
        'password_lama': password_lama,
        'password_baru': password_baru,
        'password_baru_confirm': password_confirm,
        'update_password': 'true',
      };

      var uri = Uri.parse(
          'http://192.168.1.6/pendasial_web/src/api/controllers/AlumniController.php');
      var response = await http.post(uri, body: data);

      if (response.statusCode == 200) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => NavigationBarSecond()));
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Data diri berhasil diubah!")));
      } else if (response.statusCode == 401) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Password baru tidak sama dengan konfirmasi!")));
      } else if (response.statusCode == 400) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Password lama salah!")));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Isi field yang tersedia terlebih dahulu!")));
    }
  }

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
                child: TextField(
                    controller: _passwordLamaController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                      hintText: '\tPassword Sekarang',
                      labelText: '\tPassword Sekarang',
                    )),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                    controller: _passwordBaruController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                      hintText: '\tPassword Baru',
                      labelText: '\tPassword Baru',
                    )),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                    controller: _passwordBaruConfirmController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                      hintText: '\tKonfirmasi Password',
                      labelText: '\tKonfirmasi Password',
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
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => NavigationBarSecond()));
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
