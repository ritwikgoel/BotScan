// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;
import 'package:simple_ocr_plugin/simple_ocr_plugin.dart';
import 'api-handler.dart';

class bionicpage extends StatefulWidget {
  const bionicpage({Key? key}) : super(key: key);

  @override
  State<bionicpage> createState() => _bionicpageState();
}

var response;
final TextEditingController bionicController = TextEditingController();

class _bionicpageState extends State<bionicpage> {
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
    Navigator.pushNamed(context, "/bionicview", arguments: {'text': sender});
  }

  Future<void> bionify() async {
    var apikey = apihelper().apikey;
    print(apikey);
    var value = bionicController.text;
    value += "Data: ";
    final url = Uri.parse("https://bionic-reading1.p.rapidapi.com/convert");
    final headers = {
      "content-type": "application/x-www-form-urlencoded",
      "X-RapidAPI-Key": "$apikey",
      "X-RapidAPI-Host": "bionic-reading1.p.rapidapi.com",
      "useQueryString": "true"
    };
    final json = {
      "content": value,
      "response_type": "html",
      "request_type": "html",
      "fixation": "1",
      "saccade": "10"
    };
    response = await post(url, headers: headers, body: json);
    print(response.body);
    print('Status code: ${response.statusCode}');
    Navigator.pushNamed(context, "/bionicview",
        arguments: {'text': response.body});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 5,
                ),
                Lottie.asset(
                  "assets/magnify.json",
                  height: MediaQuery.of(context).size.height / 8,
                ),
                TextField(
                  // ignore: prefer_const_constructors
                  style: TextStyle(color: Colors.white),
                  controller: bionicController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan),
                    ),
                    contentPadding: EdgeInsets.all(30),
                    labelText: 'Enter Text to Bionify!',
                    labelStyle: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 10,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28.0),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 11, 37, 138))),
                      primary: Colors.transparent,
                      minimumSize: const Size(200, 75),
                    ),
                    onPressed: () {
                      bionify();
                    },
                    child: const Text(
                      "Bionify!",
                    )), 
                    SizedBox(height: 40),
                    ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28.0),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 11, 37, 138))),
                      primary: Colors.transparent,
                      minimumSize: const Size(200, 75),
                    ),
                    onPressed: () {
                      pickImage();
                    },
                    child: const Text(
                      "Use OCR!",
                    )),
              ],
            ),
          )),
    );
  }
}
