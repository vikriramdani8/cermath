import 'dart:convert';

import 'package:cermath/shared/hexcolor.dart';
import 'package:cermath/shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../service/network.dart';

class ListQuiz extends StatefulWidget {
  const ListQuiz({Key? key}) : super(key: key);

  @override
  State<ListQuiz> createState() => _ListQuizState();
}

class _ListQuizState extends State<ListQuiz> {
  Color colorRed = HexColor('FC6F7E');
  Color colorPurple = HexColor('7C3694');
  Color colorGrey = HexColor('464646');

  var lessonId = "";
  Shared shared = new Shared();

  settingArgument(BuildContext ctx) {
    final arguments =
        (ModalRoute.of(ctx)?.settings.arguments ?? <String, dynamic>{}) as Map;
    if (lessonId != arguments['lessonId']) {
      lessonId = arguments['lessonId'];
      getListQuiz(lessonId);
    }
  }

  Future<void> getListQuiz(lessonId) async {
    var responses = await Network().getListQuiz(lessonId);
    var resultBody = json.decode(responses.body);

    return resultBody['data'];
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    settingArgument(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: width,
              decoration: BoxDecoration(color: colorPurple, boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ]),
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
                          )),
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
                            'Latihan Soal',
                            style: shared.openSansBold(
                                color: Colors.white,
                                size: 20.0,
                                weightfont: true),
                          ),
                          Text(
                            'Himpunan',
                            style: shared.openSansBold(
                                color: Colors.white,
                                size: 18.0,
                                weightfont: false),
                          )
                        ],
                      ),
                    )
                  ]),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  FutureBuilder(
                      future: getListQuiz(lessonId),
                      builder: (Context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasError) {
                            return Center(
                              child: InkWell(
                                onTap: () {
                                  setState(() {});
                                },
                              ),
                            );
                          }
                          if (snapshot.hasData) {
                            List data = snapshot.data as List;
                            return Container(
                                height: height - 220,
                                child: ListView.builder(
                                    physics: BouncingScrollPhysics(),
                                    itemCount: data.length,
                                    itemBuilder: (context, i) {
                                      return Container(
                                        width: double.infinity,
                                        height: 170,
                                        margin: EdgeInsets.only(bottom: 20),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Container(
                                                color: Colors.transparent,
                                                padding:
                                                    EdgeInsets.only(right: 10),
                                                child: Image(
                                                  image: AssetImage(
                                                      'images/login/math.png'),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                                flex: 5,
                                                child: Material(
                                                  elevation: 3,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: [
                                                        Expanded(
                                                            flex: 4,
                                                            child: Container(
                                                              alignment: Alignment
                                                                  .bottomLeft,
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(10),
                                                              child: Text(
                                                                data[i][
                                                                    'quizName'],
                                                                style: shared.openSansBold(
                                                                    color: Colors
                                                                        .black87,
                                                                    size: 18.0,
                                                                    weightfont:
                                                                        false),
                                                              ),
                                                            )),
                                                        Expanded(
                                                            flex: 3,
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .stretch,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .centerLeft,
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              10),
                                                                  child: Text(
                                                                    'Jumlah Soal: 10',
                                                                    style: shared.openSansBold(
                                                                        color: Colors
                                                                            .black87,
                                                                        size:
                                                                            13.0,
                                                                        weightfont:
                                                                            false),
                                                                  ),
                                                                ),
                                                                Container(
                                                                    alignment:
                                                                        Alignment
                                                                            .centerLeft,
                                                                    padding: EdgeInsets
                                                                        .only(
                                                                            left:
                                                                                10),
                                                                    child:
                                                                        Image(
                                                                      image: AssetImage(
                                                                          'images/materi/score.png'),
                                                                      width: 25,
                                                                    )),
                                                              ],
                                                            )),
                                                        Divider(
                                                          height: 1,
                                                          color: colorGrey,
                                                        ),
                                                        Expanded(
                                                            flex: 3,
                                                            child: Container(
                                                              color: Colors
                                                                  .transparent,
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          10),
                                                              child: Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text("-"),
                                                                  ElevatedButton(
                                                                    onPressed:
                                                                        () {
                                                                      Navigator
                                                                          .pushNamed(
                                                                        context,
                                                                        '/quiz',
                                                                        arguments: {
                                                                          'quizId':
                                                                              data[i]['quizId']
                                                                        },
                                                                      );
                                                                    },
                                                                    child: Text(
                                                                        "Mulai"),
                                                                    style: ElevatedButton.styleFrom(
                                                                        primary:
                                                                            colorRed,
                                                                        elevation:
                                                                            3,
                                                                        padding: EdgeInsets.symmetric(
                                                                            horizontal:
                                                                                30),
                                                                        shape: RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(20))),
                                                                  )
                                                                ],
                                                              ),
                                                            ))
                                                      ],
                                                    ),
                                                  ),
                                                ))
                                          ],
                                        ),
                                      );
                                    }));
                          }
                        }

                        return Center(child: CircularProgressIndicator());
                      }),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
