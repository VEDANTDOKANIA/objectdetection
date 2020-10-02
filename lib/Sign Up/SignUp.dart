import 'package:flutter/material.dart';
import 'package:objectdetection/Sign%20Up/OurSignUpForm.dart';

class OurSignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(20.0),
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      BackButton(),
                    ],
                  ),
                  SizedBox(height: 190),
                  OurSignUpForm(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
