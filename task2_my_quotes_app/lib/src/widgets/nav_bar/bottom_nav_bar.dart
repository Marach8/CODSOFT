import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task2_my_quotes_app/src/widgets/nav_bar/custom_nav_bar_button_column.dart';

class BottomNavButtons extends StatelessWidget {
  const BottomNavButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        NavBarButtonColumn(
          icon: FontAwesomeIcons.download, 
          function: () {},
          title: 'Save Quote'
        ),
        NavBarButtonColumn(
          icon: FontAwesomeIcons.arrowRotateRight, 
          function: () {},
          title: 'Refresh'
        ),
        NavBarButtonColumn(
          icon: FontAwesomeIcons.share, 
          function: () {},
          title: 'Share Quote'
        ),
        NavBarButtonColumn(
          icon: FontAwesomeIcons.bookOpenReader, 
          function: () {},
          title: 'View Favorites'
        )
      ],
    );
  }
}