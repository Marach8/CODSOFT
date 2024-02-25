import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task3_quiz_app/src/utils/constants/colors.dart';
import 'package:task3_quiz_app/src/utils/constants/fontsizes.dart';
import 'package:task3_quiz_app/src/utils/constants/fontweights.dart';
import 'package:task3_quiz_app/src/utils/extensions.dart';
import 'package:task3_quiz_app/src/utils/models/categories_model.dart';

class CategoriesListView extends StatelessWidget {
  final Iterable<CategoriesModel> categoriesModel;

  const CategoriesListView({
    super.key,
    required this.categoriesModel
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
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
                      height: 40,
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
}