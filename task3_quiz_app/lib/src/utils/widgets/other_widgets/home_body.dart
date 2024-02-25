import 'package:flutter/material.dart';
import 'package:task3_quiz_app/src/utils/widgets/custom_widgets/container_widget.dart';
import 'package:task3_quiz_app/src/utils/widgets/custom_widgets/sub_category.dart';

class HomeBodyWidget extends StatelessWidget {
  const HomeBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            ContainerWidget(
              child: QuizSubCategory(
                
              )
            )
          ]
        )
      ),
    );
  }
}