import 'package:flutter/material.dart';
import 'package:task2_my_quotes_app/src/functions/get_api.dart';

class QuotesHome extends StatelessWidget {
  const QuotesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Quotes App'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async{
            await getBackroundImage();
          },
          child: const Text('getImage')
        ),
      )
    );
  }
}