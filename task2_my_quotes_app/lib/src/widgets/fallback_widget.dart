import 'package:flutter/material.dart';
import 'package:task2_my_quotes_app/src/utils/colors.dart';
import 'package:task2_my_quotes_app/src/utils/extensions.dart';
import 'package:task2_my_quotes_app/src/utils/fontsizes.dart';
import 'package:task2_my_quotes_app/src/utils/fontweights.dart';
import 'package:task2_my_quotes_app/src/utils/strings.dart';

class FallBackWidget extends StatelessWidget {
  const FallBackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Expanded(
      child: Stack(
        children: [
          Image.asset(
            imageFilePath,
            height: screenHeight,
            width: screenWidth,
            fit: BoxFit.cover
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: const Text(noQuotes).decorateWithGoogleFont(
                whiteColor, 
                fontWeight4, 
                fontSize4
              ),
            )
          )
        ],
      ),
    );
  }
}