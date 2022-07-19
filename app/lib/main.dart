import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:app/tts-page.dart';
import 'package:app/bionic-page.dart';
import 'package:app/stt-page.dart';
import 'package:speech_to_text/speech_to_text.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    routes: {
      '/tts': (context) => ttspage(),
      '/stt': (context) => SpeechScreen(),
      '/bionic': (context) => bionicpage(),
    },
  ));
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
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.blue,
          body: Center(
              child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.green, Colors.blue])),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(28.0),
                  child: Text(
                    "Hola!",
                    style: TextStyle(fontSize: 45),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/tts');
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text("TTS"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/stt');
                  },
                   style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius:  BorderRadius.circular(30.0),
                    ),
                  ),
                  child: const Text("Speech to Text"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/bionic');
                  },
                   style: ElevatedButton.styleFrom(
                    shape:  RoundedRectangleBorder(
                      borderRadius:  BorderRadius.circular(30.0),
                    ),
                  ),
                  child: const Text("Bionic text"),
                ),
              ],
            ),
          )),
        ));
  }
}
