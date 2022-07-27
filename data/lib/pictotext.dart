import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:simple_ocr_plugin/simple_ocr_plugin.dart';

class pictotext extends StatefulWidget {
  const pictotext({Key? key}) : super(key: key);

  @override
  State<pictotext> createState() => _pictotextState();
}

class _pictotextState extends State<pictotext> {
  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
      double opacityLevel = 1.0;

    double width = MediaQuery.of(context).size.width;
    print("\n\n testinggggg");
    print(arguments);
    int printvartemp = arguments['text'].toString().length;
    String printvar =
        arguments['text'].toString().substring(32, printvartemp - 16);
    int counter = 0;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height / 1.1,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.green, Colors.blue])),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextButton(
                  onPressed: () {
                    //incrementing counter
                    setState(() {
                      printvar = arguments['text']
                          .toString()
                          .substring(32, printvartemp - 16);
                    });
                  },
                  child: SingleChildScrollView(
                    child: Text(
                      printvar,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 100),
            child: Row(
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Try Again!")),
                TextButton(onPressed: () {}, child: const Text("Read it Out!")),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
