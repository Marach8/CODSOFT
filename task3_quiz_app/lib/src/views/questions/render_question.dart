import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:task3_quiz_app/src/functions/change_notifier.dart';
import 'package:task3_quiz_app/src/utils/constants/colors.dart';
import 'package:task3_quiz_app/src/utils/constants/fontsizes.dart';
import 'package:task3_quiz_app/src/utils/constants/fontweights.dart';
import 'package:task3_quiz_app/src/utils/extensions.dart';
import 'package:task3_quiz_app/src/utils/widgets/other_widgets/elevatedbutton_widget.dart';
import 'package:task3_quiz_app/src/utils/widgets/other_widgets/list_tile_leading_widget.dart';
import 'package:task3_quiz_app/src/utils/widgets/other_widgets/empty_container.dart';
import 'dart:developer' as marach show log;


class QuestionsRender extends StatelessWidget {
  const QuestionsRender({super.key});

  @override
  Widget build(BuildContext context) {
    final quizNotify = Provider.of<QuizManager>(context, listen: false);
    final quizQuestions = quizNotify.retrievedQuestions!;
    final selectedOptions = quizNotify.listOfSelectedOptions;
    final correctOptions = quizNotify.listOfCorrectOptions;
    final pageController = quizNotify.pageController;

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          // const Text('Ongoing Quiz').decorateWithGoogleFont(
          //   redColor,
          //   fontWeight7,
          //   fontSize4
          // ),
          const Gap(20),
          Expanded(
            child: PageView.builder(
              controller: pageController,
              allowImplicitScrolling: true,
              onPageChanged: (pageIndex){
                pageIndex.checkForStartOrEnd(
                  context: context,
                  numberOfQuestions: quizQuestions.length
                );
                // quizNotify.callToAction(
                //   () {correctOptions?.checkAndInsert(pageIndex, correctAnswer);
                // });
              },
              itemCount: quizQuestions.length,
              itemBuilder: (context, pageIndex){
                
                final questionData = quizQuestions.elementAt(pageIndex);
                final options = questionData.incorectAnswers;
                final question = questionData.question;
                final questionNumber = questionData.questionNumber;
                final correctAnswer = questionData.correctAnswer;
                // correctOptions.checkAndInsert(pageIndex, correctAnswer);
                options..add(correctAnswer)..shuffle(); 
                final uniqueOptions = Set.from(options);
                // marach.log('this is correctOptions $correctOptions');
      
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
                        children: uniqueOptions.map(
                          (option) {
                            return Row(
                              children: [                              
                                Consumer<QuizManager>(
                                  builder: (_, quiz, __) => Radio<String>(
                                    value: option,
                                    groupValue: quiz.selectedOption,
                                    onChanged: (value){
                                      quiz.callToAction(() {
                                        quiz.selectedOption = value;
                                        // if(value != null){
                                        //   selectedOptions.checkAndInsert(pageIndex, value);
                                        // }
                                      });
                                      //marach.log(selectedOptions.toString());
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
          Consumer<QuizManager>(
            builder: (_, quiz, __) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                quiz.atBeginingOfPage ? emptySizedBox : Expanded(
                  flex: 1,
                  child: ElevatedButtonWidget(
                    backgroundColor: whiteColor, 
                    foregroundColor: redColor,
                    borderColor: redColor, 
                    text: 'Previous', 
                    function: () async{
                      await pageController.previousPage(
                        duration: const Duration(seconds: 1), 
                        curve: Curves.decelerate
                      );
                    }
                  ),
                ),
                const Gap(10),
                quiz.atEndOfPage ? emptySizedBox : Expanded(
                  flex: 1,
                  child: ElevatedButtonWidget(
                    backgroundColor: whiteColor,
                    foregroundColor: redColor, 
                    borderColor: redColor, 
                    text: 'Next', 
                    function: () async{
                      await pageController.nextPage(
                        duration: const Duration(seconds: 1), 
                        curve: Curves.decelerate
                      );
                    }
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}