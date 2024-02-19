import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task2_my_quotes_app/src/utils/strings.dart';
import 'dart:developer' as marach show log;

// Future<void> getBackroundImage() async => 
//   await HttpClient()
//   .getUrl(Uri.parse(backGroundImageUrl))
//   .then((result) => result.close())
//   .then((response) => response.transform(utf8.decoder).join())
//   .then((string) => json.decode(string))
//   .then((finalResult){
//     marach.log(finalResult);
//   });

Future<void> getRandomQuote() async{
  final response = await http.get(
    Uri.parse(appQuotes), 
    headers: {apiKey: apiKeyValue}
  );
  if(response.statusCode == 200){
    marach.log('request was successfull');
    final data = jsonDecode(response.body);
    print(data[0]['quote']);
  }
  else{
    marach.log('failed request.');
  }
}