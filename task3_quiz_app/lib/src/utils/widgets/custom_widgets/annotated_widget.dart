import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task3_quiz_app/src/utils/constants/colors.dart';

class AnnotatedRegionWidget extends StatelessWidget {
  final Widget child;

  const AnnotatedRegionWidget({
    super.key,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: whiteColorWithOpacity,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: whiteColorWithOpacity,
        systemNavigationBarIconBrightness: Brightness.dark
      ),
      child: child
    );
  }
}