import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:task2_my_quotes_app/src/utils/colors.dart';

Future showFlushbar(BuildContext context, String message){
  return Flushbar(
    messageText: IntrinsicWidth(
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), 
            color: tealColorWithOpacity,
          ),
          padding: const EdgeInsets.all(10),
          child: Text(
            message, 
            style: const TextStyle(color: whiteColor),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ),
    margin: const EdgeInsets.only( bottom: 100),
    duration: const Duration(seconds:2), 
    flushbarPosition: FlushbarPosition.BOTTOM,
    backgroundColor: transparentColor, 
    borderRadius: BorderRadius.circular(10),
  ).show(context);
}