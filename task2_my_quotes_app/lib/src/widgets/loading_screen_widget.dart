import 'package:flutter/material.dart';
import 'package:task2_my_quotes_app/src/utils/helper_functions.dart';
import 'package:task2_my_quotes_app/src/utils/dialogs/loading_screen/loading_screen.dart';
import 'package:task2_my_quotes_app/src/utils/strings.dart';

class BackgroundImageWithOverlayWidget extends StatefulWidget {
  final BuildContext context1;

  const BackgroundImageWithOverlayWidget({
    super.key,
    required this.context1
  });

  @override
  State<BackgroundImageWithOverlayWidget> createState() => _BackgroundImageWithOverlayWidgetState();
}

class _BackgroundImageWithOverlayWidgetState extends State<BackgroundImageWithOverlayWidget> {
  LoadingScreen loadingScreen = LoadingScreen();

  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => loadingScreen.showOverlay(
        widget.context1,
        loadingString
      )
    );
  }

  @override
  void dispose(){
    loadingScreen.hideOverlay();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
   
    return SizedBox(
      height: screenHeight(context),
      width: screenWidth(context),
      child: Image.asset(
        imageFilePath,
        height: screenHeight(context),
        width: screenWidth(context),
        fit: BoxFit.cover
      ),
    );
  }
}