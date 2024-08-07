import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task2_my_quotes_app/src/services/local_database_service.dart';
import 'package:task2_my_quotes_app/src/utils/dialogs/flushbar.dart';
import 'package:task2_my_quotes_app/src/utils/dialogs/generic_dialog.dart';
import 'package:task2_my_quotes_app/src/utils/dialogs/loading_screen/loading_screen.dart';
import 'package:task2_my_quotes_app/src/utils/maps.dart';
import 'package:task2_my_quotes_app/src/utils/strings.dart';

final LocalDatabaseService database = LocalDatabaseService();
final LoadingScreen loadingScreen = LoadingScreen();

Future<void> saveQuote({
  required BuildContext context,
}) async {
  await database.getTemporaryQuote().then(
    (quote) async{
      if(quote!.isNotEmpty){
        await showGenericDialog<bool>(
          context: context, 
          title: saveQuoteTitle, 
          content: saveQuoteContent, 
          options: saveQuoteMap
        )
        .then((result) async{
          if(result ?? false){
            loadingScreen.showOverlay(context, saving);
            final savedQuotes = await database.getQuoteItems();
            final quoteDoesNotExistInitially = savedQuotes.every(
              (savedQuote) => savedQuote!.first != quote.first
            );
            if(quoteDoesNotExistInitially){
                await database.setQuoteItem(quote).then(
                (_) async{
                  loadingScreen.hideOverlay();
                  await showFlushbar(context, saved);
              });
            }

            else{
              loadingScreen.hideOverlay();
              await Future.delayed(Duration.zero).then(
                (_) async => await showFlushbar(context, quoteAlreadySaved)
              );
            }
            
          }
        });
      }

      else{
        await showFlushbar(context, noQuoteToSave);
      }
    }
  );
}
