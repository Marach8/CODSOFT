
import 'package:task3_quiz_app/src/utils/constants/strings.dart';

class QuizQuestion{
  final String questionNumber,
  question,
  correctAnswer;
  final List<String> incorectAnswers;

  QuizQuestion({
    required this.questionNumber, 
    required this.question,
    required this.correctAnswer,
    required this.incorectAnswers
  }); 

  factory QuizQuestion.fromJson({
    required Map<String, dynamic> json, 
    required String number
  }) => QuizQuestion(
      questionNumber: number,
      question: json[questionString],
      correctAnswer: json[correctAnswerString],
      incorectAnswers: json[incorrectAnswersString]
    );
}