import 'package:cermath/shared/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FindFriend extends StatefulWidget {
  const FindFriend({Key? key}) : super(key: key);

  @override
  State<FindFriend> createState() => _FindFriendState();
}

class _FindFriendState extends State<FindFriend> {
  Color colorRed = HexColor('FC6F7E');
  Color colorPurple = HexColor('7C3694');
  Color colorGrey = HexColor('464646');

  TextEditingController searchUser = TextEditingController();

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

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 170,
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
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  size: 24,
                                )
                            ),
                          ),
                          Text(
                              'Temukan Teman',
                              style: openSansBold(color: Colors.white, weightfont: true, size: 20.0)
                          ),
                          Container(
                            width: 50,
                            height: 50,
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 40),
                        child: TextField(
                          controller: searchUser,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              hintText: "Cari berdasarkan username/email",
                              border: myinputborder(true),
                              enabledBorder: myinputborder(true),
                              focusedBorder: myfocusborder(true),
                              focusColor: Colors.white,
                              fillColor: Colors.white,
                              filled: true
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: width,
                  height: height-170-70,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        child: Text(
                          '3581 Hasil',
                          style: openSansBold(color: Colors.black87, size: 19.0, weightfont: true),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        width: double.infinity,
                        height: height-170-70-100,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey.shade400,
                                width: 1
                            ),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 80,
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                        flex: 4,
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 55,
                                              height: 55,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  borderRadius: BorderRadius.circular(30)
                                              ),
                                            ),
                                            Container(
                                              height: double.infinity,
                                              padding: EdgeInsets.only(left: 10),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    'maman',
                                                    style: openSansBold(color: Colors.black, size: 17.0, weightfont: true),
                                                  ),
                                                  Text(
                                                    'maman125',
                                                    style: openSansBold(color: Colors.grey.shade400, size: 16.0, weightfont: false),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: () {},
                                          child: Container(
                                              height: 50,
                                              child: Icon(
                                                Icons.person_add,
                                                color: colorRed,
                                                size: 30,
                                              )
                                          ),
                                        )
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
                                width: double.infinity,
                                height: 80,
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                        flex: 4,
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 55,
                                              height: 55,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  borderRadius: BorderRadius.circular(30)
                                              ),
                                            ),
                                            Container(
                                              height: double.infinity,
                                              padding: EdgeInsets.only(left: 10),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    'maman',
                                                    style: openSansBold(color: Colors.black, size: 17.0, weightfont: true),
                                                  ),
                                                  Text(
                                                    'maman125',
                                                    style: openSansBold(color: Colors.grey.shade400, size: 16.0, weightfont: false),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: () {},
                                          child: Container(
                                              height: 50,
                                              child: Icon(
                                                Icons.person_add,
                                                color: colorRed,
                                                size: 30,
                                              )
                                          ),
                                        )
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
                                width: double.infinity,
                                height: 80,
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                        flex: 4,
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 55,
                                              height: 55,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  borderRadius: BorderRadius.circular(30)
                                              ),
                                            ),
                                            Container(
                                              height: double.infinity,
                                              padding: EdgeInsets.only(left: 10),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    'maman',
                                                    style: openSansBold(color: Colors.black, size: 17.0, weightfont: true),
                                                  ),
                                                  Text(
                                                    'maman125',
                                                    style: openSansBold(color: Colors.grey.shade400, size: 16.0, weightfont: false),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: () {},
                                          child: Container(
                                              height: 50,
                                              child: Icon(
                                                Icons.person_add,
                                                color: colorRed,
                                                size: 30,
                                              )
                                          ),
                                        )
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
                                width: double.infinity,
                                height: 80,
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                        flex: 4,
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 55,
                                              height: 55,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  borderRadius: BorderRadius.circular(30)
                                              ),
                                            ),
                                            Container(
                                              height: double.infinity,
                                              padding: EdgeInsets.only(left: 10),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    'maman',
                                                    style: openSansBold(color: Colors.black, size: 17.0, weightfont: true),
                                                  ),
                                                  Text(
                                                    'maman125',
                                                    style: openSansBold(color: Colors.grey.shade400, size: 16.0, weightfont: false),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: () {},
                                          child: Container(
                                              height: 50,
                                              child: Icon(
                                                Icons.person_add,
                                                color: colorRed,
                                                size: 30,
                                              )
                                          ),
                                        )
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
                                width: double.infinity,
                                height: 80,
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                        flex: 4,
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 55,
                                              height: 55,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  borderRadius: BorderRadius.circular(30)
                                              ),
                                            ),
                                            Container(
                                              height: double.infinity,
                                              padding: EdgeInsets.only(left: 10),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    'maman',
                                                    style: openSansBold(color: Colors.black, size: 17.0, weightfont: true),
                                                  ),
                                                  Text(
                                                    'maman125',
                                                    style: openSansBold(color: Colors.grey.shade400, size: 16.0, weightfont: false),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: () {},
                                          child: Container(
                                              height: 50,
                                              child: Icon(
                                                Icons.person_add,
                                                color: colorRed,
                                                size: 30,
                                              )
                                          ),
                                        )
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
                                width: double.infinity,
                                height: 80,
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                        flex: 4,
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 55,
                                              height: 55,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  borderRadius: BorderRadius.circular(30)
                                              ),
                                            ),
                                            Container(
                                              height: double.infinity,
                                              padding: EdgeInsets.only(left: 10),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    'maman',
                                                    style: openSansBold(color: Colors.black, size: 17.0, weightfont: true),
                                                  ),
                                                  Text(
                                                    'maman125',
                                                    style: openSansBold(color: Colors.grey.shade400, size: 16.0, weightfont: false),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: () {},
                                          child: Container(
                                              height: 50,
                                              child: Icon(
                                                Icons.person_add,
                                                color: colorRed,
                                                size: 30,
                                              )
                                          ),
                                        )
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
                                width: double.infinity,
                                height: 80,
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                        flex: 4,
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 55,
                                              height: 55,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  borderRadius: BorderRadius.circular(30)
                                              ),
                                            ),
                                            Container(
                                              height: double.infinity,
                                              padding: EdgeInsets.only(left: 10),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    'maman',
                                                    style: openSansBold(color: Colors.black, size: 17.0, weightfont: true),
                                                  ),
                                                  Text(
                                                    'maman125',
                                                    style: openSansBold(color: Colors.grey.shade400, size: 16.0, weightfont: false),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: () {},
                                          child: Container(
                                              height: 50,
                                              child: Icon(
                                                Icons.person_add,
                                                color: colorRed,
                                                size: 30,
                                              )
                                          ),
                                        )
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
                                width: double.infinity,
                                height: 80,
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                        flex: 4,
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 55,
                                              height: 55,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  borderRadius: BorderRadius.circular(30)
                                              ),
                                            ),
                                            Container(
                                              height: double.infinity,
                                              padding: EdgeInsets.only(left: 10),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    'maman',
                                                    style: openSansBold(color: Colors.black, size: 17.0, weightfont: true),
                                                  ),
                                                  Text(
                                                    'maman125',
                                                    style: openSansBold(color: Colors.grey.shade400, size: 16.0, weightfont: false),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: () {},
                                          child: Container(
                                              height: 50,
                                              child: Icon(
                                                Icons.person_add,
                                                color: colorRed,
                                                size: 30,
                                              )
                                          ),
                                        )
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
                                width: double.infinity,
                                height: 80,
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                        flex: 4,
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 55,
                                              height: 55,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  borderRadius: BorderRadius.circular(30)
                                              ),
                                            ),
                                            Container(
                                              height: double.infinity,
                                              padding: EdgeInsets.only(left: 10),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    'maman',
                                                    style: openSansBold(color: Colors.black, size: 17.0, weightfont: true),
                                                  ),
                                                  Text(
                                                    'maman125',
                                                    style: openSansBold(color: Colors.grey.shade400, size: 16.0, weightfont: false),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: () {},
                                          child: Container(
                                              height: 50,
                                              child: Icon(
                                                Icons.person_add,
                                                color: colorRed,
                                                size: 30,
                                              )
                                          ),
                                        )
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
                                width: double.infinity,
                                height: 80,
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                        flex: 4,
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 55,
                                              height: 55,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  borderRadius: BorderRadius.circular(30)
                                              ),
                                            ),
                                            Container(
                                              height: double.infinity,
                                              padding: EdgeInsets.only(left: 10),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    'maman',
                                                    style: openSansBold(color: Colors.black, size: 17.0, weightfont: true),
                                                  ),
                                                  Text(
                                                    'maman125',
                                                    style: openSansBold(color: Colors.grey.shade400, size: 16.0, weightfont: false),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: () {},
                                          child: Container(
                                              height: 50,
                                              child: Icon(
                                                Icons.person_add,
                                                color: colorRed,
                                                size: 30,
                                              )
                                          ),
                                        )
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
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ]
          ),
        ),
      ),
    );
  }

  OutlineInputBorder myinputborder(bool align) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Colors.blueGrey,
        width: 0,
      )
    );
  }

  OutlineInputBorder myfocusborder(bool align) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Colors.blueGrey,
        width: 0,
      )
    );
  }
}