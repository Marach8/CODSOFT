import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task2_my_quotes_app/src/utils/colors.dart';
import 'package:task2_my_quotes_app/src/utils/extensions.dart';
import 'package:task2_my_quotes_app/src/utils/fontsizes.dart';
import 'package:task2_my_quotes_app/src/utils/fontweights.dart';
import 'package:task2_my_quotes_app/src/utils/strings.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Material(
      color: blackColor.withAlpha(150),
      child: Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: screenWidth * 0.8,
            maxHeight: screenHeight * 0.8,
            minWidth: screenWidth * 0.5
          ),
          decoration: BoxDecoration(
            color: blackColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Gap(10),
                  const CircularProgressIndicator(
                    color: whiteColor
                  ),
                  const Gap(20),
                  const Text(loadingString).decorateWithGoogleFont(
                    whiteColor,
                    fontWeight4,
                    fontSize2, 
                  ),
                  const Gap(10)
                ],
              ),
            ),
          ),
        )
      )
    );
  }
}