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
          bottom: PreferredSize(
            preferredSize: const Size.square(40),
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Center(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: Iterable.generate(
                      6, (i) => const CategoryContainerWidget(category: 'categorykjkjghgfgfgkjkghtrsdxghkl;')
                    ).toList(),
                  ),
                ),
              )
            )
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