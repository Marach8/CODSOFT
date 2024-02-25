import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task3_quiz_app/src/utils/constants/strings.dart';
import 'package:task3_quiz_app/src/utils/widgets/custom_widgets/container_widget.dart';
import 'package:task3_quiz_app/src/utils/widgets/custom_widgets/sub_category.dart';

class HomeBodyWidget extends StatelessWidget {
  const HomeBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            ContainerWidget(
              child: QuizSubCategory(
                children: [
                  multipleChoice,
                  trueOrFalse,
                  anyQuestion
                ],
                typeDescription: quizTypeInstruction,
                typeHeading: selectQuizType,
              )
            ),
            Gap(20),
            ContainerWidget(
              child: QuizSubCategory(
                children: [
                  hard,
                  medium,
                  easy,
                  anyDifficulty
                ],
                typeDescription: quizDifficultyInstruction,
                typeHeading: selectQuizDifficulty,
              )
            ),
            Gap(20),
            ContainerWidget(
              child: QuizSubCategory(
                children: [
                  ten,
                  twenty,
                  thirty,
                  fourty,
                  fifty
                ],
                typeDescription: quizeNumberInstruction,
                typeHeading: selectQuizNumber,
              )
            )
          ]
        )
      ),
    );
  }
}