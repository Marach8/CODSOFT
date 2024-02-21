import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task2_my_quotes_app/src/utils/colors.dart';
import 'package:task2_my_quotes_app/src/utils/extensions.dart';
import 'package:task2_my_quotes_app/src/utils/fontsizes.dart';
import 'package:task2_my_quotes_app/src/utils/fontweights.dart';

class NavBarButtonColumn extends StatelessWidget {
  final IconData icon;
  final void Function() function;
  final String title;
  final bool? activateButtons;

  const NavBarButtonColumn({
    super.key,
    required this.icon,
    required this.function,
    required this.title,
    this.activateButtons
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton.outlined(
          onPressed: activateButtons ?? false ? function : null, 
          icon: FaIcon(icon),
          color: whiteColor,
          disabledColor: disabledButtonColor,
        ),
        Text(title).decorateWithGoogleFont(
          whiteColor, 
          fontWeight4, 
          fontSize1
        )
      ],
    );
  }
}