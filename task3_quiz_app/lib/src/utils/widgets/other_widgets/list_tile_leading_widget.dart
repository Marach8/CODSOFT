import 'package:flutter/material.dart';
import 'package:task3_quiz_app/src/utils/constants/colors.dart';
import 'package:task3_quiz_app/src/utils/constants/fontsizes.dart';
import 'package:task3_quiz_app/src/utils/constants/fontweights.dart';
import 'package:task3_quiz_app/src/utils/extensions.dart';

class ListTileLeadingWidget extends StatelessWidget {
  final String listIndex;

  const ListTileLeadingWidget({
    super.key,
    required this.listIndex
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: redColor,
            width: 0.5,
          )
        ),
        child: Center(
          child: Text(listIndex).decorateWithGoogleFont(
            redColor,
            fontWeight7,
            fontSize2
          ),
        )
      ),
    );
  }
}