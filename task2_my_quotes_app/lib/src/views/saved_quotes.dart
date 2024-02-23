import 'package:flutter/material.dart';
import 'package:task2_my_quotes_app/src/functions/database.dart';
import 'package:task2_my_quotes_app/src/utils/colors.dart';
import 'package:task2_my_quotes_app/src/utils/extensions.dart';
import 'package:task2_my_quotes_app/src/utils/fontsizes.dart';
import 'package:task2_my_quotes_app/src/utils/fontweights.dart';
import 'package:task2_my_quotes_app/src/utils/strings.dart';
import 'package:task2_my_quotes_app/src/views/list_tile_leading_widget.dart';

class SavedQuotes extends StatelessWidget {
  const SavedQuotes({super.key});

  @override
  Widget build(BuildContext context) {
    final database = LocalDatabase();
    
    return Column(
      children: [
        DrawerHeader(
          child: const Text(favoriteQuotes).decorateWithGoogleFont(
            whiteColor,
            fontWeight4,
            fontSize4
          ),
        ),
        Expanded(
          child: FutureBuilder<Iterable<List<String>?>>(
            future: database.getQuoteItems(),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.done){
                if(snapshot.hasData && snapshot.data!.isNotEmpty){
                  return ListView(
                    children: snapshot.data!.map(
                      (quoteItem) => Card(
                        margin: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                        color: whiteColor.withOpacity(0.2),
                        child: ListTile(
                          minLeadingWidth: 0,
                          leading: ListTileLeadingWidget(
                            listIndex: int.parse(quoteItem!.last)
                          ),
                          title: Text(quoteItem.first).decorateWithGoogleFont(
                            whiteColor, 
                            fontWeight3,
                            fontSize2,
                          ),
                          
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top:3),
                            child: Text(
                              dashString + quoteItem[1] + dashString
                            ).decorateWithGoogleFont(
                              whiteColor, 
                              fontWeight7,
                              fontSize1,
                            ),
                          ),
                        ),
                      )
                    ).toList()
                  );
                }
          
                else{
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Center(
                      child: const Text(noSavedQuotes).decorateWithGoogleFont(
                        whiteColor, 
                        fontWeight2, 
                        fontSize3
                      ),
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
          ),
        ),
      ],
    );
  }
}


