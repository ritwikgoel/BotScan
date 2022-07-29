import 'package:data/img-sel.dart';
import 'package:data/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:data/tts-page.dart';
import 'package:data/pictotext.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class intro extends StatefulWidget {
  const intro({Key? key}) : super(key: key);

  @override
  State<intro> createState() => _introState();
}

class _introState extends State<intro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 10,
          ),
          Text(
            "Speecher OCR",
            style: new TextStyle(
                fontSize: 20, color: Color.fromARGB(255, 117, 117, 117)),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 65,
          ),
          Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Lottie.network(
                "https://assets2.lottiefiles.com/packages/lf20_kqacgm7o.json"),
          )),
          SizedBox(
            height: MediaQuery.of(context).size.height / 7,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade, child: MyApp()));
            },
            child: Text(
              'Get Started!',
              style: new TextStyle(
                  fontSize: 20,
                  color: const Color.fromARGB(255, 146, 144, 144)),
            ),
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(14),
                primary: Color.fromARGB(255, 0, 0, 0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(
                        color: Color.fromARGB(255, 51, 72, 135)))),
          )
        ],
      ),
    );
  }
}
