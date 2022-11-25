import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/dashboard/dashboard.dart';
import 'package:project/fonts/fonts.dart';
import 'package:project/register/register.dart';


class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size.width;
    return MaterialApp (
      debugShowCheckedModeBanner: false,
    home: Scaffold (
      body: Container (
          width: double.infinity,
          decoration: BoxDecoration (
            gradient: LinearGradient (
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: 
             [Color.fromRGBO(61, 131, 97, 1), 
              Color.fromRGBO(28, 103, 88, 1)],
            ),
        ),
        child: Column(
          children: [
            //Logo
          SizedBox(
            height: 53,
            ),
            Image.asset(
              'assets/logo ds.png',
              width: 186,
              height: 180,           
            ),
          SizedBox(
            height: 20,
          ),
          Expanded(   //agar bisa full sampai bawah
            child: Container(
            decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only
            (topLeft: Radius.circular(15),
            topRight: Radius.circular(15)),
            ),
            width: mediaQuery * 0.90,
              child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'LOGIN',
                      style: 
                        Signika. copyWith(fontSize: 40,fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: TextField(
                      decoration: InputDecoration(
                        border: 
                            OutlineInputBorder(
                          borderRadius: 
                              BorderRadius.circular(17),
                      ),
                      hintText: 'Masukkan NISN',
                      labelText: 'NISN',
                        ))
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: TextField(
                      decoration: InputDecoration(
                        border: 
                          OutlineInputBorder(
                          borderRadius: 
                              BorderRadius.circular(17),
                      ),
                      hintText: 'Masukkan Password',
                      labelText: 'PASSWORD',
                      suffixIcon: InkWell(
                        onTap: (){
                        },
                        child: Icon(Icons
                            .visibility_outlined)))),
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
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
                          }, 
                          child: Text(
                            "Masuk",
                            style: 
                              Signika. copyWith(fontSize: 16,fontWeight: FontWeight.bold, color: Colors.white),
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
                        style: 
                            Signika. copyWith(fontSize: 12, color: Colors.black),
                        ),
                      TextButton(onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
                      }, child: Text("Daftar",
                      style: 
                        Signika. copyWith(fontSize: 12,fontWeight: FontWeight.bold, color: Color.fromRGBO(19, 52, 22, 1)),
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
    );
  }
}