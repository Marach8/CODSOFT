import 'package:flutter/material.dart';
import 'package:task3_quiz_app/src/utils/constants/colors.dart';
import 'package:task3_quiz_app/src/utils/constants/fontsizes.dart';
import 'package:task3_quiz_app/src/utils/constants/fontweights.dart';
import 'package:task3_quiz_app/src/utils/constants/strings.dart';
import 'package:task3_quiz_app/src/utils/extensions.dart';

class SwipeInstruction extends StatefulWidget {
  const SwipeInstruction({super.key});

  @override
  State<SwipeInstruction> createState() => _SwipeInstructionState();
}

class _SwipeInstructionState extends State<SwipeInstruction> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation<double> animation;

  @override 
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5)
    )..repeat(reverse: true);

    animation =  Tween<double>(
      begin: 0.0,
      end: 1.0
    )
    .chain(CurveTween(curve: Curves.easeInCirc))
    .animate(controller);

    animation.addStatusListener(
      (status) async {
        if(status == AnimationStatus.completed){
          await Future.delayed(
            const Duration(seconds: 2)
          ).then(
            (_) => controller.reverse()
            .then((_) => controller.forward())
          );
        }
      }
    );
  }

  @override 
  void dispose(){
    controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    controller.forward();

    return AnimatedBuilder(
      animation: animation, 
      builder: (_, __) => Opacity(
        opacity: animation.value,
        child: Center(
          child: const Text(appBarInstruction).decorateWithGoogleFont(
            blackColor,
            fontWeight5,
            fontSize2
          ),
        )
      )
    );
  }
}