import 'package:flutter/material.dart';
import 'package:task3_quiz_app/src/utils/constants/colors.dart';
import 'package:task3_quiz_app/src/views/questiions/render_question.dart';

Future<void> commenceQuiz({
  required BuildContext context
}){
  return showModalBottomSheet(
    useSafeArea: true,
    // barrierColor: Colors.red,
    backgroundColor: transparentColor,
    context: context, 
    builder: (context){
      final screenWidth = MediaQuery.of(context).size.width;
      final screenHeight = MediaQuery.of(context).size.height;

      return Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          color: whiteColor.withOpacity(0.8),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30))
        ),
        child: const QuestionsRender(),
      );
    }
  );
}