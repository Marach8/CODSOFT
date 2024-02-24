import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task3_quiz_app/src/functions/get_api.dart';
import 'package:task3_quiz_app/src/utils/constants/colors.dart';
import 'package:task3_quiz_app/src/utils/constants/fontsizes.dart';
import 'package:task3_quiz_app/src/utils/constants/fontweights.dart';
import 'package:task3_quiz_app/src/utils/extensions.dart';

class CategoryContainerWidget extends StatelessWidget {

  const CategoryContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getQuizCategories(), 
      builder: (_, snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          if(snapshot.data != null){
            final categoriesModel = snapshot.data!;

            return Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: categoriesModel.map(
                    (model){
                      final categoryName = model.categoryName;
                      //final categoryId = model.categoryId;
                      return Row(
                        children: [
                          GestureDetector(
                            onTap: () async {},
                            child: Container(
                              height: 30,
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all().modifyBorder(greenColor, 0.5),
                              ),
                              child: Center(
                                child: Text(categoryName).decorateWithGoogleFont(
                                  greenColor,
                                  fontWeight4,
                                  fontSize2
                                )
                              )
                            ),
                          ),
                          const Gap(5)
                        ],
                      );
                    }
                  ).toList()
                ),
              )
            );
          }
          
          return const Expanded(
            child: Text('Network Fail')
          );
        }

        return const CircularProgressIndicator(
          color: redColor
        );
      }
    );
  }
}