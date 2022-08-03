import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class bionicview extends StatelessWidget {
  const bionicview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    String printvartemp = arguments['text'].toString();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 10),
            Text(
              "$printvartemp",
            )
          ],
        ),
      ),
    );
  }
}
