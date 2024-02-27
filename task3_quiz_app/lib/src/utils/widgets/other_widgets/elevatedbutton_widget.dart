import 'package:flutter/material.dart';
import 'package:task3_quiz_app/src/utils/constants/fontsizes.dart';
import 'package:task3_quiz_app/src/utils/constants/fontweights.dart';
import 'package:task3_quiz_app/src/utils/extensions.dart';


class ElevatedButtonWidget extends StatelessWidget {
  final Color backgroundColor,
  borderColor, foregroundColor;
  final String text;
  final void Function() function;

  const ElevatedButtonWidget({
    super.key,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.borderColor,
    required this.text,
    required this.function
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: function,
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(backgroundColor),
        side: MaterialStatePropertyAll(
          BorderSide(
            color: borderColor,
            width: 1,
          )
        ) 
      ),
      child: Text(text).decorateWithGoogleFont(
        foregroundColor,
        fontWeight7,
        fontSize2
      )
    );
  }
}