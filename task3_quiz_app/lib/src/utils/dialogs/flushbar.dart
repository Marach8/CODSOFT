import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:task3_quiz_app/src/utils/constants/colors.dart';
import 'package:task3_quiz_app/src/utils/constants/fontsizes.dart';
import 'package:task3_quiz_app/src/utils/constants/fontweights.dart';
import 'package:task3_quiz_app/src/utils/extensions.dart';

Future showFlushbar(BuildContext context, String message){
  return Flushbar(
    messageText: IntrinsicWidth(
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), 
            color: blackColor
          ),
          padding: const EdgeInsets.all(10),
          child: Text(message).decorateWithGoogleFont(
            whiteColor,
            fontWeight4,
            fontSize2
          ),
          // child: Text(
          //   message, 
          //   style: const TextStyle(color: redColor),
          //   textAlign: TextAlign.center,
          // ),
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