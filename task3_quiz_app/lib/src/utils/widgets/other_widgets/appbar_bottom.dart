import 'package:flutter/material.dart';
import 'package:task3_quiz_app/src/functions/get_api.dart';
import 'package:task3_quiz_app/src/utils/animations/bottom_instruction.dart';
import 'package:task3_quiz_app/src/utils/constants/colors.dart';
import 'package:task3_quiz_app/src/utils/widgets/other_widgets/categories_listview.dart';

class AppBarBottomWidget extends StatelessWidget {

  const AppBarBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getQuizCategories(), 
      builder: (_, snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          if(snapshot.data != null){
            final categoriesModel = snapshot.data!;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SwipeInstruction(),
                CategoriesListView(categoriesModel: categoriesModel)
              ],
            );
          }
          
          return const Expanded(
            child: Text('Network Fail')
          );
        }

        return const CircularProgressIndicator(
          color: blackColor
        );
      }
    );
  }
}