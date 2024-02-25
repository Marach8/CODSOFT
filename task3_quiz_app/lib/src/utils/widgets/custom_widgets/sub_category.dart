import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task3_quiz_app/src/utils/constants/colors.dart';
import 'package:task3_quiz_app/src/utils/constants/fontsizes.dart';
import 'package:task3_quiz_app/src/utils/constants/fontweights.dart';
import 'package:task3_quiz_app/src/utils/extensions.dart';

class QuizSubCategory extends StatefulWidget {
  final List<Widget> children;
  final String typeHeading, 
  typeDescription;

  const QuizSubCategory({
    super.key,
    required this.children,
    required this.typeHeading,
    required this.typeDescription
  });

  @override
  State<QuizSubCategory> createState() => _QuizSubCategoryState();
}

class _QuizSubCategoryState extends State<QuizSubCategory> {
  bool _showFirst = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _showFirst = !_showFirst),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: AnimatedCrossFade(
          firstChild: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.typeHeading,).decorateWithGoogleFont(
                  blackColor,
                  fontWeight4,
                  fontSize4
                ),
                const Gap(10),
                Text(widget.typeDescription).decorateWithGoogleFont(
                  blackColor,
                  fontWeight3,
                  fontSize2
                )
              ],
            ),
          ),
          secondChild: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.children
              ),
            )
          ),
          crossFadeState: _showFirst ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
          firstCurve: Curves.decelerate,
          secondCurve: Curves.decelerate,
          sizeCurve: Curves.decelerate,
          duration: const Duration(seconds: 1),
        ),
      ),
    );
  }
}