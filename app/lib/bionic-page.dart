import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:app/tts-page.dart';
import 'package:speech_to_text/speech_to_text.dart';


class bionicpage extends StatelessWidget {
  const bionicpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          
          body: Center(
            child: 
            Container(
              height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.green, Colors.blue])),
            )
          )),
    );
  }
}
