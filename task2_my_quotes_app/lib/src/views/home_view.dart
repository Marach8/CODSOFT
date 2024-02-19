import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              FutureBuilder(
                future: getRandomImage(), 
                builder: (_, snapshot){
                  if(snapshot.connectionState == ConnectionState.done){
                    return Image.memory(snapshot.data);
                  }
                  else{
                    return const CircularProgressIndicator();
                  }
                }
              ),
              const Gap(10),
              ElevatedButton(
                onPressed: () async{
                  await getRandomImage();
                },
                child: const Text('getImage')
              ),
            ],
          ),
        ),
      )
    );
  }
}