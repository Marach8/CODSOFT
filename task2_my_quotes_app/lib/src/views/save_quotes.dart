import 'package:flutter/material.dart';
import 'package:task2_my_quotes_app/src/functions/database.dart';
import 'package:task2_my_quotes_app/src/utils/colors.dart';
import 'package:task2_my_quotes_app/src/utils/extensions.dart';
import 'package:task2_my_quotes_app/src/utils/fontsizes.dart';
import 'package:task2_my_quotes_app/src/utils/fontweights.dart';
import 'package:task2_my_quotes_app/src/utils/strings.dart';

class SavedQuotes extends StatelessWidget {
  const SavedQuotes({super.key});

  @override
  Widget build(BuildContext context) {
    final database = LocalDatabase();

    return FutureBuilder<Iterable<List<String>?>>(
      future: database.getQuoteItems(),
      builder: (_, snapshot) {
        if(snapshot.connectionState == ConnectionState.done){
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (_, listIndex){
                return const Text('Hello dear');
              }
            );
          }

          else{
            return Center(
              child: const Text(noSavedQuotes).decorateWithGoogleFont(
                whiteColor, 
                fontWeight2, 
                fontSize3
              ),
            );
          }
        }
        
        else{
          return const Center(
            child: CircularProgressIndicator(
              color: whiteColor,
            ),
          );
        }
      }
    );
  }
}