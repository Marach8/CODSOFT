import 'package:flutter/material.dart';
import 'package:task3_quiz_app/src/utils/constants/colors.dart';
import 'package:task3_quiz_app/src/utils/constants/fontsizes.dart';
import 'package:task3_quiz_app/src/utils/constants/fontweights.dart';
import 'package:task3_quiz_app/src/utils/extensions.dart';

class SliderAnimationView extends StatefulWidget {
  final double distance;
  final String text;

  const SliderAnimationView({
    super.key,
    required this.text,
    required this.distance
  });

  @override
  State<SliderAnimationView> createState() => _SliderAnimationState();
}

class _SliderAnimationState extends State<SliderAnimationView> 
with SingleTickerProviderStateMixin{
  late AnimationController sliderController;
  late Animation<Offset> sliderAnimation;

  @override 
  void initState(){
    super.initState();
    sliderController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15)
    )..repeat();

    sliderAnimation = Tween<Offset> (
      begin: Offset(-widget.distance/100, 0), 
      end: const Offset(5, 0)
    ).animate(sliderController);

    sliderAnimation.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        sliderController..reset()..forward();
      }
    });
  }

  @override 
  void dispose(){
    sliderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    sliderController.forward();
 
    return SlideTransition(
      position: sliderAnimation,
      textDirection: TextDirection.rtl,
      child: Text(widget.text).decorateWithGoogleFont(
        blackColor,
        fontWeight2,
        fontSize2
      ),
    );
  }
}