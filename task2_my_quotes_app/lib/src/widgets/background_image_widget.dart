import 'package:flutter/material.dart';
import 'package:task2_my_quotes_app/src/utils/loading_screen/loading_screen.dart';
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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    return Expanded(
      child: Image.asset(
        imageFilePath,
          height: screenHeight,
          width: screenWidth,
          fit: BoxFit.cover
      ),
    );
  }
}