import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FlutterTts flutterTts = FlutterTts();
    speak() async {
      await flutterTts.speak("Testing 123");
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("TTS"),
        ),
        body: Container(
          child: Center(
            child: Container(
              child: RaisedButton(
                child: Text(
                  'Click me for a surprise',
                ),
                onPressed: () {
                  speak();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
