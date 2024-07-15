import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle, Uint8List;
import 'package:task2_my_quotes_app/src/services/api_service.dart';
import 'package:task2_my_quotes_app/src/utils/colors.dart';
import 'package:task2_my_quotes_app/src/views/saved_quotes_view.dart';
import 'package:task2_my_quotes_app/src/widgets/nav_bar_widgets/bottom_nav_bar.dart';
import 'package:task2_my_quotes_app/src/widgets/fallback_widget.dart';
import 'package:task2_my_quotes_app/src/widgets/loading_screen_widget.dart';
import 'package:task2_my_quotes_app/src/widgets/picture_and_quote_widget.dart';


class QuotesHome extends StatefulWidget {
  const QuotesHome({super.key});

  @override
  State<QuotesHome> createState() => _QuotesHomeState();
}

class _QuotesHomeState extends State<QuotesHome> {

  ValueNotifier<bool> isLoading = ValueNotifier<bool>(true);

  @override
  void dispose(){
    isLoading.dispose();
    super.dispose();
  }
  
  void refresh() => setState(() => isLoading.value = true);

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
              ApiService.getRandomImage(),
              ApiService.getRandomQuote()
            ]).whenComplete(() => isLoading.value = false),
            builder: (_, snapshot){
              final connectionState = snapshot.connectionState;
              final data = snapshot.data;
              final isDoneLoading = connectionState == ConnectionState.done;
              final successfullDataRetreival = data?.first != null && data?.last != null;

              return AnimatedCrossFade(
                firstChild: const BackgroundImageWithOverlayWidget(),
                secondChild: successfullDataRetreival ? PictureAndQuoteWidget(
                    imageData: data.first as Uint8List,
                    quoteList: data.last as List<String>,
                  ) :  const FallBackWidget(),

                crossFadeState: isDoneLoading ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                duration: const Duration(seconds: 2),
                firstCurve: Curves.decelerate,
                secondCurve: Curves.decelerate,
                sizeCurve: Curves.decelerate,
              );
            }
          ),
        ),
        drawer: Drawer(
          backgroundColor: blackColor.withAlpha(150),
          child: const SavedQuotes(),          
        ),
        bottomNavigationBar: BottomNavButtons(
          refresh: () => refresh(),
          isLoading: isLoading,
        ),
        backgroundColor: blackColor.withAlpha(10)
      ),
    );
  }
}