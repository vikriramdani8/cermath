import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Shared {
  showLoaderDialog(BuildContext context){
    AlertDialog alert=AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(margin: const EdgeInsets.only(left: 7),child:Text("Loading..." )),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }

  showSuccesSnackbar(String msg, BuildContext context) {
    final snackBar = SnackBar(
      duration: Duration(seconds: 3),
      content: Text(msg.toString()),
      backgroundColor: Colors.green,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  showErrorSnackbar(String msg, BuildContext context) {
    final snackBar = SnackBar(
      duration: Duration(seconds: 3),
      content: Text(msg.toString()),
      backgroundColor: Colors.red,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  TextStyle openSansBold({required color, required size, required bool weightfont}){
    return GoogleFonts.openSans(
        color: color,
        fontSize: size,
        fontWeight: weightfont ? FontWeight.bold : FontWeight.normal
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
}