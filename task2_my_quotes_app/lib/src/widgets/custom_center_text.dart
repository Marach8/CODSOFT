import 'package:flutter/material.dart';
import 'package:task2_my_quotes_app/src/utils/colors.dart';
import 'package:task2_my_quotes_app/src/utils/extensions.dart';
import 'package:task2_my_quotes_app/src/utils/fontsizes.dart';
import 'package:task2_my_quotes_app/src/utils/fontweights.dart';

class CustomCenterTextWidget extends StatelessWidget {
  final String text;

  const CustomCenterTextWidget({
    super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(text).decorateWithGoogleFont(
          whiteColor, 
          fontWeight4, 
          fontSize5
        ),
      )
    );
  }
}