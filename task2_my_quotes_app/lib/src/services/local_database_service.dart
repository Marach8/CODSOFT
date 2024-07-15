import 'package:shared_preferences/shared_preferences.dart';
import 'package:task2_my_quotes_app/src/utils/strings.dart';

class LocalDatabaseService{
  LocalDatabaseService._sharedInstance(); 
  static final LocalDatabaseService _shared = LocalDatabaseService._sharedInstance();
  factory LocalDatabaseService() => _shared;


  Future<SharedPreferences> getPreference() async
    => await SharedPreferences.getInstance();

  Future<bool> setTemporaryQuote(List<String> tempQuote) async 
    => await getPreference().then(
      (prefs) => prefs.setStringList(tempQuoteKey, tempQuote)
    );


  Future<List<String>?> getTemporaryQuote() async 
    => await getPreference().then(
      (prefs) => prefs.getStringList(tempQuoteKey)
    );
 

  Future<bool> _setNumberOfSavedQuotes(int numberOfQuotes) async 
    => await getPreference().then(
      (prefs) => prefs.setInt(lengthOfQuotes, numberOfQuotes)
    );


  Future<int?> _getNumberOfSavedQuotes() async 
    => await getPreference().then(
      (prefs) => prefs.getInt(lengthOfQuotes)
    );


  Future<bool> setQuoteItem(List<String> quoteList) async 
    => await getPreference().then(
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
    => await getPreference().then(
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
      await getPreference().then(
        (prefs) => prefs.remove(keyToDelete)
      );
}