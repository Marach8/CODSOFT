import 'package:flutter/foundation.dart' show Uint8List;
import 'package:flutter/material.dart';
import 'package:task2_my_quotes_app/src/widgets/custom_center_text.dart';

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
          CustomCenterTextWidget(text: quotesText)
        ],
      )
    );
  }
}