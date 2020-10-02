import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:objectdetection/Login/OurLoginForm.dart';

class OurLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(20.0),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(80.0),
                    child: Image.asset('lib/assets/final logo.png'),
                  ),
                  SizedBox(height: 100.0),
                  OurLoginForm(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
