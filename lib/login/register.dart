import 'dart:convert';
import 'dart:ui';
import 'package:cermath/login/information.dart';
import 'package:cermath/shared/hexcolor.dart';
import 'package:cermath/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../service/network.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  Color colorRed = HexColor('FC6F7E');
  Color colorPurple = HexColor('7C3694');
  Color colorGrey = HexColor('464646');

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Shared shared = Shared();

  Future<void> registerAccount(String fullname, String email, String password) async {
    var body = {
      "fullname": fullname,
      "email": email,
      "password": password
    };

    shared.showLoaderDialog(context);
    var responses = await Network().register(body);
    var resultBody = json.decode(responses.body);

    print(resultBody);
    Future.delayed(const Duration(milliseconds: 1000), () async {
      Navigator.of(context, rootNavigator: true).pop();
      if(resultBody['success']){
        shared.showSuccesSnackbar(resultBody['message'], context);
        Future.delayed(const Duration(milliseconds: 3000), () {
          Navigator.of(context, rootNavigator: true).pop();
        });
      } else {
        shared.showErrorSnackbar(resultBody['message'], context);
      }
    });
  }

  var messageName = "";
  var messageEmail = "";
  var messagePassword = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
                      'Buat Akun Gratis',
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
                      'Nama',
                      style: GoogleFonts.openSans(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Container(
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 5),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: "Nama",
                        prefixIcon: Icon(Icons.account_circle_rounded),
                        border: myinputborder(true),
                        enabledBorder: myinputborder(true),
                        focusedBorder: myfocusborder(true),
                        focusColor: Colors.white,
                      ),
                    ),
                  ),
                  if(messageName != "") Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      messageName,
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
                                'Buat Akun',
                                style: GoogleFonts.openSans(
                                    color: Colors.black45,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            var checkValidation = true;

                            if(nameController.text == ""){
                              messageName = "Nama tidak boleh kosong";
                              checkValidation = false;
                            } else {
                              messageName = "";
                            }

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

                            if(checkValidation == true) {
                              registerAccount(nameController.text, emailController.text, passwordController.text);
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
                            'Atau Daftar Dengan',
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
                ],
              ),
            ),
          ),
        )
      ),
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
