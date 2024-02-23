import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task2_my_quotes_app/src/utils/colors.dart';
import 'package:task2_my_quotes_app/src/utils/extensions.dart';
import 'package:task2_my_quotes_app/src/utils/fontsizes.dart';
import 'package:task2_my_quotes_app/src/utils/fontweights.dart';
import 'package:task2_my_quotes_app/src/utils/strings.dart';

class QuoteRenderWidget extends StatelessWidget {
  final List<String> quoteList;

  const QuoteRenderWidget({
    super.key,
    required this.quoteList
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(quoteList.first).decorateWithGoogleFont(
                whiteColor, 
                fontWeight4, 
                fontSize5
              ),
              const Gap(10),
              Text(dashString + quoteList.last + dashString).decorateWithGoogleFont(
                whiteColor, 
                fontWeight7, 
                fontSize3
              ),
            ],
          ),
        ),
      )
    );
  }
}