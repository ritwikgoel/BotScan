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
    TextEditingController nameController = TextEditingController();

    speak() async {
      await flutterTts.speak(nameController.text);
    }


    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("TTS"),
          ),
          body: Center(
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                  ),
                ),
                RaisedButton(
                    onPressed: () {
                      speak();
                    },
                    child: const Text(
                      "Click here for a surprise!",
                    )),
              ],
            ),
          )),
    );
  }
}
