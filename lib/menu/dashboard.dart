import 'dart:convert';
import 'dart:typed_data';

import 'package:cermath/menu/modul/listmodul.dart';
import 'package:cermath/shared/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dropdown_search/dropdown_search.dart';

import '../model/information.dart';
import '../model/materi.dart';
import '../model/user.dart';
import '../service/network.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  void initState() {
    super.initState();
    checkAuth();
  }

  Future<void> checkAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userPref = prefs.getString('user');
    bool? login = prefs.getBool('login');

    if(login == true && userPref != null){
      var userMap = jsonDecode(userPref);
      user = User.fromJson(userMap);
      getClass();
      getMateri(userMap['class_id']);
    }
  }

  Color colorRed = HexColor('FC6F7E');
  Color colorPurple = HexColor('7C3694');
  Color colorGrey = HexColor('464646');

  User? user;
  List<Classes> classList = [];
  var _classValue = "";
  List<Materi> listMateri = [];

  TextStyle openSansBold({required color, required size, required bool weightfont}){
    return GoogleFonts.openSans(
        color: color,
        fontSize: size,
        fontWeight: weightfont ? FontWeight.bold : FontWeight.normal
    );
  }

  Widget materi({required Materi mteri}){
    return(
        InkWell(
          onTap: () {
            if(mteri.namaMateri != ""){
              Navigator.pushNamed(
                context,
                '/listModul',
                arguments: {
                  'lessonId': mteri.idMateri,
                  'lessonName': mteri.namaMateri
                },
              );
            }
          },
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 90,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.transparent
                ),
                child: base64ToImage(base64: mteri.imageMateri),
              ),
              Container(
                // color: Colors.green,
                alignment: Alignment.center,
                height: 50,
                child: Text(
                  mteri.namaMateri,
                  textAlign: TextAlign.center,
                  style: openSansBold(color: Colors.black87, size: 13.0, weightfont: false),
                ),
              )
            ],
          )
        )
    );
  }

  Widget base64ToImage({required String base64}){
    if(base64 != ""){
      final splitted = base64.split(',');
      Uint8List bytes = Base64Decoder().convert(splitted[1]);
      return Image.memory(bytes);
    } else {
      return Container();
    }
  }

  Widget splitMateri({required List<Materi> temp}){
    return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: temp.map((mteri) =>
            Container(
              width: 90,
              height: 140,
              child: materi(mteri: mteri),
            ),
        ).toList()
    );
  }

  Widget kategoriMateri(){
    var tempMateri = [];
    var chunkSize = 3;
    for(var i = 0; i < listMateri.length; i+=3){
      tempMateri.add(listMateri.sublist(i, i+chunkSize > listMateri.length ? listMateri.length : i + chunkSize));
    }

    return Container(
        child: Column(
            mainAxisSize: MainAxisSize.max,
            children: tempMateri.map((e) =>
                Container(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: splitMateri(temp: e),
                )
            ).toList()
        )
    );
  }

  Widget dividerHeight({required double size}) {
    return Divider(
      color: Colors.transparent,
      height: size,
    );
  }

  Future<void> getClass() async {
    var responses = await Network().getClass();
    var resultBody = json.decode(responses.body);

    if(resultBody['success']){
      Iterable data = resultBody['data'];
      classList = List<Classes>.from(data.map((model) => Classes.fromJson(model)));
      classList.add(Classes(id: 0, value: ""));

      var temp = user!.class_id.toString();
      if(temp == '1'){
        _classValue = "Kelas 7";
      } else if(temp == '2') {
        _classValue = "Kelas 8";
      } else {
        _classValue = "Kelas 9";
      }

      setState(() {});
    }
  }

  Future<void> getMateri(classes) async {
    var responses = await Network().getMateri(classes);
    var resultBody = json.decode(responses.body);
    List<dynamic> rawMateri = resultBody['data'];
    listMateri = [];

    rawMateri.forEach((element) {
      listMateri.add(Materi(idMateri: element['lessonId'],namaMateri: element['lessonName'], imageMateri: element['lessonImage'], kelas: element['classId']));
    });

    if(rawMateri.length%3 == 2){
      listMateri.add(Materi(idMateri: "", namaMateri: "", imageMateri: "", kelas: 0));
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      height: height-100,
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 100,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Hi, Vikri',
                        style: GoogleFonts.openSans(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87
                        ),
                      ),
                    ),
                    Container(
                        width: 130,
                        child: DropdownSearch(
                          items: ["Kelas 7", "Kelas 8", "Kelas 9"],
                          onChanged: (String) {
                            print(String);
                          },
                          popupProps: PopupProps.menu(
                            showSelectedItems: true,
                            disabledItemFn: (String s) => s.startsWith('I'),
                            fit: FlexFit.loose
                          ),
                          selectedItem: _classValue,
                        )
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                decoration: BoxDecoration(
                    color: colorPurple,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      child: Text(
                        "Let's learn together",
                        style: openSansBold(color: Colors.white, size: 18.0, weightfont: true),
                      ),
                    ),
                    dividerHeight(size: 15),
                    InkWell(
                      onTap: () async {
                        SharedPreferences preferences = await SharedPreferences.getInstance();
                        await preferences.clear();
                        // Navigator.pushNamed(context, "/testing");
                        Navigator.pushNamedAndRemoveUntil(context, "/login", (r) => false);
                      },
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'Cari topik materi',
                          style: openSansBold(color: Colors.grey, size: 15.0, weightfont: false),
                        ),
                      ),
                    ),
                    dividerHeight(size: 5),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Kategori Materi',
                        style: openSansBold(color: Colors.black87, size: 19.0, weightfont: true),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // Navigator.of(context).pop(false);
                      },
                      child: Text(
                        'Lihat Semua',
                        style: openSansBold(color: Colors.blueGrey, size: 17.0, weightfont: false),
                      ),
                    )
                  ],
                ),
              ),
              dividerHeight(size: 30),
              kategoriMateri()
            ],
          ),
        )
      )
    );
  }
}

// child: DropdownButtonHideUnderline(
//   child: DropdownButton2(
//     isExpanded: true,
//     hint: Row(
//       children: const [
//         Expanded(
//           child: Text(
//             'Select Item',
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//             overflow: TextOverflow.ellipsis,
//           ),
//         ),
//       ],
//     ),
//     items: classList.map((data) => DropdownMenuItem<String>(
//       value: data.id.toString(),
//       child: Text(
//         "Kelas "+data.value,
//         style: const TextStyle(
//           fontSize: 18,
//           fontWeight: FontWeight.bold,
//           color: Colors.white,
//         ),
//         overflow: TextOverflow.ellipsis,
//       ),
//     )).toList(),
//     value: _classValue != null ? _classValue : "1",
//     onChanged: (value) {
//       setState(() {
//         _classValue = value as String;
//         getMateri(_classValue);
//       });
//     },
//     icon: const Icon(
//       Icons.arrow_forward_ios_outlined,
//     ),
//     iconSize: 14,
//     iconEnabledColor: Colors.white,
//     iconDisabledColor: Colors.grey,
//     buttonHeight: 50,
//     buttonWidth: 130,
//     buttonPadding: const EdgeInsets.only(left: 14, right: 14),
//     buttonDecoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(20),
//       color: colorRed,
//     ),
//     buttonElevation: 2,
//     itemHeight: 40,
//     itemPadding: const EdgeInsets.only(left: 14, right: 14),
//     dropdownMaxHeight: 200,
//     dropdownWidth: 130,
//     dropdownDecoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(20),
//       color: colorRed,
//     ),
//     dropdownElevation: 2,
//     scrollbarRadius: const Radius.circular(40),
//     scrollbarThickness: 6,
//     scrollbarAlwaysShow: true,
//   ),
// )

