import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle, Uint8List;
import 'package:task2_my_quotes_app/src/functions/get_api.dart';
import 'package:task2_my_quotes_app/src/utils/colors.dart';
import 'package:task2_my_quotes_app/src/widgets/fallback_widget.dart';
import 'package:task2_my_quotes_app/src/widgets/loading_screen_widget.dart';
import 'package:task2_my_quotes_app/src/widgets/picture_and_quote.dart';

class QuotesHome extends StatelessWidget {
  const QuotesHome({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: transparentColor,
        systemNavigationBarColor: tealColorWithOpacity
      ),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              FutureBuilder<dynamic>(
                future: Future.wait<dynamic>([
                  getRandomImage(),
                  getRandomQuote()
                ]),
                builder: (_, snapshot){
                  if(snapshot.connectionState == ConnectionState.done){
                    final imageSnapshot = snapshot.data?.first;
                    final quotesSnaphot = snapshot.data?.last;

                    if(imageSnapshot == null || quotesSnaphot == null){
                      return const FallBackWidget();
                    }

                    else{
                      return PictureAndQuoteWidget(
                        imageData: imageSnapshot as Uint8List,
                        quotesText: quotesSnaphot as String,
                      );
                    }
                  }
                  else{
                    return BackgroundImageWithOverlayWidget(
                      context1: context
                    );
                  }
                }
              ),
            ],
          ),
        ),
        bottomNavigationBar: Row(
          children: [
              ElevatedButton(
                onPressed: () async{
                  await getRandomImage();
                },
                child: const Text('getImage')
              ),
          ],
        ),
        backgroundColor: tealColorWithOpacity,
      ),
    );
  }
}