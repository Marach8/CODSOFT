import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task3_quiz_app/src/utils/constants/colors.dart';
import 'package:task3_quiz_app/src/utils/extensions.dart';

class CategoryContainerWidget extends StatelessWidget {
  final String category;

  const CategoryContainerWidget({
    super.key,
    required this.category
  });

  @override
  Widget build(BuildContext context) {    
    return Row(
      children: [
        const Gap(5),
        Container(
          height: 30,
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          decoration: BoxDecoration(
            color: greenColor,
            borderRadius: BorderRadius.circular(5),
            border: Border.all().modifyBorder(redColor, 1),
          ),
          child: Center(child: Text(category))
        ),
      ],
    );
  }
}