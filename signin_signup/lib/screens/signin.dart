import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
// ignore: unused_import, implementation_imports
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:signin_signup/screens/home.dart';
import 'package:signin_signup/screens/signup.dart';
import '../reuseable_widgets/reusable_widgets.dart';
import '../utils/color.dart';

class signin extends StatefulWidget {
  const signin({Key? key}) : super(key: key);

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        color: (hexstringtocolor("6B168D")),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              95, MediaQuery.of(context).size.height * 0.2, 95, 320),
          child: Column(
            children: <Widget>[
              logoWidget("assets/images/Wordsworth-removebg-preview.png"),
              Text("WORDSWORTH",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      letterSpacing: 2,
                      color: (hexstringtocolor("F1BD02")),
                      fontFamily: 'SedgwickAve')),
              SizedBox(
                height: 30,
              ),
              reuseabletextfeild("Enter Email Adress.", Icons.person_outline,
                  false, _emailTextController),
              SizedBox(height: 20),
              reuseabletextfeild("Enter Pasword", Icons.lock_outline, true,
                  _passwordTextController),
              SizedBox(height: 20),
              signinsignupbutton(context, true, () {
                FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text)
                    .then((value) {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => home()));
                }).onError((error, stackTrace) {
                  print("Error ${error.toString()}");
                });
              }),
              signupoption()
            ],
          ),
        ),
      ),
    ));
  }

  Row signupoption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => signup()));
          },
          child: const Text(" Sign Up",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        )
      ],
    );
  }
}
