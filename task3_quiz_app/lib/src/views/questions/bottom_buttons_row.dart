import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:task3_quiz_app/src/functions/change_notifier.dart';
import 'package:task3_quiz_app/src/utils/constants/colors.dart';
import 'package:task3_quiz_app/src/utils/constants/strings.dart';
import 'package:task3_quiz_app/src/utils/widgets/other_widgets/elevatedbutton_widget.dart';
import 'package:task3_quiz_app/src/utils/widgets/other_widgets/empty_container.dart';

class BottomButtonsRow extends StatelessWidget {
  final PageController pageController;

  const BottomButtonsRow({
    super.key,
    required this.pageController
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizManager>(
      builder: (_, quiz, __) {
        
        final allQuestionsTaken = quiz.allQuestionsTaken;
        
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            quiz.atBeginingOfPage ? emptySizedBox : Expanded(
              flex: 1,
              child: ElevatedButtonWidget(
                backgroundColor: whiteColor, 
                foregroundColor: blackColor,
                borderColor: blackColor, 
                text: previousString, 
                function: () async{
                  await pageController.previousPage(
                    duration: const Duration(seconds: 1), 
                    curve: Curves.decelerate
                  );
                }
              ),
            ),
            const Gap(10),
            quiz.atEndOfPage ? 
            Expanded(
              child: ElevatedButtonWidget(
                backgroundColor: whiteColor, 
                foregroundColor: allQuestionsTaken ? greenColor : blackColor.withOpacity(0.2), 
                borderColor: allQuestionsTaken ? greenColor : blackColor.withOpacity(0.1),
                text: submitString, 
                function: allQuestionsTaken ? (){

                } : null
              )
            ) 
            : Expanded(
              flex: 1,
              child: ElevatedButtonWidget(
                backgroundColor: whiteColor,
                foregroundColor: blackColor, 
                borderColor: blackColor, 
                text: nextString, 
                function: () async{
                  await pageController.nextPage(
                    duration: const Duration(seconds: 1), 
                    curve: Curves.decelerate
                  );
                }
              ),
            )
          ],
        );
      }
    );
  }
}