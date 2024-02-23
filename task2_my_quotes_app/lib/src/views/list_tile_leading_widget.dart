import 'package:flutter/material.dart';
import 'package:task2_my_quotes_app/src/utils/colors.dart';
import 'package:task2_my_quotes_app/src/utils/extensions.dart';
import 'package:task2_my_quotes_app/src/utils/fontsizes.dart';
import 'package:task2_my_quotes_app/src/utils/fontweights.dart';

class ListTileLeadingWidget extends StatelessWidget {
  final int listIndex;

  const ListTileLeadingWidget({
    super.key,
    required this.listIndex
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: 15,
        width: 15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: whiteColor,
            width: 0.5,
          )
        ),
        child: Center(
          child: Text(listIndex.toString()).decorateWithGoogleFont(
            whiteColor,
            fontWeight9,
            fontSize1
          ),
        )
      ),
    );
  }
}