import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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

    return Container(
      padding: const EdgeInsets.all(20),
      clipBehavior: Clip.hardEdge,
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
              allowImplicitScrolling: true,
              clipBehavior: Clip.hardEdge,
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
                    contentPadding: const EdgeInsets.all(10),
                    isThreeLine: true,
                    leading: ListTileLeadingWidget(listIndex: questionNumber),
                    minLeadingWidth: 0,
                    title: Text(question).decorateWithGoogleFont(
                      blackColor,
                      fontWeight4,
                      fontSize2
                    ),
                    subtitle: SingleChildScrollView(
                      controller: PrimaryScrollController.of(context),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: options.map(
                          (option) {
                            String? selectedValue;
                            return Row(
                              children: [                              
                                Radio<String>(
                                  value: option,
                                  groupValue: selectedValue,
                                  onChanged: (value) => selectedValue = value,
                                  toggleable: true,
                                ),
                                Expanded(
                                  child: Text(option).decorateWithGoogleFont(
                                    blackColor,
                                    fontWeight2,
                                    fontSize2
                                  ),
                                ),
                              ],
                            );
                          }
                        ).toList(),
                      ),
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