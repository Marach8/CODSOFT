import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle;
import 'package:gap/gap.dart';
import 'package:task2_my_quotes_app/src/functions/get_api.dart';

class QuotesHome extends StatelessWidget {
  const QuotesHome({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.yellow.withOpacity(0.000005)
      ),
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text('My Quotes App'),
        //   centerTitle: true,
        // ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              FutureBuilder(
                future: getRandomImage(), 
                builder: (_, snapshot){
                  if(snapshot.connectionState == ConnectionState.done){
                    return Expanded(
                      child: Image.memory(
                        snapshot.data,
                        height: screenHeight,
                        width: screenWidth,
                        fit: BoxFit.cover
                      )
                    );
                  }
                  else{
                    return const CircularProgressIndicator();
                  }
                }
              ),
              // const Gap(10),
              // ElevatedButton(
              //   onPressed: () async{
              //     await getRandomImage();
              //   },
              //   child: const Text('getImage')
              // ),
            ],
          ),
        )
      ),
    );
  }
}