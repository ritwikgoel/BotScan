import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_html/flutter_html.dart';


class bionicview extends StatelessWidget {
  const bionicview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    String printvartemp = arguments['text'].toString();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 61, 61, 61),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 10),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Html(data: printvartemp),
            ),
          ],
        ),
      ),
    );
  }
}
