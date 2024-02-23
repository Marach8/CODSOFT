import 'package:flutter/material.dart';
import 'package:task2_my_quotes_app/src/utils/colors.dart';

class BackgroundOfDissmissible extends StatelessWidget {
  const BackgroundOfDissmissible({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 3, 20, 3),
      height: 30, 
      color: redColor, 
      alignment: Alignment.centerLeft,
      child: const Wrap(
        children: [
          Align(
            alignment: Alignment.bottomLeft, 
            child: Icon(
              Icons.delete_rounded, 
              color: blackColor
            )
          ),
          Align(
            alignment: Alignment.centerRight, 
            child: Icon(
              Icons.delete_rounded, 
              color: blackColor
            )
          ),
        ]
      )
    );
  }
}