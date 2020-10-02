import 'package:flutter/material.dart';
import 'package:objectdetection/Widgets/OurContainer.dart';

class OurSignUpForm extends StatefulWidget {
  @override
  _OurSignUpFormState createState() => _OurSignUpFormState();
}

class _OurSignUpFormState extends State<OurSignUpForm> {
  TextEditingController _fullnamecontroller = TextEditingController();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  TextEditingController _confirmpasswordcontroller = TextEditingController();

  void _signUpUser(String email, String password, BuildContext context,
      String fullname) async {}

  @override
  Widget build(BuildContext context) {
    return OurContainer(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8.0),
            child: Text(
              "Sign-Up",
              style: TextStyle(
                  color: Theme.of(context).secondaryHeaderColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          TextFormField(
            controller: _fullnamecontroller,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_outline), hintText: "Full Name"),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _emailcontroller,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.alternate_email), hintText: "Email"),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _passwordcontroller,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_outline), hintText: "Password"),
            obscureText: true,
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _confirmpasswordcontroller,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_open),
                hintText: " Confirm Password"),
            obscureText: true,
          ),
          SizedBox(height: 20),
          RaisedButton(
            color: Colors.blueGrey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 80),
              child: Text(
                "Sign-Up",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
            onPressed: () {
              if (_passwordcontroller.text == _confirmpasswordcontroller.text) {
                _signUpUser(_emailcontroller.text, _passwordcontroller.text,
                    context, _fullnamecontroller.text);
              } else {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Password did not matched "),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
