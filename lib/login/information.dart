import 'dart:convert';

import 'package:cermath/model/information.dart';
import 'package:cermath/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';
import '../service/network.dart';
import '../shared/hexcolor.dart';

class Information extends StatefulWidget {
  const Information({Key? key}) : super(key: key);

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {

  Color colorRed = HexColor('FC6F7E');
  Color colorPurple = HexColor('7C3694');
  Color colorGrey = HexColor('464646');

  TextEditingController genderController = TextEditingController();
  TextEditingController userTypeController = TextEditingController();
  TextEditingController classController = TextEditingController();

  var _genderValue = "";
  var _userTypeValue = "";
  var _classValue = "";
  var _token = "";

  @override
  void initState(){
    super.initState();
    checkAuth();
  }

  List<Classes> classList = [];
  List<UserTypes> userTypeList = [];
  List<Gender> genderList = [];

  Shared shared = Shared();
  User? _user;
  User? _user2;

  Future<void> checkAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userPref = prefs.getString('user');
    var userMap = jsonDecode(userPref!);
    if(userMap != null){
      _token = userMap['token'];
      _user = User.fromJson(userMap);
      getGender();
    }
  }

  Future<void> getGender() async {
    var responses = await Network().getGender();
    var resultBody = json.decode(responses.body);

    if(resultBody['success']){
      Iterable data = resultBody['data'];
      genderList = List<Gender>.from(data.map((model) => Gender.fromJson(model)));
      _genderValue = genderList[0].id.toString();
      getUserType();
    } else {
      shared.showErrorSnackbar(resultBody['message'], context);
    }
  }

  Future<void> getUserType() async {
    var responses = await Network().getUserType();
    var resultBody = json.decode(responses.body);

    if(resultBody['success']){
      Iterable data = resultBody['data'];
      userTypeList = List<UserTypes>.from(data.map((model) => UserTypes.fromJson(model)));
      _userTypeValue = userTypeList[0].id.toString();
      getClass();
    }
  }

  Future<void> getClass() async {
    var responses = await Network().getClass();
    var resultBody = json.decode(responses.body);

    if(resultBody['success']){
      Iterable data = resultBody['data'];
      classList = List<Classes>.from(data.map((model) => Classes.fromJson(model)));
      _classValue = classList[1].id.toString();
      setState(() {});
    }
  }

  Future<void> updateInformation(String gender, String usertype, String classid) async{
    var data = {
      "usertype": usertype,
      "gender": gender,
      "classid": classid
    };

    shared.showLoaderDialog(context);
    var responses = await Network().information(_user?.users_id, data);
    var resultBody = json.decode(responses.body);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userPref = prefs.getString('user');

    var userMap = jsonDecode(userPref!);
    userMap['gender_id'] = int.parse(gender);
    userMap['usertype_id'] = int.parse(usertype);
    userMap['class_id'] = int.parse(classid);

    prefs.setString('user', jsonEncode(userMap));

    Future.delayed(const Duration(milliseconds: 1000), () async {
      Navigator.of(context, rootNavigator: true).pop();
      if(resultBody['success']){
        shared.showSuccesSnackbar(resultBody['message'], context);
        Future.delayed(const Duration(milliseconds: 3000), () {
          Navigator.pushNamedAndRemoveUntil(context, "/menu", (r) => false);
        });
      } else {
        shared.showErrorSnackbar(resultBody['message'], context);
      }
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: colorPurple,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: colorPurple,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Divider(
                height: 100,
                color: Colors.transparent,
              ),
              Container(
                height: 100,
                color: Colors.transparent,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        'cerMath',
                        style: GoogleFonts.poppins(
                            color: colorRed,
                            fontSize: 35,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Mohon isi semua informasi',
                        style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 70,
                color: Colors.transparent,
              ),
              Container(
                height: MediaQuery.of(context).size.height-270,
                padding: EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)
                  ),
                  color: Colors.white
                ),
                child: Column(
                  children: [
                    const Divider(
                      height: 50,
                      color: Colors.transparent,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(bottom: 5),
                      child: Text(
                        'Gender',
                        style: GoogleFonts.openSans(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    FormField(
                        builder: (FormFieldState<String> state) {
                          return InputDecorator(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                                border: myinputborder(true),
                                enabledBorder: myinputborder(true),
                                focusedBorder: myfocusborder(true),
                              ),
                              isEmpty: _genderValue == '',
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  isDense: true,
                                  items: genderList.map((data) => DropdownMenuItem<String>(
                                    value: data.id.toString(),
                                    child: Text(data.value),
                                  )).toList(),
                                  value: _genderValue,
                                  onChanged: (str) {
                                    setState(() {
                                      _genderValue = str.toString();
                                    });
                                  },
                                ),
                              )
                          );
                        }
                    ),
                    const Divider(
                      height: 30,
                      color: Colors.transparent,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(bottom: 5),
                      child: Text(
                        'Tipe Pengguna',
                        style: GoogleFonts.openSans(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    FormField(
                        builder: (FormFieldState<String> state) {
                          return InputDecorator(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                                border: myinputborder(true),
                                enabledBorder: myinputborder(true),
                                focusedBorder: myfocusborder(true),
                              ),
                              isEmpty: _userTypeValue == '',
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  isDense: true,
                                  items: userTypeList.map((data) => DropdownMenuItem<String>(
                                    value: data.id.toString(),
                                    child: Text(data.value),
                                  )).toList(),
                                  value: _userTypeValue,
                                  onChanged: (str) {
                                    setState(() {
                                      _userTypeValue = str.toString();
                                    });
                                  },
                                ),
                              )
                          );
                        }
                    ),
                    const Divider(
                      height: 30,
                      color: Colors.transparent,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(bottom: 5),
                      child: Text(
                        'Kelas',
                        style: GoogleFonts.openSans(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    FormField(
                        builder: (FormFieldState<String> state) {
                          return InputDecorator(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                                border: myinputborder(true),
                                enabledBorder: myinputborder(true),
                                focusedBorder: myfocusborder(true),
                              ),
                              isEmpty: _classValue == '',
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  isDense: true,
                                  items: classList.map((data) => DropdownMenuItem<String>(
                                    value: data.id.toString(),
                                    child: Text(data.value),
                                  )).toList(),
                                  value: _classValue,
                                  onChanged: (str) {
                                    setState(() {
                                      _classValue = str.toString();
                                    });
                                  },
                                ),
                              )
                          );
                        }
                    ),
                    const Divider(
                      height: 30,
                      color: Colors.transparent,
                    ),
                    Container(
                      height: 70,
                      child: Center(
                          child: InkWell(
                            child: Container(
                              width: 200,
                              height: 60,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white
                              ),
                              child: Center(
                                child: Text(
                                  'Simpan Informasi',
                                  style: GoogleFonts.openSans(
                                      color: Colors.black45,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              // print("gender: "+_genderValue);
                              // print("usertype: "+_userTypeValue);
                              // print("class: "+_classValue);
                              updateInformation(_genderValue, _userTypeValue, _classValue);
                            },
                          )
                      ),
                    ),
                  ],
                )
              )
            ],
          ),
        )
      )
    );
  }

  OutlineInputBorder myinputborder(bool align) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.blueGrey,
          width: 0,
        ));
  }

  OutlineInputBorder myfocusborder(bool align) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.blueGrey,
          width: 0,
        ));
  }
}
