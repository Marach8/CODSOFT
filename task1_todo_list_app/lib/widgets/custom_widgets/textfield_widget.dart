import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task1_todo_list_app/constants/colors.dart';
import 'package:task1_todo_list_app/constants/fontsizes.dart';
import 'package:task1_todo_list_app/constants/fontweights.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final bool? showSuffixIcon;
  final Function()? onTap;

  const CustomTextField({
    required this.title,
    required this.controller,
    this.showSuffixIcon,
    this.onTap,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: null, 
      autocorrect: true, 
      cursorColor: blackColor,              
      cursorWidth: 0.5,
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: blackColor.withOpacity(0.5),
          fontSize: fontSize2,
          fontWeight: fontWeight3
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: purpleColor
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: blackColor
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        label: Text(title),
        suffixIcon: showSuffixIcon ?? false ? IconButton(
          onPressed: onTap, 
          icon: const FaIcon(FontAwesomeIcons.clock)
        ) : null
      ),
      style: const TextStyle(
        fontSize: fontSize3,
        fontWeight: fontWeight4,
        decoration: TextDecoration.none
      ), 
    );
  }
}