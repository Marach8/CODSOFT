import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task2_my_quotes_app/src/utils/strings.dart';

class LocalDatabase{
  LocalDatabase._sharedInstance(); 
  static final LocalDatabase _shared = LocalDatabase._sharedInstance();
  factory LocalDatabase() => _shared;


  Future<SharedPreferences> preferences() async
    => await SharedPreferences.getInstance();

  Future<bool> setTemporaryQuote(List<String> tempQuote) async 
    => await preferences().then(
      (prefs) => prefs.setStringList(tempQuoteString, tempQuote)
    );


  Future<List<String>?> getTemporaryQuote() async 
    => await preferences().then(
      (prefs) => prefs.getStringList(tempQuoteString)
    );
 

  Future<bool> _setNumberOfSavedQuotes(int numberOfQuotes) async 
    => await preferences().then(
      (prefs) => prefs.setInt(lengthOfQuotes, numberOfQuotes)
    );


  Future<int?> _getNumberOfSavedQuotes() async 
    => await preferences().then(
      (prefs) => prefs.getInt(lengthOfQuotes)
    );


  Future<bool> setQuoteItem(List<String> quoteList) async 
    => await preferences().then(
      (prefs) async{
        final numberOfQuotes = await _getNumberOfSavedQuotes() ?? 0;
        final newNumberOfQuotes = numberOfQuotes + 1;
        quoteList.add(newNumberOfQuotes.toString());
        await prefs.setStringList(newNumberOfQuotes.toString(), quoteList);
        await _setNumberOfSavedQuotes(newNumberOfQuotes);
        return true;
      }
    );


  Future<Iterable<List<String>?>> getQuoteItems() async 
    => await preferences().then(
      (prefs) async{
        final numberOfSavedQuotes = await _getNumberOfSavedQuotes() ?? 0;
        final savedQuotes = Iterable.generate(
          numberOfSavedQuotes, 
          (index) => prefs.getStringList((index+1).toString())
        )
        .where((quote) => quote != null);
        return savedQuotes;
      }
    );


    Future<bool> deleteQuote(String keyToDelete) async => 
      await preferences().then(
        (prefs) => prefs.remove(keyToDelete)
      );
}