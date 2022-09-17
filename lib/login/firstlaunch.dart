import 'dart:convert';

import 'package:cermath/shared/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';

class FirstLaunch extends StatelessWidget {
  Color colorGrey = HexColor('464646');
  User? user = null;

  Future<void> checkAuth(context) async {
    final prefs = await SharedPreferences.getInstance();
    bool? userlogin = prefs.getBool('login');

    if(userlogin == true){
      String? userPref = prefs.getString('user');
      var userMap = jsonDecode(userPref!);
      user = User.fromJson(userMap);

      if(userMap['usertype_id'] == null || userMap['class_id'] == null || userMap['gender_id'] == null){
        Navigator.pushNamedAndRemoveUntil(context, "/information", (r) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(context, "/menu", (r) => false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    checkAuth(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 300,
                child: Image.asset('images/login/math.png')
            ),
            Container(
              child: Text(
                'Selamat datang di cerMath',
                style: GoogleFonts.openSans(
                    color: colorGrey,
                    fontSize: 31,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            Container(
              child: Text(
                'Aplikasi ini membantu siswa SMP belajar tentang basic dan mengasah skil Matematika',
                style: GoogleFonts.openSans(
                    color: colorGrey,
                    fontSize: 14
                ),
              ),
            ),
            Divider(
              color: Colors.transparent,
              height: 40,
            ),
            FlatButton(
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context).pushNamed('/login', arguments: 'hello i am from first page!');
              },
              child: Container(
                width: 200,
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(40))
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 110,
                      // color: Colors.blue,
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Mulai',
                        style: GoogleFonts.openSans(
                            fontSize: 20,
                            color: colorGrey,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black87,
                          ),
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.black87
                      ),
                      child: Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.white,
                        size: 25,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
