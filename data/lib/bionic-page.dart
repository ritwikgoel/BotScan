// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;

class bionicpage extends StatefulWidget {
  const bionicpage({Key? key}) : super(key: key);

  @override
  State<bionicpage> createState() => _bionicpageState();
}

class _bionicpageState extends State<bionicpage> {
  bionify() async {
    print("working");
    var url = Uri.parse('https://example.com/whatsit/create');
    var response =
        await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    print(await http.read(Uri.parse('https://example.com/foobar.txt')));
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController bionicController = TextEditingController();

    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 5,
                ),
                 Lottie.asset("assets/magnify.json",height: MediaQuery.of(context).size.height / 5,),

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
                              color: Color.fromARGB(255, 51, 72, 135))),
                      primary: Colors.transparent,
                      minimumSize: const Size(200, 75),
                    ),
                    onPressed: () {
                      bionify();
                    },
                    child: const Text(
                      "Bionify!",
                    )),
              ],
            ),
          )),
    );
  }
}
