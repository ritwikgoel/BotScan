import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_html/flutter_html.dart';

class bionicocr extends StatelessWidget {
  const bionicocr({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    int printvartemp = arguments['text'].toString().length;
    String printvar =
        arguments['text'].toString().substring(24, printvartemp - 16);
    return Scaffold(
      body: Column(
        children: [
          
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Html(data: printvar),
          ),
        ],
      ),

    );
  }
}
