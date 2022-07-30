import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class bionicpage extends StatelessWidget {
  const bionicpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            children: [
              SizedBox(height:MediaQuery.of(context).size.height/5 ,)
              ,
              Lottie.asset("assets/comingsoon.json"),
              // Container(
              //   height: MediaQuery.of(context).size.height,
              //   width: MediaQuery.of(context).size.width,
              // ),
            ],
          )),
    );
  }
}
