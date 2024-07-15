import 'package:flutter/material.dart';
import 'package:task2_my_quotes_app/src/controllers/share_quote_controller.dart';
import 'package:task2_my_quotes_app/src/services/local_database_service.dart';
import 'package:task2_my_quotes_app/src/utils/colors.dart';
import 'package:task2_my_quotes_app/src/utils/dialogs/flushbar.dart';
import 'package:task2_my_quotes_app/src/utils/dialogs/generic_dialog.dart';
import 'package:task2_my_quotes_app/src/utils/extensions.dart';
import 'package:task2_my_quotes_app/src/utils/fontsizes.dart';
import 'package:task2_my_quotes_app/src/utils/fontweights.dart';
import 'package:task2_my_quotes_app/src/utils/maps.dart';
import 'package:task2_my_quotes_app/src/utils/strings.dart';
import 'package:task2_my_quotes_app/src/widgets/list_tile_leading_widget.dart';
import 'package:task2_my_quotes_app/src/widgets/dismissible_background_widget.dart';

class SavedQuotes extends StatelessWidget {
  const SavedQuotes({super.key});

  @override
  Widget build(BuildContext context) {
    final database = LocalDatabaseService();

    return Column(
      children: [
        DrawerHeader(
          child: const Text(favoriteQuotes).decorateWithGoogleFont(
            whiteColor, fontWeight4, fontSize4
          ),
        ),
        Expanded(
          child: FutureBuilder<Iterable<List<String>?>>(
            future: database.getQuoteItems(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData && snapshot.data!.isNotEmpty) {

                  final indexedIterable = snapshot.data!.indexed;

                  return ListView(
                    children: indexedIterable.map(
                      (quoteItem) => Dismissible(
                        key: UniqueKey(),
                        confirmDismiss: (_) async {
                          return showGenericDialog<bool>(
                            context: context,
                            title: deleteQuote,
                            content: confirmDeleteQuote,
                            options: deleteQuoteMap
                          );
                        },
                        onDismissed: (direction) async {
                          if (direction == DismissDirection.endToStart || 
                            direction == DismissDirection.startToEnd
                          ) {
                            await database.deleteQuote(quoteItem.$2!.last).then(
                              (_) async => await showFlushbar(context, quoteDeleted)
                            );
                          }
                        },
                        background: const BackgroundOfDissmissible(),
                        child: Card(
                          margin: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                          color: whiteColor.withOpacity(0.2),
                          child: ListTile(
                            onTap: () => shareQuote(context: context, quoteToShare: quoteItem.$2),
                            minLeadingWidth: 0,
                            leading: ListTileLeadingWidget(listIndex:(quoteItem.$1 + 1).toString()),
                            title: Text(quoteItem.$2!.first).decorateWithGoogleFont(
                              whiteColor,
                              fontWeight3,
                              fontSize2,
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 3),
                              child: Text(dashString + quoteItem.$2![1] + dashString).decorateWithGoogleFont(
                                whiteColor,
                                fontWeight7,
                                fontSize1,
                              ),
                            ),
                          ),
                        ),
                      )
                    ).toList()
                  );
                } 
                else {
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Center(
                      child: const Text(noSavedQuotes).decorateWithGoogleFont(
                        whiteColor, fontWeight2, fontSize3
                      ),
                    ),
                  );
                }
              } 
              else {
                return const Center(
                  child: CircularProgressIndicator(color: whiteColor),
                );
              }
            }
          ),
        ),
      ],
    );
  }
}
