import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:signin_signup/screens/signin.dart';

import '../utils/color.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Center(
              child: ElevatedButton(
            child: Text(
              "Sign Out",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              FirebaseAuth.instance.signOut().then((value) {
                print("Signed out");
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => signin()));
              });
            },
          ))
        ],
      ),
    );
  }
}
