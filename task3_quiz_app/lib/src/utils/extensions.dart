import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:task3_quiz_app/src/functions/change_notifier.dart';
import 'package:task3_quiz_app/src/utils/constants/strings.dart';


extension ModifyText on Text{
  Text decorateWithGoogleFont(
    Color color, 
    FontWeight fontWeight,
    double fontSize,
    [bool? controlOverflow]
  ) => Text(
    data ?? '', 
    style: TextStyle(
      fontFamily: quickSandFont,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color
    ),
    overflow: controlOverflow ?? false ? TextOverflow.ellipsis : null,
    softWrap: true,   
  );
}


extension ModifyBorder on Border{
  Border modifyBorder(Color color, double width) => Border.all(
    color: color, width: width,
  );
}


extension CheckAndSetString on String{
  void checkAndSet({required BuildContext context}){

    final quizNotifier = Provider.of<QuizManager>(context, listen: false);

    if(
      this == multipleChoice ||
      this == trueOrFalse ||
      this == anyQuestion
    ){
      quizNotifier.callToAction(() => quizNotifier.typeSubCategory = this);
    }

    else if(
      this == hard ||
      this == medium ||
      this == easy ||
      this == anyDifficulty
    ){
      quizNotifier.callToAction(() => quizNotifier.difficultySubCategory = this);
    }

    else if(
      this == ten ||
      this == twenty ||
      this == thirty ||
      this == fourty ||
      this == fifty
    ){
      quizNotifier.callToAction(() => quizNotifier.numberSubcategory = this);
    }
  }
}