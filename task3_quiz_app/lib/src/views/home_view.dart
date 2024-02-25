import 'package:flutter/material.dart';
import 'package:task3_quiz_app/src/utils/constants/colors.dart';
import 'package:task3_quiz_app/src/utils/widgets/custom_widgets/annotated_widget.dart';
import 'package:task3_quiz_app/src/utils/widgets/other_widgets/appbar_bottom.dart';
import 'package:task3_quiz_app/src/utils/widgets/other_widgets/bottom_sheet.dart';
import 'package:task3_quiz_app/src/utils/widgets/other_widgets/home_body.dart';

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
          backgroundColor: whiteColor.withAlpha(10),
          bottom: const PreferredSize(
            preferredSize: Size.square(60),
            child: AppBarBottomWidget()
          ),
        ),
        body: const HomeBodyWidget(),
        bottomNavigationBar: BottomNavBarButton(onPressed: (){},),
      ),
    );
  }
}