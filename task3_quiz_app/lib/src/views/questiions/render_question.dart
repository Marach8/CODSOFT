import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:task3_quiz_app/src/functions/change_notifier.dart';
import 'package:task3_quiz_app/src/utils/constants/colors.dart';
import 'package:task3_quiz_app/src/utils/constants/fontsizes.dart';
import 'package:task3_quiz_app/src/utils/constants/fontweights.dart';
import 'package:task3_quiz_app/src/utils/extensions.dart';
import 'package:task3_quiz_app/src/utils/widgets/other_widgets/list_tile_leading_widget.dart';


class QuestionsRender extends StatelessWidget {
  const QuestionsRender({super.key});

  @override
  Widget build(BuildContext context) {
    final quizNotify = Provider.of<QuizManager>(context, listen: false);
    final quizQuestions = quizNotify.retrievedQuestions!;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Ongoing Quiz').decorateWithGoogleFont(
            redColor,
            fontWeight7,
            fontSize4
          ),
          const Gap(20),
          Expanded(
            child: PageView.builder(
              itemCount: quizQuestions.length,
              itemBuilder: (context, pageIndex){

                final questionData = quizQuestions.elementAt(pageIndex);
                final options = questionData.incorectAnswers;
                final question = questionData.question;
                final questionNumber = questionData.questionNumber;
                final correctAnswer = questionData.correctAnswer;
                options..add(correctAnswer)..shuffle();

                return Card(
                  child: ListTile(
                    leading: ListTileLeadingWidget(listIndex: questionNumber),
                    minLeadingWidth: 0,
                    title: Text(question).decorateWithGoogleFont(
                      blackColor,
                      fontWeight4,
                      fontSize3
                    ),
                    subtitle: Column(
                      children: options.map(
                        (option) {
                          String? selectedValue;
                          return Radio(
                            value: option,
                            groupValue: selectedValue,
                            onChanged: (value) => selectedValue = value
                          );
                        }
                      ).toList(),
                    ),
                  )
                );
              }
            ),
          )
        ],
      ),
    );
  }
}