import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task2_my_quotes_app/src/functions/database.dart';
import 'package:task2_my_quotes_app/src/utils/dialogs/flushbar.dart';
import 'package:task2_my_quotes_app/src/utils/dialogs/generic_dialog.dart';
import 'package:task2_my_quotes_app/src/utils/dialogs/loading_screen/loading_screen.dart';
import 'package:task2_my_quotes_app/src/utils/maps.dart';
import 'package:task2_my_quotes_app/src/utils/strings.dart';

final LocalDatabase database = LocalDatabase();
final LoadingScreen loadingScreen = LoadingScreen();

Future<void> saveQuote({
  required BuildContext context,
}) async {
  await database.getTemporaryQuote().then(
    (quote) async{
      if(quote != null && quote.isNotEmpty){
        await showGenericDialog<bool>(
          context: context, 
          title: saveQuoteTitle, 
          content: saveQuoteContent, 
          options: saveQuoteMap
        )
        .then((result) async{
          if(result ?? false){
            loadingScreen.showOverlay(context, saving);
            await database.setQuoteItem(quote).then(
              (_) async{
              loadingScreen.hideOverlay();
              await showFlushbar(context, saved);
            });
          }
        });
      }

      else{
        await showFlushbar(context, noQuoteToSave);
      }
    }
  );
}