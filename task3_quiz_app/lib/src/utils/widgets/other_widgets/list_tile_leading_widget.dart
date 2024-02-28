import 'package:flutter/material.dart';
import 'package:task3_quiz_app/src/utils/constants/colors.dart';
import 'package:task3_quiz_app/src/utils/constants/fontsizes.dart';
import 'package:task3_quiz_app/src/utils/constants/fontweights.dart';
import 'package:task3_quiz_app/src/utils/extensions.dart';

class ListTileLeadingWidget extends StatelessWidget {
  final String listIndex;
  final double? radius;

  const ListTileLeadingWidget({
    super.key,
    required this.listIndex,
    this.radius
  });

  @override
  Widget build(BuildContext context) {
    final noRadius = radius == null;
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: radius ?? 15,
        width: radius ?? 15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: blackColor,
            width: 0.5,
          )
        ),
        child: Center(
          child: Text(listIndex).decorateWithGoogleFont(
            blackColor,
            noRadius ? fontWeight4 : fontWeight7,
            noRadius ? fontSize1 : fontSize2
          ),
        )
      ),
    );
  }
}