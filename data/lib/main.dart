import 'package:data/bionic-page.dart';
import 'package:data/img-sel.dart';
import 'package:data/into.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:data/tts-page.dart';
import 'package:data/pictotext.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(MaterialApp(
    home: intro(),
    routes: {
      '/home': (context) => MyApp(),
      '/tts': (context) => ttspage(),
      '/stt': (context) => get_img(),
      '/bionic': (context) => ttspage(),
      '/pictotext': (context) => pictotext(),
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
          backgroundColor: Colors.black,
          body: Center(
              child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                const SizedBox(
                  height: 60.0,
                  width: 100,
                ),
                const Padding(
                  padding: EdgeInsets.all(28.0),
                  child: Text(
                    "An OCR Text to Speech Converter",
                    style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 112, 118, 109),
                        fontStyle: FontStyle.italic),
                  ),
                ),
                Lottie.network(
                    "https://assets9.lottiefiles.com/packages/lf20_rqepjmsu.json",
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 5),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 10,
                  width: 100,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade, child: ttspage()));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28.0),
                        side: const BorderSide(
                            color: Color.fromARGB(255, 51, 72, 135))),
                    primary: Colors.transparent,
                    minimumSize: const Size(200, 75),
                  ),
                  child: const Text(
                    "Text To Speech",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                  width: 100,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade, child: get_img()));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28.0),
                        side: const BorderSide(
                            color: Color.fromARGB(255, 51, 72, 135))),
                    minimumSize: const Size(200, 75),
                    primary: Colors.transparent,
                  ),
                  child: const Text(
                    "OCR",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                  width: 100,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: bionicpage()));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28.0),
                        side: const BorderSide(
                            color: Color.fromARGB(255, 51, 72, 135))),
                    minimumSize: const Size(200, 75),
                    primary: Colors.transparent,
                  ),
                  child: const Text(
                    "Bionic text",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ],
            ),
          )),
        ));
  }
}
