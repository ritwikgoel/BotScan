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
          appBar: AppBar(
            title: const Text("Bionic Rreader"),
          ),
          body: Center(
            child: Column(),
          )),
    );
  }
}
