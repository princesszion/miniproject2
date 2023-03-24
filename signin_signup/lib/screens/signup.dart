import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:signin_signup/reuseable_widgets/reusable_widgets.dart';

import '../utils/color.dart';
import 'home.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: (hexstringtocolor("6B168D")),
        ),
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 20),
                  reuseabletextfeild("Enter UserName", Icons.person_outline,
                      false, _userNameTextController),
                  const SizedBox(height: 20),
                  reuseabletextfeild("Enter Email ID", Icons.person_outline,
                      false, _emailTextController),
                  const SizedBox(height: 20),
                  reuseabletextfeild("Enter Password (>= 6 characters)",
                      Icons.lock_outlined, true, _passwordTextController),
                  const SizedBox(height: 20),
                  signinsignupbutton(context, false, () {
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: _emailTextController.text,
                            password: _passwordTextController.text)
                        .then((value) {
                      print("Created New Account");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => home(),
                          ));
                    }).onError((error, stackTrace) {
                      print("Error ${error.toString()}");
                    });
                  }),
                ],
              )),
        ),
      ),
    );
  }
}
