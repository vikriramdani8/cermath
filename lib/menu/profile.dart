import 'package:cermath/menu/editprofile/editPassword.dart';
import 'package:cermath/shared/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'editprofile/editProfile.dart';

class Profile extends StatelessWidget {

  Color colorRed = HexColor('FC6F7E');
  Color colorPurple = HexColor('7C3694');
  Color colorGrey = HexColor('464646');

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    TextStyle openSansBold({required color, required size, required bool weightfont}){
      return GoogleFonts.openSans(
        color: color,
        fontSize: size,
        fontWeight: weightfont ? FontWeight.bold : FontWeight.normal
      );
    }

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 70,
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.transparent,
                ),
                Text(
                    'Profil',
                    style: openSansBold(color: Colors.white, size: 23.0, weightfont: true)
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return EditProfile();
                    }));
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.transparent,
                    child: Icon(
                      Icons.settings,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: colorPurple,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ]
            ),
          ),
          Container(
            height: 130,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(45)
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Vikri Ramdhani',
                        style: openSansBold(color: Colors.black87, size: 18.0, weightfont: true),
                      ),
                      Container(
                        // padding: EdgeInsets.symmetric(horizontal: 10),
                        // height: 30,
                        // decoration: BoxDecoration(
                        //   color: colorPurple,
                        //   borderRadius: BorderRadius.circular(20),
                        // ),
                        alignment: Alignment.center,
                        child: Text(
                          'Kelas 8',
                          style: openSansBold(color: Colors.black87, size: 17.0, weightfont: false),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Colors.grey.shade300,
                )
              )
            ),

          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Text(
              'Statistik',
              style: openSansBold(color: Colors.black87, size: 19.0, weightfont: true),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: (width*0.5)-30,
                  height: 80,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade500,
                      width: 1
                    ),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Total Exp',
                        style: openSansBold(color: Colors.black87, size: 15.0, weightfont:false),
                      ),
                      Text(
                        '4500',
                        style: openSansBold(color: Colors.black87, size: 18.0, weightfont:true),
                      )
                    ],
                  ),
                ),
                Container(
                  width: (width*0.5)-30,
                  height: 80,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey.shade500,
                          width: 1
                      ),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Global Rank',
                        style: openSansBold(color: Colors.black87, size: 15.0, weightfont:false),
                      ),
                      Text(
                        '6',
                        style: openSansBold(color: Colors.black87, size: 18.0, weightfont:true),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            height: 30,
            color: Colors.transparent,
          ),
          const Divider(
            height: 1,
            color: Colors.grey,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text(
              'Pengaturan Akun',
              style: openSansBold(color: Colors.black87, size: 19.0, weightfont: true),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                InkWell(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ubah Kata Sandi',
                        style: openSansBold(color: Colors.black87, size: 17.0, weightfont: false),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.black87,
                        size: 16,
                      )
                    ],
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return EditPassword();
                    }));
                  },
                ),
                const Divider(
                  height: 15,
                  color: Colors.transparent,
                ),
                InkWell(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ketentuan Pengguna',
                        style: openSansBold(color: Colors.black87, size: 17.0, weightfont: false),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.black87,
                        size: 16,
                      )
                    ],
                  ),
                  onTap: () {
                    print('Ketentuan Pengguna');
                  },
                ),
                const Divider(
                  height: 15,
                  color: Colors.transparent,
                ),
                InkWell(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Keluar',
                        style: openSansBold(color: Colors.black87, size: 17.0, weightfont: false),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.black87,
                        size: 16,
                      )
                    ],
                  ),
                  onTap: () {
                    print('Ketentuan Pengguna');
                  },
                )
              ],
            ),
          )
        ],
      )
    );
  }
}
