import 'package:flutter/material.dart';
import 'package:task3_quiz_app/src/utils/constants/colors.dart';
import 'package:task3_quiz_app/src/utils/extensions.dart';

class ContainerWidget extends StatelessWidget {
  final List<Widget> children;
  final CrossAxisAlignment? crossAxisAlignment;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final bool? addBorder;

  const ContainerWidget({
    super.key,
    required this.children,
    this.crossAxisAlignment,
    this.backgroundColor,
    this.padding,
    this.addBorder
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Container(
      padding: padding,
      width: screenWidth *0.9,
      height: screenWidth * 0.6,
      decoration: BoxDecoration(
        color: backgroundColor ?? whiteColor,
        borderRadius: BorderRadius.circular(20),
        border: addBorder ?? false ?
          Border.all().modifyBorder(redColor, 1) : null,
      ),
      child: Column(
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: children
      ),
    );
  }
}