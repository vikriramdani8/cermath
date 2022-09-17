import 'dart:convert';

import 'package:cermath/service/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Network {
  final String _url = ApiConstants.baseUrl;
  var _token = "";

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userPref = prefs.getString('user');
    bool? login = prefs.getBool('login');

    if (login == true && userPref != null) {
      var userMap = jsonDecode(userPref);
      _token = userMap['token'];
    }
  }

  setHeaders() =>
      {'accept': 'application/json', 'Authorization': 'Bearer $_token'};

  auth(data) async {
    var fullUrl = _url + "/login";
    return await http.post(
      Uri.parse(fullUrl),
      body: data,
    );
  }

  register(data) async {
    var fullUrl = _url + "/users";
    return await http.post(Uri.parse(fullUrl), body: data);
  }

  information(id, data) async {
    await getToken();
    var fullUrl = _url + "/users/$id";
    return await http.put(Uri.parse(fullUrl),
        body: data, headers: setHeaders());
  }

  getClass() async {
    await getToken();
    var fullUrl = _url + "/class";
    return await http.get(Uri.parse(fullUrl), headers: setHeaders());
  }

  getUserType() async {
    await getToken();
    var fullUrl = _url + "/usertype";
    return await http.get(Uri.parse(fullUrl), headers: setHeaders());
  }

  getGender() async {
    await getToken();
    var fullUrl = _url + "/gender";
    return await http.get(Uri.parse(fullUrl), headers: setHeaders());
  }

  getMateri(classes) async {
    var fullrl = _url + "/materi/lessonByClass/" + classes.toString();
    return await http.get(Uri.parse(fullrl));
  }

  getSubMateri(lessonId) async {
    var fullrl = _url + "/lesson/listsublesson/" + lessonId.toString();
    return await http.get(Uri.parse(fullrl));
  }

  getListQuiz(lessonId) async {
    var fullrl = _url + "/lesson/listquiz/" + lessonId.toString();
    return await http.get(Uri.parse(fullrl));
  }

  getPdf(sublesson) async {
    var fullrl = _url + "/materi/sublesson/" + sublesson.toString();
    return await http.get(Uri.parse(fullrl));
  }

  getQuestion(quizId) async {
    var fullrl = _url + "/materi/quiz/" + quizId.toString();
    return await http.get(Uri.parse(fullrl));
  }
}
