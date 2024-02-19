import 'dart:convert';
import 'dart:io';
import 'package:task2_my_quotes_app/src/utils/strings.dart';
import 'dart:developer' as marach show log;

Future<void> getBackroundImage() async => 
  await HttpClient().getUrl(Uri.parse(backGroundImageUrl))
  .then((result) => result.close())
  .then((response) => response.transform(utf8.decoder).join())
  .then((string) => json.decode(string))
  .then((finalResult){
    marach.log(finalResult);
  });