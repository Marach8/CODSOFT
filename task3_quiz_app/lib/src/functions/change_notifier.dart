import 'package:flutter/material.dart';
import 'package:task3_quiz_app/src/utils/constants/strings.dart';
import 'package:task3_quiz_app/src/utils/extensions.dart';

class QuizManager extends ChangeNotifier{
  
  String? category,
  typeSubCategory,
  difficultySubCategory,
  numberSubCategory;

  bool get activateStartQuizeButton 
    => category != null && typeSubCategory != null && 
    difficultySubCategory != null && numberSubCategory != null;

  
  String organizeQuery(){
    return [
      quizBaseUrl,
      amountString,
      numberSubCategory!,
      categoryString,
      category!,
      difficultyString,
      difficultySubCategory!,
      typeString,
      typeSubCategory!
    ].organizeQuery();
  }


  void callToAction(void Function() action){
    action();
    notifyListeners();
  }
}