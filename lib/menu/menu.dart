import 'package:cermath/menu/profile.dart';
import 'package:cermath/shared/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/materi.dart';
import 'dashboard.dart';
import 'leaderboard.dart';

class Menu extends StatefulWidget {
  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int _currentIndex = 0;
  Color colorRed = HexColor('FC6F7E');
  Color colorPurple = HexColor('7C3694');
  Color colorGrey = HexColor('464646');

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Apakah kamu yakin?'),
        content: Text('Ingin menutup aplikasi'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('Tidak'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('Ya'),
          ),
        ],
      ),
    )) ?? false;
  }

  @override
  Widget build(BuildContext context) {

    Widget homeWidget = Container();

    switch(_currentIndex) {
      case 0:
        homeWidget = Dashboard();
        break;
      case 1:
        homeWidget = Leaderboard();
        break;
      case 2:
        homeWidget = Profile();
        break;
    }

    return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          body: homeWidget,
          bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (index) => setState(() {
              _currentIndex = index;
            }),
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.album, color: _currentIndex == 0 ? colorRed : Colors.black54, size: 30),
                  label: '1'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.leaderboard, color: _currentIndex == 1 ? colorRed : Colors.black54, size: 30),
                  label: '2'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_rounded, color: _currentIndex == 2 ? colorRed : Colors.black54, size: 30),
                  label: '3'
              )
            ],
          ),
        ),
    );
  }
}
