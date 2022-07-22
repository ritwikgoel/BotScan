import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:app/tts-page.dart';
import 'package:app/bionic-page.dart';
import 'package:app/stt-page.dart';
import 'package:learning_input_image/learning_input_image.dart';
import 'package:speech_to_text/speech_to_text.dart';


class imgcapture extends StatelessWidget {
  const imgcapture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InputCameraView(
  canSwitchMode: false,
  mode: InputCameraMode.gallery,
  title: 'Text Recognition',
  onImage: (InputImage image) {
    // now we can feed the input image into text recognition process
  },
),
    );
    
  }
}