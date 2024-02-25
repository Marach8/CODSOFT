import 'package:flutter/material.dart';
import 'package:task3_quiz_app/src/utils/constants/colors.dart';
import 'package:task3_quiz_app/src/utils/extensions.dart';

class ContainerWidget extends StatelessWidget {
  final Widget child;

  const ContainerWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Container(
      padding: const EdgeInsets.all(20),
      width: screenWidth *0.9,
      height: screenWidth * 0.6,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all().modifyBorder(greenColor, 1),
      ),
      child: Center(child: child)
    );
  }
}