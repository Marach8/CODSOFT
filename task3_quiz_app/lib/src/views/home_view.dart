import 'package:flutter/material.dart';
import 'package:task3_quiz_app/src/utils/constants/colors.dart';
import 'package:task3_quiz_app/src/utils/widgets/custom_widgets/annotated_widget.dart';
import 'package:task3_quiz_app/src/utils/widgets/custom_widgets/container_widget.dart';

class QuizHome extends StatelessWidget {
  const QuizHome ({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegionWidget(
      child: Scaffold(
        backgroundColor: whiteColorWithOpacity,
        appBar: AppBar(
          title: const Text('Quiz App'),
          centerTitle: true,
          backgroundColor: whiteColorWithOpacity,
        ),
        body: const Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                ContainerWidget(
                  children: [
                    
                  ]
                )
              ],
            )
          ),
        )
      ),
    );
  }
}