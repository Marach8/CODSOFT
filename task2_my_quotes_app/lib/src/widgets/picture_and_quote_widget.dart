import 'package:flutter/foundation.dart' show Uint8List;
import 'package:flutter/material.dart';
import 'package:task2_my_quotes_app/src/utils/helper_functions.dart';
import 'package:task2_my_quotes_app/src/widgets/quote_rederer_widget.dart';

class PictureAndQuoteWidget extends StatelessWidget {
  final Uint8List imageData;
  final List<String> quoteList;

  const PictureAndQuoteWidget({
    super.key,
    required this.imageData,
    required this.quoteList
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight(context),
      width: screenWidth(context),
      child: Stack(
        children: [
          Image.memory(
            imageData,
            height: screenHeight(context),
            width: screenWidth(context),
            fit: BoxFit.cover
          ),
          QuoteRendererWidget(quoteList: quoteList)
        ],
      )
    );
  }
}