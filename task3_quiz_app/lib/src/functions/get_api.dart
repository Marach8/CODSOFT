import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task3_quiz_app/src/utils/constants/strings.dart';
import 'package:task3_quiz_app/src/utils/models/categories_model.dart';
import 'package:task3_quiz_app/src/utils/models/quiz_question_model.dart';

Future<Iterable<CategoriesModel>?> getQuizCategories() async {
  try{
    final response = await http.get(
      Uri.parse(categoriesUrl),
    );

    if(response.statusCode != 200){
      return null;
    }

    final jsonData = jsonDecode(response.body);
    final List<dynamic> listOfCategoriesData = jsonData[categoriesKey];
    final categoriesModels = Iterable.generate(
      listOfCategoriesData.length,
      (index) => CategoriesModel.fromJson(json: listOfCategoriesData[index])
    );
    return categoriesModels;
  }

  catch (_){
    return null;
  }
}


Future<Iterable<QuizQuestion>?> getQuizQuestion(String url)async{
  try{
    final response = await http.get(Uri.parse(url));

    if(response.statusCode != 200){
      return null;
    }

    final jsonData = jsonDecode(response.body);
    final List<dynamic> questions = jsonData[resultsKey];
    final quizQuestions = Iterable.generate(
      questions.length,
      (index) => QuizQuestion.fromJson(
        json: questions[index], number: (index + 1).toString()
      )
    );
    print(jsonData.toString());
    return quizQuestions;
  }
  catch (_){
    return null;
  }
}