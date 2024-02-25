import 'package:flutter/material.dart';
import 'package:task3_quiz_app/src/utils/constants/colors.dart';
import 'package:task3_quiz_app/src/utils/extensions.dart';

class SubCategoryContainer extends StatelessWidget {
  final Widget child;
  final void Function() onTap;

  const SubCategoryContainer({
    super.key,
    required this.child,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        height: 30,
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        decoration: BoxDecoration(
          color: redColorWithOpacity,
          borderRadius: BorderRadius.circular(5),
          border: Border.all().modifyBorder(greenColor, 0.5),
        ),
        child: Center(
          child: child,
        )
      ),
    );
  }
}