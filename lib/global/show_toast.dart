
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


  void printTest(String text){
    if(kDebugMode){
      print('\x1B[33m$text\x1B[0m');
    }
  }

  void showLog(String text){
    if(kDebugMode){
      log('\x1B[33m$text\x1B[0m');
    }
  }

  showToast(String message){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }