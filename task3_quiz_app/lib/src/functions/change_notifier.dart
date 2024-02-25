import 'package:flutter/material.dart';

class QuizManager extends ChangeNotifier{
  bool activateStartQuizeButton = false;
  bool showFirst = true;

  int? category;
  String? typeSubCategory;
  String? difficultySubCategory;
  String? numberSubcategory;

  List<String> quizSubCategories = [];

  void organizQuery(){
    
  }

  void callToAction(void Function() action){
    action();
    notifyListeners();
  }
}