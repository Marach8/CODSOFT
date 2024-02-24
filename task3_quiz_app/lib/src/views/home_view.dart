import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task3_quiz_app/src/utils/constants/colors.dart';
import 'package:task3_quiz_app/src/utils/widgets/custom_widgets/annotated_widget.dart';
import 'package:task3_quiz_app/src/utils/widgets/custom_widgets/categories_container.dart';
import 'package:task3_quiz_app/src/utils/widgets/custom_widgets/container_widget.dart';

class QuizHome extends StatelessWidget {
  const QuizHome ({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return AnnotatedRegionWidget(
      child: Scaffold(
        backgroundColor: whiteColorWithOpacity,
        appBar: AppBar(
          title: const Text('Quiz App'),
          centerTitle: true,
          backgroundColor: whiteColor.withAlpha(50),
          bottom: const PreferredSize(
            preferredSize: Size.square(40),
            child: CategoryContainerWidget()
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: Iterable.generate(
                6, (index) => Column(
                  children: [
                    index == 0 ? const Gap(20) : const SizedBox(),
                    const ContainerWidget(
                      backgroundColor: whiteColor,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      addBorder: true,
                      children: [
                        Center(child: Text('Hello dear'))
                      ]
                    ),
                    const Gap(20)
                  ],
                )
              ).toList()
            )
          ),
        )
      ),
    );
  }
}