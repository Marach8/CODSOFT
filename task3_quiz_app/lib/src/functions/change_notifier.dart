import 'package:flutter/material.dart';

class QuizManager extends ChangeNotifier{
  
  String? category,
  typeSubCategory,
  difficultySubCategory,
  numberSubcategory;

  bool get activateStartQuizeButton 
    => category != null && typeSubCategory != null && 
    difficultySubCategory != null && numberSubcategory != null;

  void organizeQuery(){
    
  }


  void callToAction(void Function() action){
    action();
    notifyListeners();
  }
}