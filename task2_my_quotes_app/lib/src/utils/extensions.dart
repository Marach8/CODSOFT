import 'package:flutter/material.dart';
import 'package:task2_my_quotes_app/src/utils/strings.dart';

extension ModifyText on Text{
  Text decorateWithGoogleFont(
    Color color, 
    FontWeight fontWeight,
    double fontSize,
    [bool? controlOverflow]
  ) => Text(
    data ?? '', 
    style: TextStyle(
      fontFamily: quickSandFont,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color
    ),
    overflow: controlOverflow ?? false ? TextOverflow.ellipsis : null,
    softWrap: true,
  );
}

