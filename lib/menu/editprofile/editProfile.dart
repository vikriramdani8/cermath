import 'package:cermath/shared/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:cool_dropdown/cool_dropdown.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  Color colorRed = HexColor('FC6F7E');
  Color colorPurple = HexColor('7C3694');
  Color colorGrey = HexColor('464646');

  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController usertype = TextEditingController();
  TextEditingController classes = TextEditingController();

  var _userTypes = [
    "Murid",
    "Orang Tua",
    "Guru",
  ];

  var _classes = [
    "7",
    "8",
    "9",
  ];

  var _genders = [
    "Laki-Laki",
    "Perempuan",
  ];

  var _genderValue = 'Laki-Laki';
  var _userTypeValue = 'Murid';
  var _classValue = '8';

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
          'Edit Profile',
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
                  controller: username,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: "Username",
                    prefixIcon: Icon(Icons.person),
                    border: myinputborder(true),
                    enabledBorder: myinputborder(true),
                    focusedBorder: myfocusborder(true),
                    focusColor: Colors.white,
                  ),
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
                  controller: email,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: "Email",
                    prefixIcon: Icon(Icons.mail),
                    border: myinputborder(true),
                    enabledBorder: myinputborder(true),
                    focusedBorder: myfocusborder(true),
                    focusColor: Colors.white,
                  ),
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
                          hintText: 'Please select expense',
                          border: myinputborder(true),
                          enabledBorder: myinputborder(true),
                          focusedBorder: myfocusborder(true),
                        ),
                        isEmpty: _genderValue == '',
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: _genderValue,
                            isDense: true,
                            onChanged: (str) => {
                              setState(() {
                                _genderValue = str.toString();
                                state.didChange(str);
                              })
                            },
                            items: _genders.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        )
                    );
                  }
              ),
              const Divider(
                height: 20,
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
                            value: _userTypeValue,
                            isDense: true,
                            onChanged: (str) => {
                              setState(() {
                                _userTypeValue = str.toString();
                                state.didChange(str);
                              })
                            },
                            items: _userTypes.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        )
                    );
                  }
              ),
              const Divider(
                height: 20,
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
                        isEmpty: _userTypeValue == '',
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: _classValue,
                            isDense: true,
                            onChanged: (str) => {
                              setState(() {
                                _classValue = str.toString();
                                state.didChange(str);
                              })
                            },
                            items: _classes.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text('Kelas '+ value),
                              );
                            }).toList(),
                          ),
                        )
                    );
                  }
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
                        width: 180,
                        height: 53,
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
                                fontSize: 16
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        print('huhuu');
                      },
                    )
                ),
              ),
            ],
          )
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
