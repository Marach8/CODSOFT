import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task2_my_quotes_app/src/services/button_functions.dart';
import 'package:task2_my_quotes_app/src/utils/strings.dart';
import 'package:task2_my_quotes_app/src/widgets/nav_bar/custom_nav_bar_button_column.dart';

class BottomNavButtons extends StatelessWidget {
  final void Function() refresh;

  const BottomNavButtons({
    super.key,
    required this.refresh
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        NavBarButtonColumn(
          icon: FontAwesomeIcons.download, 
          function: () async => await saveQuote(context: context),
          title: saveQuoteTitle
        ),
        NavBarButtonColumn(
          icon: FontAwesomeIcons.arrowRotateRight, 
          function: refresh,
          title: refreshQuote
        ),
        NavBarButtonColumn(
          icon: FontAwesomeIcons.share, 
          function: () {},
          title: shareQuoteString
        ),
        NavBarButtonColumn(
          icon: FontAwesomeIcons.bookOpenReader, 
          function: () => Scaffold.of(context).openDrawer(),
          title: viewFavorites
        )
      ],
    );
  }
}