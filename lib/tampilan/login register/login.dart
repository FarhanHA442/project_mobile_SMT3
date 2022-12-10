import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/tampilan/dashboard/berita.dart';
import 'package:project/fonts/fonts.dart';
import 'package:project/tampilan/navigation bar/navigation_bar.dart';
import 'package:project/tampilan/login register/register.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
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
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
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
                        child: TextField(
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
                      child: TextField(
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NavigationBarFirst()));
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
                                  color: Color.fromRGBO(19, 52, 22, 1)),
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
    );
  }
}
