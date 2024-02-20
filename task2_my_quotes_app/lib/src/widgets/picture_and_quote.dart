import 'package:flutter/foundation.dart' show Uint8List;
import 'package:flutter/material.dart';
import 'package:task2_my_quotes_app/src/utils/colors.dart';
import 'package:task2_my_quotes_app/src/utils/extensions.dart';
import 'package:task2_my_quotes_app/src/utils/fontsizes.dart';
import 'package:task2_my_quotes_app/src/utils/fontweights.dart';

class PictureAndQuoteWidget extends StatelessWidget {
  final Uint8List imageData;
  final String quotesText;

  const PictureAndQuoteWidget({
    super.key,
    required this.imageData,
    required this.quotesText
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Expanded(
      child: Stack(
        children: [
          Image.memory(
            imageData,
            height: screenHeight,
            width: screenWidth,
            fit: BoxFit.cover
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(quotesText).decorateWithGoogleFont(
                whiteColor, 
                fontWeight4, 
                fontSize4
              ),
            )
          )
        ],
      )
    );
  }
}