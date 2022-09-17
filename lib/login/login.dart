import 'dart:async';
import 'dart:convert';
import 'package:cermath/shared/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';
import '../service/network.dart';
import '../shared/shared.dart';

class Login extends StatefulWidget {
  // const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with RouteAware {

  @override
  void initState(){
    super.initState();
    checkAuth();
  }

  Color colorRed = HexColor('FC6F7E');
  Color colorPurple = HexColor('7C3694');
  Color colorGrey = HexColor('464646');

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  User? user = null;
  Shared shared = Shared();
  var messageEmail = "";
  var messagePassword = "";

  Future<void> checkAuth() async {
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

  Future<void> loginAuth(String email, String password) async {
    var body = {
      "email": email,
      "password": password
    };

    shared.showLoaderDialog(context);
    var responses = await Network().auth(body);
    var resultBody = json.decode(responses.body);

    Future.delayed(const Duration(milliseconds: 1000), () async {
      Navigator.of(context, rootNavigator: true).pop();
      if(resultBody['success']){
        SharedPreferences prefs = await SharedPreferences.getInstance();
        Map<String, dynamic> user = resultBody['data'];
        prefs.setString('user', jsonEncode(user));
        bool result = await prefs.setBool('login', true);

        if(result){
          if(user['usertype_id'] == null || user['class_id'] == null || user['gender_id'] == null){
            Navigator.pushNamedAndRemoveUntil(context, "/information", (r) => false);
          } else {
            Navigator.pushNamedAndRemoveUntil(context, "/menu", (r) => false);
          }
        } else {
          shared.showErrorSnackbar("Login failed", context);
        }

      } else {
        shared.showErrorSnackbar(resultBody['message'], context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.transparent,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
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
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Login untuk melanjutkan',
                          style: GoogleFonts.openSans(
                            color: colorPurple,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const Divider(
                        height: 60,
                        color: Colors.transparent,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(bottom: 5),
                        child: Text(
                          'Email',
                          style: GoogleFonts.openSans(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Container(
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 5),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelText: "Email",
                            prefixIcon: Icon(Icons.email),
                            border: myinputborder(true),
                            enabledBorder: myinputborder(true),
                            focusedBorder: myfocusborder(true),
                            focusColor: Colors.white,
                          ),
                        ),
                      ),
                      if(messageEmail != "") Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          messageEmail,
                          style: shared.openSansBold(color: Colors.redAccent, size: 14.0, weightfont: false),
                        ),
                      ),
                      const Divider(
                        height: 20,
                        color: Colors.transparent,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(bottom: 5),
                        child: Text(
                          'Password',
                          style: GoogleFonts.openSans(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Container(
                        child: TextField(
                          controller: passwordController,
                          obscureText: true,
                          obscuringCharacter: "*",
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 5),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelText: "Password",
                            prefixIcon: Icon(Icons.lock),
                            border: myinputborder(true),
                            enabledBorder: myinputborder(true),
                            focusedBorder: myfocusborder(true),
                            focusColor: Colors.white,
                          ),
                        ),
                      ),
                      if(messagePassword != "") Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          messagePassword,
                          style: shared.openSansBold(color: Colors.redAccent, size: 14.0, weightfont: false),
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.only(top: 5),
                          alignment: Alignment.centerLeft,
                          child: InkWell(
                            child: Text(
                              'Lupa Password?',
                              style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.bold,
                                  color: colorPurple
                              ),
                            ),
                            onTap: () {
                              print("tapped on container");
                            },
                          )
                      ),
                      const Divider(
                        height: 20,
                        color: Colors.transparent,
                      ),
                      Container(
                        height: 70,
                        child: Center(
                            child: InkWell(
                              child: Container(
                                width: 170,
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
                                    'Login',
                                    style: GoogleFonts.openSans(
                                        color: Colors.black45,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () async {
                                FocusScope.of(context).requestFocus(FocusNode());

                                var checkValidation = true;
                                if(emailController.text == ""){
                                  messageEmail = "Email tidak boleh kosong";
                                  checkValidation = false;
                                } else {
                                  messageEmail = "";
                                }

                                if(passwordController.text == "") {
                                  messagePassword = "Password tidak boleh kosong";
                                  checkValidation = false;
                                } else {
                                  messagePassword = "";
                                }
                                setState(() {});

                                if(checkValidation){
                                  loginAuth(emailController.text, passwordController.text);
                                }
                              },
                            )
                        ),
                      ),
                      Divider(
                        color: Colors.transparent,
                        height: 20,
                      ),
                      Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 1,
                              width: 70,
                              color: Colors.black,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                'Atau Login Dengan',
                                style: GoogleFonts.openSans(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Container(
                              height: 1,
                              width: 70,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.transparent,
                        height: 20,
                      ),
                      Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              child: Container(
                                width: 150,
                                height: 50,
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
                                      width: 90,
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        'Facebook',
                                        style: GoogleFonts.openSans(
                                            fontSize: 17,
                                            color: Colors.blueAccent,
                                            fontWeight: FontWeight.w600
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Icon(
                                        Icons.facebook_outlined,
                                        color: Colors.blueAccent,
                                        size: 35,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              onTap: () {
                              },
                            ),
                            InkWell(
                              child: Container(
                                width: 150,
                                height: 50,
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
                                      width: 80,
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        'Gmail',
                                        style: GoogleFonts.openSans(
                                            fontSize: 17,
                                            color: colorRed,
                                            fontWeight: FontWeight.w600
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Icon(
                                        Icons.mail_rounded,
                                        color: colorRed,
                                        size: 28,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              onTap: () {
                              },
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.transparent,
                        height: 40,
                      ),
                      Container(
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Belum Punya Akun?',
                                style: GoogleFonts.openSans(
                                    color: Colors.black87,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              InkWell(
                                child: Text(
                                  'Daftar',
                                  style: GoogleFonts.openSans(
                                      color: colorRed,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                onTap: () {
                                  FocusScope.of(context).requestFocus(FocusNode());
                                  Navigator.of(context).pushNamed('/register', arguments: 'hello i am from first page!');
                                },
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
        ),
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
