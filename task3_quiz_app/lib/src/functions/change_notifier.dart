import 'package:flutter/material.dart';
import 'package:task3_quiz_app/src/utils/constants/strings.dart';
import 'package:task3_quiz_app/src/utils/extensions.dart';
import 'package:task3_quiz_app/src/utils/models/quiz_question_model.dart';

class QuizManager extends ChangeNotifier{
  final int pageIndex = 0;
  final pageController = PageController(initialPage: 0);

  bool atEndOfPage = false;
  
  @override
  void dispose(){
    pageController.dispose();
    super.dispose();
  }
  
  Iterable<QuizQuestion>? retrievedQuestions;

  String? selectedOption;
  
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