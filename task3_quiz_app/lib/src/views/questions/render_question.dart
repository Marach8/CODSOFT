import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:task3_quiz_app/src/functions/change_notifier.dart';
import 'package:task3_quiz_app/src/utils/constants/colors.dart';
import 'package:task3_quiz_app/src/utils/constants/fontsizes.dart';
import 'package:task3_quiz_app/src/utils/constants/fontweights.dart';
import 'package:task3_quiz_app/src/utils/constants/strings.dart';
import 'package:task3_quiz_app/src/utils/extensions.dart';
import 'package:task3_quiz_app/src/utils/widgets/other_widgets/list_tile_leading_widget.dart';
import 'dart:developer' as marach show log;
import 'package:task3_quiz_app/src/views/questions/bottom_buttons_row.dart';


class QuestionsRender extends StatelessWidget {
  const QuestionsRender({super.key});

  @override
  Widget build(BuildContext context) {
    final quizNotify = Provider.of<QuizManager>(context, listen: false);
    final quizQuestions = quizNotify.retrievedQuestions!;
    var selectedOptions = quizNotify.generateList();
    final correctOptions = quizNotify.listOfCorrectOptions;
    final pageController = quizNotify.pageController;

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Consumer<QuizManager>(
            builder: (_, quiz, __) {
              final answeredQuestions = (quiz.answeredQuestions ?? 0).toString();
              final totalQuestions = (quiz.totalQuestions).toString();
              return Text(
                answeredQuestions + slashString + totalQuestions + answeredString
              ).decorateWithGoogleFont(
                quiz.allQuestionsTaken ? greenColor : blackColor,
                fontWeight4,
                fontSize2
              );
            }
          ),
          //const Gap(5),
          Expanded(
            child: PageView.builder(
              controller: pageController,
              allowImplicitScrolling: true,
              onPageChanged: (pageIndex){
                pageIndex.checkForStartOrEnd(
                  context: context,
                  numberOfQuestions: quizQuestions.length
                );
              },
              itemCount: quizQuestions.length,
              itemBuilder: (context, pageIndex){
                
                final questionData = quizQuestions.elementAt(pageIndex);
                final options = questionData.incorectAnswers;
                final question = questionData.question;
                final questionNumber = questionData.questionNumber;
                final correctAnswer = questionData.correctAnswer;
                correctOptions.insertItem(pageIndex, correctAnswer);
                options..add(correctAnswer)..shuffle(); 
                final uniqueOptions = Set.from(options);
                marach.log('correctOptions $correctOptions');
      
                return Card(
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10),
                    isThreeLine: true,
                    leading: ListTileLeadingWidget(
                      listIndex: questionNumber,
                      radius: 20,
                    ),
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
                        children: uniqueOptions.map(
                          (option) {
                            return Row(
                              children: [                              
                                Consumer<QuizManager>(
                                  builder: (_, quiz, __) => Radio<String>(
                                    value: option,
                                    groupValue: selectedOptions.elementAt(pageIndex),
                                    onChanged: (value){
                                      quiz.callToAction(() {
                                        final optionValue = value ?? emptyString;
                                        selectedOptions.insertItem(pageIndex, optionValue);
                                        quiz.listOfSelectedOptions = selectedOptions;
                                      });
                                      marach.log(selectedOptions.toString());
                                    },
                                    activeColor: greenColor,
                                    toggleable: true,
                                  ),
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
          ),
          BottomButtonsRow(pageController: pageController)
        ],
      ),
    );
  }
}