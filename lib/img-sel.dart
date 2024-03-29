// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:simple_ocr_plugin/simple_ocr_plugin.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'loading_screen.dart';

class get_img extends StatefulWidget {
  const get_img({Key? key}) : super(key: key);

  @override
  State<get_img> createState() => _get_imgState();
}

class _get_imgState extends State<get_img> {
  final ImagePicker _picker = ImagePicker();
  Future pickImage() async {
    late String sender;
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;

    try {
      String _resultString = await SimpleOcrPlugin.performOCR(image.path);
      sender = _resultString;
      print("OCR results => $_resultString");
    } catch (e) {
      print("exception on OCR operation: ${e.toString()}");
    }
    Navigator.pushNamed(context, "/pictotext", arguments: {'text': sender});
  }

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
   
      return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Lottie.asset("assets/blink.json"),
              TextButton(
                  onPressed: pickImage,
                  child: const Text(
                    "Tap to Scan",
                    style: TextStyle(
                        fontSize: 45,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontStyle: FontStyle.italic),
                  )),
            ],
          ),
        ),
      );
    }
  }

