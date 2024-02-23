import 'package:shared_preferences/shared_preferences.dart';
import 'package:task2_my_quotes_app/src/utils/strings.dart';

class LocalDatabase{
  LocalDatabase._sharedInstance(); 
  static final LocalDatabase _shared = LocalDatabase._sharedInstance();
  factory LocalDatabase() => _shared;


  Future<SharedPreferences> preferences() async
    => await SharedPreferences.getInstance();

  Future<bool> setTemporaryQuote(String tempQuote) async 
    => await preferences().then(
      (prefs) => prefs.setString(tempQuoteString, tempQuote)
    );


  Future<String?> getTemporaryQuote() async 
    => await preferences().then(
      (prefs) => prefs.getString(tempQuoteString)
    );
 

  Future<bool> setNumberOfSavedQuotes(int numberOfQuotes) async 
    => await preferences().then(
      (prefs) => prefs.setInt(lengthOfQuotes, numberOfQuotes)
    );


  Future<int?> getNumberOfSavedQuotes() async 
    => await preferences().then(
      (prefs) => prefs.getInt(lengthOfQuotes)
    );


  Future<bool> setQuoteItem(String quoteItem) async 
    => await preferences().then(
      (prefs) async{
        final numberOfQuotes = await getNumberOfSavedQuotes() ?? 0;
        final newNumberOfQuotes = numberOfQuotes + 1;
        final quoteList = [quoteItem, newNumberOfQuotes.toString()];
        await prefs.setStringList(newNumberOfQuotes.toString(), quoteList);
        await setNumberOfSavedQuotes(newNumberOfQuotes);
        return true;
      }
    );


  Future<Iterable<List<String>?>> getQuoteItems() async 
    => await preferences().then(
      (prefs) async{
        final currentNumberOfSaveQuotes = await getNumberOfSavedQuotes() ?? 0;
        final savedQuotes = Iterable.generate(
          currentNumberOfSaveQuotes, 
          (index) => prefs.getStringList((index+1).toString())
        )
        .where((quote) => quote != null);
        return savedQuotes;
      }
    );
}