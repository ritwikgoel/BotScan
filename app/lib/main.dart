import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:app/tts-page.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    routes: {
      '/tts': (context) => ttspage(),
      // '/view': (context) => viewer(),
      // '/decider': (context) => finalDecider(),
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
                RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/tts');
                  },
                  child: Text("TTS"),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/tts');
                  },
                  child: const Text("Speech to Text"),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/tts');
                  },
                  child: const Text("Bionic text"),
                ),
              ],
            ),
          )),
        ));
  }
}
