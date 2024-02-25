import 'package:flutter/material.dart';

class QuizManager extends ChangeNotifier{
  bool activateStartQuizeButton = false;
  bool showFirst = true;
  List<dynamic> quizSubCategories = [];
  
  void callToAction(void Function() action){
    action();
    notifyListeners();
  }
}