import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task2_my_quotes_app/src/services/database_service.dart';

void main(){

  setUpAll((){
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
  });

  group('Tests for Local Database Functions', () {
    test(
      'Check if getPreference actually returns SharedPrefence type', () async{
        final db = LocalDatabase();
        final result = await db.getPreference();
        expect(result, isA<SharedPreferences>());
      }
    );

    test(
      'Test if temporary quote is being set', () async{
        final db = LocalDatabase();
        final result = await db.setTemporaryQuote(['Daniel', 'Emmanuel']);
        expect(result, true);
      }
    );

    test(
      'Test if temporary quote can be retrieved', () async{
        final db = LocalDatabase();
        final result = await db.getTemporaryQuote();
        expect(result, isA<List<String>?>());
      }
    );

    test(
      'Check If a quote item is being set', () async{
        final db = LocalDatabase();
        final result = await db.setQuoteItem(['Daniel', 'Emmanuel']);
        expect(result, true);
      }
    );

    test(
      'Check If a quotes can be retrieved', () async{
        final db = LocalDatabase();
        final result = await db.getQuoteItems();
        expect(result, isA<Iterable<List<String>?>>());
      }
    );

    test(
      'Check If a quote item can be deleted', () async{
        final db = LocalDatabase();
        final result = await db.deleteQuote('1');
        expect(result, isA<bool>());
      }
    );
  });
}