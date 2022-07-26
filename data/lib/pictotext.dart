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
    print("\n\n testinggggg");
    print(arguments);
    int printvartemp = arguments['text'].toString().length;
    String printvar = arguments['text'].toString().substring(32, printvartemp-16  );
    int counter = 0;
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.green, Colors.blue])),
        child: TextButton(
          onPressed: () {
            //incrementing counter
            setState(() {
              printvar = arguments['text'].toString().substring(32, printvartemp-16);
            });
          },
          child: Text(printvar,style: const TextStyle(color: Colors.black),),
        ),
      ),
    );
  }
}
