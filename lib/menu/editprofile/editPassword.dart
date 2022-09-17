import 'package:cermath/shared/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:cool_dropdown/cool_dropdown.dart';

class EditPassword extends StatefulWidget {
  const EditPassword({Key? key}) : super(key: key);

  @override
  State<EditPassword> createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {

  Color colorRed = HexColor('FC6F7E');
  Color colorPurple = HexColor('7C3694');
  Color colorGrey = HexColor('464646');

  TextEditingController previousPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPurple,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 24,
          )
        ),
        title: Text(
          'Ubah Kata Sandi',
          style: GoogleFonts.openSans(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height-150,
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(bottom: 5),
                child: Text(
                  'Password Lama',
                  style: GoogleFonts.openSans(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Container(
                child: TextField(
                  controller: previousPassword,
                  obscureText: true,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: "Password Lama",
                    prefixIcon: Icon(Icons.lock),
                    border: myinputborder(true),
                    enabledBorder: myinputborder(true),
                    focusedBorder: myfocusborder(true),
                    focusColor: Colors.white,
                  ),
                ),
              ),
              const Divider(
                color: Colors.transparent,
                height: 20,
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(bottom: 5),
                child: Text(
                  'Password Baru',
                  style: GoogleFonts.openSans(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Container(
                child: TextField(
                  controller: newPassword,
                  obscureText: true,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: "Password Baru",
                    prefixIcon: Icon(Icons.lock),
                    border: myinputborder(true),
                    enabledBorder: myinputborder(true),
                    focusedBorder: myfocusborder(true),
                    focusColor: Colors.white,
                  ),
                ),
              ),
              const Divider(
                color: Colors.transparent,
                height: 20,
              ),
              InkWell(
                child: Container(
                  width: 140,
                  height: 45,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white
                  ),
                  child: Center(
                    child: Text(
                      'Simpan',
                      style: GoogleFonts.openSans(
                          color: Colors.black45,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  print('hahaha');
                },
              )
            ],
          ),
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

