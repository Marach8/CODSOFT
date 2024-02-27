import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task3_quiz_app/src/functions/change_notifier.dart';
import 'package:task3_quiz_app/src/functions/get_api.dart';
import 'package:task3_quiz_app/src/utils/constants/colors.dart';
import 'package:task3_quiz_app/src/utils/constants/fontsizes.dart';
import 'package:task3_quiz_app/src/utils/constants/fontweights.dart';
import 'package:task3_quiz_app/src/utils/constants/strings.dart';
import 'package:task3_quiz_app/src/utils/dialogs/flushbar.dart';
import 'package:task3_quiz_app/src/utils/extensions.dart';
import 'package:task3_quiz_app/src/utils/dialogs/loading_screen/loading_screen.dart';
import 'package:task3_quiz_app/src/views/questiions/questions_view.dart';

class BottomNavBarButton extends StatelessWidget {
  final BuildContext loadingContext;
  const BottomNavBarButton({
    super.key,
    required this.loadingContext
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final loadingScreen = LoadingScreen();

    return Consumer<QuizManager>(
      builder: (_, quizNotify, __){
        final activate = quizNotify.activateStartQuizeButton;
        return Container(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
          width: screenWidth,
          child: ElevatedButton(
            onPressed: activate ?
            () async{
              loadingScreen.showOverlay(loadingContext, loadingString);
              final url = quizNotify.organizeQuery();
              await getQuizQuestion(url).then(
                (questions) async{
                  if(questions == null){
                    loadingScreen.hideOverlay();
                    await showFlushbar(
                      context,
                      fetchError
                    );
                  }

                  else{
                    quizNotify.retrievedQuestions = questions;
                    loadingScreen.hideOverlay();
                    await commenceQuiz(context: loadingContext);
                  }
                }
              );
            } : null,
            
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                activate ? greenColor : greenColor.withAlpha(100)
              ),
              foregroundColor: MaterialStatePropertyAll(
                activate ? whiteColor : whiteColor.withAlpha(50)
              ),
              side: const MaterialStatePropertyAll(
                BorderSide(
                  color: whiteColor,
                  width: 1,
                )
              ) 
            ),
            child: const Text(startQuiz).decorateWithGoogleFont(
              whiteColor,
              fontWeight7,
              fontSize2
            )
          )
        );
      }
    );
  }
}