import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:task2_my_quotes_app/src/services/local_database_service.dart';
import 'package:task2_my_quotes_app/src/utils/dialogs/flushbar.dart';
import 'package:task2_my_quotes_app/src/utils/strings.dart';

Future<void> shareQuote({
  required BuildContext context,
  List<String>? quoteToShare
}) async{
  try{
    final retrievedQouteAndAuthor = await LocalDatabaseService().getTemporaryQuote();
    final quoteAndAuthor = quoteToShare ?? retrievedQouteAndAuthor;

    if (quoteAndAuthor != null){
      final quote = quoteAndAuthor.first;
      final author = quoteAndAuthor[1];
      final textToShare = '$quote\n$dashString $author $dashString';

      await Share.share(textToShare)
      .then(
        (shareResult) async{
          if(shareResult.status == ShareResultStatus.success){
            await showFlushbar(context, quoteShared);
          }
        }
      );
    }
  }
  catch (e){
    Future.delayed(Duration.zero).then(
      (_) async => await showFlushbar(context, e.toString())
    );
  }
}