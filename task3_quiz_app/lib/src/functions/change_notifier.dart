import 'package:flutter/material.dart';
import 'package:task3_quiz_app/src/utils/constants/strings.dart';
import 'package:task3_quiz_app/src/utils/extensions.dart';
import 'package:task3_quiz_app/src/utils/models/quiz_question_model.dart';

class QuizManager extends ChangeNotifier{
  final int pageIndex = 0;
  final pageController = PageController(initialPage: 0);

  bool atEndOfPage = false;
  bool atBeginingOfPage = true;
  
  @override
  void dispose(){
    pageController.dispose();
    super.dispose();
  }
  
  Iterable<QuizQuestion>? retrievedQuestions;

  List<String> listOfSelectedOptions = [];
  List<String> listOfCorrectOptions = [];

  int? get totalQuestions => retrievedQuestions?.length;
  int? get answeredQuestions => listOfSelectedOptions.where(
      (selectedOption) => selectedOption != emptyString
    ).length;

  bool get allQuestionsTaken => totalQuestions == answeredQuestions;

  
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

  double computeResult(){
    int score = 0;

    for (final i in listOfCorrectOptions){
      if((listOfSelectedOptions).contains(i)){
        score++;
      }
    }
    return (score/totalQuestions!) * 100;
  }


  List<String> generateList() => 
    Iterable.generate(
      totalQuestions ?? 0,
      (_) => emptyString
    ).toList();

  void callToAction(void Function() action){
    action();
    notifyListeners();
  }
}