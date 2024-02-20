import 'package:flutter/material.dart';
import 'package:task2_my_quotes_app/src/utils/strings.dart';

class FallBackWidget extends StatelessWidget {
  const FallBackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    return Image.asset(
      imageFilePath,
      height: screenHeight,
      width: screenWidth,
      fit: BoxFit.cover
    );
  }
}