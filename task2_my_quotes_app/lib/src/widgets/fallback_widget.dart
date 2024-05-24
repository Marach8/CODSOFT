import 'package:flutter/material.dart';
import 'package:task2_my_quotes_app/src/services/helper_functions.dart';
import 'package:task2_my_quotes_app/src/utils/colors.dart';
import 'package:task2_my_quotes_app/src/utils/extensions.dart';
import 'package:task2_my_quotes_app/src/utils/fontsizes.dart';
import 'package:task2_my_quotes_app/src/utils/fontweights.dart';
import 'package:task2_my_quotes_app/src/utils/strings.dart';

class FallBackWidget extends StatelessWidget {
  const FallBackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight(context),
      width: screenWidth(context),
      child: Stack(
        children: [
          Image.asset(
            imageFilePath,
            height: screenHeight(context),
            width: screenWidth(context),
            fit: BoxFit.cover
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: const Text(noQuotes).decorateWithGoogleFont(
                whiteColor,
                fontWeight4,
                fontSize5
              ),
            ),
          )
        ],
      ),
    );
  }
}