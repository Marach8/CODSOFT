import 'package:flutter/cupertino.dart';
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


extension OptionalCheckAndSet on String?{
  void optionalCheckAndSet({
    required BuildContext context,
    required String? tracker
  }){

    final quizNotifier = Provider.of<QuizManager>(context, listen: false);
    final isTypeSubCategory = [multipleChoice, trueOrFalse, anyQuestion]
      .any((element) => element == tracker);
    final isDifficultySubCategory = [hard, medium, easy, anyDifficulty]
      .any((element) => element == tracker);
    final isNumberSubCategory = [ten, twenty, thirty, fourty, fifty]
      .any((element) => element == tracker);

    if(this == null){
      if(isTypeSubCategory){
        quizNotifier.callToAction(() => quizNotifier.typeSubCategory = null);
      }
      
      else if(isDifficultySubCategory){
        quizNotifier.callToAction(() => quizNotifier.difficultySubCategory = null);
      }

      else if(isNumberSubCategory){
        quizNotifier.callToAction(() => quizNotifier.numberSubcategory = null);
      }
    }
  }
}


extension CheckAndSetString on String{
  void checkAndSet({required BuildContext context}){

    final quizNotifier = Provider.of<QuizManager>(context, listen: false);

    if(this == multipleChoice ){
      quizNotifier.callToAction(() => quizNotifier.typeSubCategory = multipleString);
    }

    else if(this == trueOrFalse){
      quizNotifier.callToAction(() => quizNotifier.typeSubCategory = boolString);
    }

    else if(this == anyQuestion){
      quizNotifier.callToAction(() => quizNotifier.typeSubCategory = emptyString);
    }


    else if(this == hard){
      quizNotifier.callToAction(() => quizNotifier.difficultySubCategory = hard.toLowerCase());
    }

    else if(this == medium){
      quizNotifier.callToAction(() => quizNotifier.difficultySubCategory = medium.toLowerCase());
    }

    else if(this == easy){
      quizNotifier.callToAction(() => quizNotifier.difficultySubCategory = easy.toLowerCase());
    }

    else if(this == anyDifficulty){
      quizNotifier.callToAction(() => quizNotifier.difficultySubCategory = emptyString);
    }
    

    else if(this == ten){
      quizNotifier.callToAction(() => quizNotifier.numberSubcategory = 10.toString());
    }

    else if(this == twenty){
      quizNotifier.callToAction(() => quizNotifier.numberSubcategory = 20.toString());
    }

    else if(this == thirty){
      quizNotifier.callToAction(() => quizNotifier.numberSubcategory = 30.toString());
    }

    else if(this == fourty){
      quizNotifier.callToAction(() => quizNotifier.numberSubcategory = 40.toString());
    }

    else if(this == fifty){
      quizNotifier.callToAction(() => quizNotifier.numberSubcategory = 50.toString());
    }
  }
}