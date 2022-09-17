import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_tex/flutter_tex.dart';

import '../../service/network.dart';
import '../../shared/hexcolor.dart';
import '../../shared/shared.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _Quiz();
}

class _Quiz extends State<Quiz> {
  Color colorRed = HexColor('FC6F7E');
  Color colorPurple = HexColor('7C3694');
  Color colorGrey = HexColor('464646');

  var quizId = "";
  Shared shared = new Shared();

  int currentIndex = 0;

  settingArgument(BuildContext ctx) {
    final arguments =
        (ModalRoute.of(ctx)?.settings.arguments ?? <String, dynamic>{}) as Map;
    if (quizId != arguments['quizId']) {
      quizId = arguments['quizId'];

      print(quizId);
      getListQuestion(quizId);
    }
  }

  List<dynamic> quizList = [];

  Future<void> getListQuestion(quizId) async {
    var responses = await Network().getQuestion(quizId);
    var resultBody = json.decode(responses.body);

    print(resultBody['data']['listQuiz']);

    setState(() {
      quizList = resultBody['data']['listQuiz'];
    });

    // print(resultBody['data']);
    // return resultBody['data'];
  }

  @override
  Widget build(BuildContext context) {
    settingArgument(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Quiz'),
      ),
      body: quizList.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              physics: const ScrollPhysics(),
              children: <Widget>[
                Text(
                  'Quiz ',
                  style: const TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                TeXView(
                  renderingEngine: TeXViewRenderingEngine.katex(),
                  child: TeXViewColumn(
                    children: [
                      TeXViewDocument(
                        quizList[currentIndex]['questionName'],
                        style: const TeXViewStyle(
                            textAlign: TeXViewTextAlign.center),
                      ),
                      TeXViewDocument(
                        'A. ${quizList[currentIndex]['answer1']}',
                      ),
                      TeXViewDocument(
                        'B. ${quizList[currentIndex]['answer2']}',
                      ),
                      TeXViewDocument(
                        'C. ${quizList[currentIndex]['answer3']}',
                      ),
                      TeXViewDocument(
                        'D. ${quizList[currentIndex]['correctAnswer']}',
                      ),
                    ],
                  ),
                  style: const TeXViewStyle(
                    margin: TeXViewMargin.all(5),
                    padding: TeXViewPadding.all(10),
                    borderRadius: TeXViewBorderRadius.all(10),
                    border: TeXViewBorder.all(
                      TeXViewBorderDecoration(
                          borderColor: Colors.blue,
                          borderStyle: TeXViewBorderStyle.solid,
                          borderWidth: 5),
                    ),
                    backgroundColor: Colors.white,
                  ),
                ),
              ],
            ),
    );
  }
}
