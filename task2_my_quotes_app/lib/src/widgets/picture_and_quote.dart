import 'package:flutter/foundation.dart' show Uint8List;
import 'package:flutter/material.dart';

class PictureAndQuoteWidget extends StatelessWidget {
  final Uint8List imageData;
  final String qoutesText;

  const PictureAndQuoteWidget({
    super.key,
    required this.imageData,
    required this.qoutesText
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Expanded(
      child: Image.memory(
        imageData,
        height: screenHeight,
        width: screenWidth,
        fit: BoxFit.cover
      )
    );
  }
}