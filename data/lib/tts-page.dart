import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class ttspage extends StatelessWidget {
  const ttspage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FlutterTts flutterTts = FlutterTts();
    TextEditingController nameController = TextEditingController();
 flutterTts.setLanguage("en-AU");

    speak() async {
      await flutterTts.speak(nameController.text);
    }

    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.black,
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 6,
                  ),
                  Lottie.asset("assets/adown.json",
                      height: MediaQuery.of(context).size.height / 7),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      controller: nameController,
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.cyan),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.cyan),
                        ),
                        contentPadding: EdgeInsets.all(30),
                        labelText: 'Text To Speech',
                        labelStyle:
                            TextStyle(fontSize: 35, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28.0),
                            side: const BorderSide(
                                color: Color.fromARGB(255, 51, 72, 135))),
                        primary: Colors.transparent,
                        minimumSize: const Size(200, 75),
                      ),
                      onPressed: () {
                        speak();
                      },
                      child: const Text(
                        "Convert to speech!",
                      )),
                ],
              ),
            ),
          )),
    );
  }
}
