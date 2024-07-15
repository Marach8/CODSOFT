import 'package:flutter/material.dart';
import 'package:task2_my_quotes_app/src/utils/dialogs/loading_widget.dart';
import 'package:task2_my_quotes_app/src/utils/helper_functions.dart';
import 'package:task2_my_quotes_app/src/utils/dialogs/loading_screen/loading_screen.dart';
import 'package:task2_my_quotes_app/src/utils/strings.dart';

class BackgroundImageWithOverlayWidget extends StatelessWidget {

  const BackgroundImageWithOverlayWidget({super.key});

  @override
  Widget build(BuildContext context) {
   
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: screenHeight(context),
          width: screenWidth(context),
          child: Image.asset(
            imageFilePath,
            height: screenHeight(context),
            width: screenWidth(context),
            fit: BoxFit.cover
          ),
        ),
        const LoadingWidget()
      ],
    );
  }
}