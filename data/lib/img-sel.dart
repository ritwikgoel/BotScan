import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class get_img extends StatefulWidget {
  const get_img({Key? key}) : super(key: key);

  @override
  State<get_img> createState() => _get_imgState();
}

class _get_imgState extends State<get_img> {
  final ImagePicker _picker = ImagePicker();
  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(48.0),
        child: Container(
          child: ElevatedButton(onPressed: pickImage, child: const Text("Click here")),
        ),
      ),
    );
  }
}
