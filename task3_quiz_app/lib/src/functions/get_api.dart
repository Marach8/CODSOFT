import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task3_quiz_app/src/utils/constants/strings.dart';
import 'package:task3_quiz_app/src/utils/models/categories_model.dart';

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


// Future<Uint8List?> getRandomImage() async{
//   final response = await http.get(
//     Uri.parse(backgroundImageUrl), 
//   );

//   if(response.statusCode == 200){
//     return response.bodyBytes;
//   }

//   else{
//     return null;
//   }
// }


// Future<List<String>?> getRandomQuote() async{
//   try{
//     final response = await http.get(
//       Uri.parse(quotesUrl),
//       headers: {apiKey: apiKeyValue}
//     );

//     if(response.statusCode == 200){
//       final data = jsonDecode(response.body);
//       final quote = data[0][quotesKey];
//       final author = data[0][authorKey];
//       await LocalDatabase().setTemporaryQuote([quote, author]);
//       return [quote, author];
//     }
//     return null;
//   }

//   catch (_){
//     await LocalDatabase().setTemporaryQuote([]);
//     return null;
//   }
// }