import 'package:cermath/menu/friends/findfriend.dart';
import 'package:cermath/shared/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({Key? key}) : super(key: key);

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {

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
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 200,
            width: width,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        color: Colors.transparent,
                      ),
                      Text(
                          'Leaderboard',
                          style: openSansBold(color: Colors.white, size: 21.0, weightfont: true)
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return FindFriend();
                          }));
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)
                          ),
                          child: Icon(
                            Icons.person_add,
                            color: colorRed,
                            size: 22,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
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
                          children: [
                            Text(
                              'Vikri Ramdhani',
                              style: openSansBold(color: Colors.white, size: 18.0, weightfont: true),
                            ),
                            Container(
                              width: 100,
                              height: 30,
                              decoration: BoxDecoration(
                                color: colorRed,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                '4500 Exp',
                                style: openSansBold(color: Colors.white, size: 17.0, weightfont: false),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            height: 90,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 130,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    ),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1
                    ),
                  ),
                  child: Text(
                    'Teman',
                    style: openSansBold(color: Colors.black87, size: 17.0, weightfont: false),
                  ),
                ),
                Container(
                  width: 130,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      border: Border.all(
                          color: Colors.grey,
                          width: 1
                      ),
                  ),
                  child: Text(
                    'Global',
                    style: openSansBold(color: Colors.black87, size: 17.0, weightfont: false),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: height-90-200-kBottomNavigationBarHeight-50,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 80,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.grey.shade300),
                      )
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 40,
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 10),
                          child: Text(
                            '1',
                            style: openSansBold(color: Colors.black87, size: 18.0, weightfont: true),
                          ),
                        ),
                        Container(
                          width: 80,
                          alignment: Alignment.center,
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(35)
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Vikri Ramdhani',
                                style: openSansBold(color: Colors.black87, size: 17.0, weightfont: true),
                              ),
                              Text(
                                '4500 Exp',
                                style: openSansBold(color: Colors.black87, size: 16.0, weightfont: false),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}
