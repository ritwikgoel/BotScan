import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ttspage extends StatelessWidget {
  const ttspage({Key? key}) : super(key: key);

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
                    labelText: 'TTS',
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
