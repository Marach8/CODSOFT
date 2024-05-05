import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle, Uint8List;
import 'package:task2_my_quotes_app/src/functions/get_api.dart';
import 'package:task2_my_quotes_app/src/utils/colors.dart';
import 'package:task2_my_quotes_app/src/screens/saved_quotes.dart';
import 'package:task2_my_quotes_app/src/widgets/nav_bar/bottom_nav_bar.dart';
import 'package:task2_my_quotes_app/src/widgets/fallback_widget.dart';
import 'package:task2_my_quotes_app/src/widgets/loading_screen_widget.dart';
import 'package:task2_my_quotes_app/src/widgets/picture_and_quote.dart';

class QuotesHome extends StatefulWidget {
  const QuotesHome({super.key});

  @override
  State<QuotesHome> createState() => _QuotesHomeState();
}

class _QuotesHomeState extends State<QuotesHome> {
  
  void refresh() => setState((){});

  @override
  Widget build(BuildContext context) {
    
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: transparentColor,
        systemNavigationBarColor: blackColor.withAlpha(10)
      ),
      child: Scaffold(
        body: Center(
          child: FutureBuilder<dynamic>(
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
                    quoteList: quotesSnaphot as List<String>,
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
        ),
        drawer: Drawer(
          backgroundColor: blackColor.withAlpha(150),
          child: const SavedQuotes(),
          
        ),
        bottomNavigationBar: BottomNavButtons(
          refresh: () => refresh()
        ),
        backgroundColor: blackColor.withAlpha(10)
      ),
    );
  }
}