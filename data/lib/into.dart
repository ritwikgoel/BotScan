import 'package:data/img-sel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:data/tts-page.dart';
import 'package:data/pictotext.dart';
import 'package:lottie/lottie.dart';

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
            height: MediaQuery.of(context).size.height / 7,
          ),
          Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Lottie.network(
                "https://assets2.lottiefiles.com/packages/lf20_kqacgm7o.json"),
          )),
          SizedBox(
            height: MediaQuery.of(context).size.height / 10,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/home");
            },
            child: Text(
              'Get Started!',
              style: new TextStyle(
                  fontSize: 20, color: Color.fromARGB(255, 168, 168, 168)),
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
