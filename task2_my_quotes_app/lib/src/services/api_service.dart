import 'dart:convert';
import 'package:flutter/services.dart' show Uint8List;
import 'package:http/http.dart' as http;
import 'package:task2_my_quotes_app/src/services/database_service.dart';
import 'package:task2_my_quotes_app/src/utils/strings.dart';


Future<Uint8List?> getRandomImage() async{
  final response = await http.get(
    Uri.parse(backgroundImageUrl), 
    headers: {
      apiKey: apiKeyValue,
      acceptKey: acceptKeyValue
    }
  );

  if(response.statusCode == 200){
    return response.bodyBytes;
  }

  else{
    return null;
  }
}


Future<List<String>?> getRandomQuote() async{
  try{
    final response = await http.get(
      Uri.parse(quotesUrl),
      headers: {apiKey: apiKeyValue}
    );

    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      final String quote = data[0][quotesKey];
      final String author = data[0][authorKey];
      await LocalDatabase().setTemporaryQuote([quote, author]);
      return [quote, author];
    }
    return null;
  }

  catch (_){
    await LocalDatabase().setTemporaryQuote([]);
    return null;
  }
}