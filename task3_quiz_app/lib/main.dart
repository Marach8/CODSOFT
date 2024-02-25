import 'package:flutter/material.dart';
import 'package:provider/provider.dart' show ChangeNotifierProvider;
import 'package:task3_quiz_app/src/functions/change_notifier.dart';
import 'package:task3_quiz_app/src/utils/constants/colors.dart';
import 'package:task3_quiz_app/src/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QuizManager(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: whiteColor
          ),
          useMaterial3: true,
          brightness: Brightness.light
        ),
        home: const QuizHome()
      ),
    );
  }
}