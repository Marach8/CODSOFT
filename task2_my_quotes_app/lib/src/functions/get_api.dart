import 'dart:convert';
import 'package:flutter/services.dart' show Uint8List;
import 'package:http/http.dart' as http;
import 'package:task2_my_quotes_app/src/functions/database.dart';
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


Future<String?> getRandomQuote() async{
  try{
    final response = await http.get(
      Uri.parse(quotesUrl),
      headers: {apiKey: apiKeyValue}
    );

    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      final quote = data[0][quotesKey];
      await LocalDatabase().setTemporaryQuote(quote);
      return quote;
    }
    return null;
  }

  catch (_){
    await LocalDatabase().setTemporaryQuote(emptyString);
    return null;
  }
}