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


extension OrganizeQuery on List<String>{
  String organizeQuery(){
    for(var i = 1; i < length; i++){
      if(this[i].isEmpty){
        removeRange(i-1, i+1);
        i--;
      }
    }
    return join();
  }
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
        quizNotifier.callToAction(() => quizNotifier.numberSubCategory = null);
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
      quizNotifier.callToAction(
        () => quizNotifier.difficultySubCategory = hard.substring(0, hard.length - 1).toLowerCase()
      );
    }

    else if(this == medium){
      quizNotifier.callToAction(
        () => quizNotifier.difficultySubCategory = medium.substring(0, medium.length - 1).toLowerCase()
      );
    }

    else if(this == easy){
      quizNotifier.callToAction(
        () => quizNotifier.difficultySubCategory = easy.substring(0, easy.length - 1).toLowerCase()
      );
    }

    else if(this == anyDifficulty){
      quizNotifier.callToAction(() => quizNotifier.difficultySubCategory = emptyString);
    }
    

    else if(this == ten){
      quizNotifier.callToAction(() => quizNotifier.numberSubCategory = 10.toString());
    }

    else if(this == twenty){
      quizNotifier.callToAction(() => quizNotifier.numberSubCategory = 20.toString());
    }

    else if(this == thirty){
      quizNotifier.callToAction(() => quizNotifier.numberSubCategory = 30.toString());
    }

    else if(this == fourty){
      quizNotifier.callToAction(() => quizNotifier.numberSubCategory = 40.toString());
    }

    else if(this == fifty){
      quizNotifier.callToAction(() => quizNotifier.numberSubCategory = 50.toString());
    }
  }
}