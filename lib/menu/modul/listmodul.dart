import 'dart:convert';

import 'package:cermath/menu/editprofile/editPassword.dart';
import 'package:cermath/shared/hexcolor.dart';
import 'package:cermath/shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../service/network.dart';

class ListModul extends StatefulWidget {
  @override
  State<ListModul> createState() => _ListModulState();
}

class _ListModulState extends State<ListModul> {
  Color colorRed = HexColor('FC6F7E');

  Color colorPurple = HexColor('7C3694');

  Color colorGrey = HexColor('464646');

  Shared shared = new Shared();

  var lessonId = "";
  var lessonName = "";
  var jumlahMateri = 0;

  settingArgument(BuildContext ctx){
    final arguments = (ModalRoute.of(ctx)?.settings.arguments ?? <String, dynamic>{}) as Map;
    if(lessonId != arguments['lessonId']){
      lessonId = arguments['lessonId'];
      lessonName = arguments['lessonName'];
      getLengthMateri(lessonId);
    }
  }

  Future<void> getLengthMateri(lessonId) async{
    var responses = await Network().getSubMateri(lessonId);
    var resultBody = json.decode(responses.body);

    List data = resultBody['data'] as List;
    jumlahMateri = data.length;

    setState(() {});
  }

  Future<void> getSubMateri(lessonId) async {
    var responses = await Network().getSubMateri(lessonId);
    var resultBody = json.decode(responses.body);


    return resultBody['data'];
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    settingArgument(context);

    TextStyle openSansBold({required color, required size, required bool weightfont}){
      return GoogleFonts.openSans(
          color: color,
          fontSize: size,
          fontWeight: weightfont ? FontWeight.bold : FontWeight.normal
      );
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
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
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      Divider(
                        height: 30,
                        color: Colors.transparent,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              lessonName,
                              style: openSansBold(color: Colors.white, size: 20.0, weightfont: true),
                            ),
                            Text(
                              jumlahMateri.toString()+' Materi',
                              style: openSansBold(color: Colors.white, size: 18.0, weightfont: true),
                            )
                          ],
                        ),
                      )
                    ]
                ),
              ),
              Divider(
                height: 15,
                color: Colors.transparent,
              ),
              Container(
                  height: 70,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      InkWell(
                        child: Container(
                          width: 130,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 0,
                                  blurRadius: 2,
                                  offset: Offset(0, 0), // changes
                                )
                              ]
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Latihan Soal',
                            style: openSansBold(color: colorRed, size: 16.0, weightfont: false),
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/listQuiz',
                            arguments: {'lessonId': lessonId},
                          );
                        },
                      ),
                    ],
                  )
              ),
              Container(
                height: 600,
                width: double.infinity,
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FutureBuilder(
                      future: getSubMateri(lessonId),
                      builder: (Context, snapshot){
                        if(snapshot.connectionState == ConnectionState.done){
                          if(snapshot.hasError){
                            return Center(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {});
                                  },
                                ),
                            );
                          }

                          if(snapshot.hasData){
                            List data = snapshot.data as List;

                            return Expanded(
                                child: ListView.builder(
                                  itemCount: data.length,
                                    itemBuilder: (context, i) {
                                      return Container(
                                        height: 100,
                                        width: double.infinity,
                                        margin: EdgeInsets.only(bottom: 20),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(Radius.circular(20)),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.5),
                                              spreadRadius: 0,
                                              blurRadius: 2,
                                              offset: Offset(0, 1), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(25),
                                                    color: Colors.transparent
                                                ),
                                                child: shared.base64ToImage(base64: data[i]['sublessonImage'])
                                              ),
                                            ),
                                            Expanded(
                                                flex: 3,
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.pushNamed(
                                                      context,
                                                      '/previewPdf',
                                                      arguments: {'sublessonName': data[i]['sublessonName']},
                                                    );
                                                  },
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    mainAxisSize: MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        data[i]['sublessonName'],
                                                        textAlign: TextAlign.left,
                                                        style: openSansBold(color: Colors.black87, size: 16.0, weightfont: true),
                                                      ),
                                                      Text(
                                                        data[i]['sublessonDescription'],
                                                        textAlign: TextAlign.left,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: openSansBold(color: Colors.black87, size: 13.0, weightfont: false),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                            )
                                          ],
                                        ),
                                      );
                                    }
                                )
                            );
                          }

                        }

                        return Center(
                          child: CircularProgressIndicator()
                        );
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
