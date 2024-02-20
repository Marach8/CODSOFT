import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task2_my_quotes_app/src/utils/colors.dart';
import 'package:task2_my_quotes_app/src/utils/extensions.dart';
import 'package:task2_my_quotes_app/src/utils/fontsizes.dart';
import 'package:task2_my_quotes_app/src/utils/fontweights.dart';
import 'package:task2_my_quotes_app/src/utils/loading_screen/loading_screen_controller.dart';


class LoadingScreen{
  LoadingScreen._sharedInstance();
  static final LoadingScreen _shared = LoadingScreen._sharedInstance();
  factory LoadingScreen() => _shared;
  
  LoadingScreenController? controller;

  void showOverlay(BuildContext context, String text){
    if(controller?.updateScreen(text) ?? false){
      return;
    } else{
      controller = _showOverlay(context, text);
    }
  }

  void hideOverlay() {
    controller?.closeScreen();
    controller = null;
  }

  LoadingScreenController? _showOverlay(
    BuildContext context, String text
  ){
    final state = Overlay.of(context);
    if(!state.mounted){
      return null;
    }

    final textStream = StreamController<String>();
    textStream.sink.add(text);

    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    
    final overlay = OverlayEntry(
      builder: (_) => Material(
        color: blackColor.withAlpha(200),
        child: Center(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: size.width * 0.8,
              maxHeight: size.height * 0.8,
              minWidth: size.width * 0.5
            ),
            decoration: BoxDecoration(
              color: blackColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Gap(10),
                    const CircularProgressIndicator(
                      color: whiteColor
                    ),
                    const Gap(20),
                    StreamBuilder(
                      stream: textStream.stream,
                      builder: (_, snapshot){
                        if(snapshot.hasData){
                          return Text(snapshot.data!)
                            .decorateWithGoogleFont(
                              whiteColor,
                              fontWeight4,
                              fontSize2, 
                            );
                        } else{
                          return const SizedBox.shrink();
                        }
                      }
                    ),
                    const Gap(10)
                  ],
                ),
              ),
            ),
          )
        )
      )
    );
    state.insert(overlay);
    return LoadingScreenController(
      closeScreen: (){
        textStream.close();
        overlay.remove();
        return true;
      },
      updateScreen: (text){
        textStream.sink.add(text);
        return true;
      }
    );
  }
}