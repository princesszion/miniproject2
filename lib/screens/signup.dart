// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:miniproject2/screens/auth_service.dart';
//
// class SignupPage extends StatefulWidget {
//   @override
//   _SignupPageState createState() => _SignupPageState();
// }
//
// class _SignupPageState extends State<SignupPage> {
//   final AuthService _authService = AuthService();
//   final _formKey = GlobalKey<FormState>();
//   String _email = '';
//   String _password = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sign up'),
//       ),
//       body: Container(
//         padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               SizedBox(height: 20),
//               Text('Email'),
//               TextFormField(
//                 validator: (val) => val?.isEmpty ?? true ? 'Enter an email' : null,
//                 onChanged: (val) {
//                   setState(() {
//                     _email = val;
//                   });
//                 },
//               ),
//               SizedBox(height: 20),
//               Text('Password'),
//               TextFormField(
//                 obscureText: true,
//                 validator: (val) => (val?.length ?? 0) < 6 ? 'Enter a password 6+ chars long' : null,
//                 //validator: (val) => val?.length ?? 0 < 6 ? 'Enter a password 6+ chars long' : null,
//                 onChanged: (val) {
//                   setState(() {
//                     _password = val;
//                   });
//                 },
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 child: Text('Sign up'),
//                 onPressed: () async {
//                   if (_formKey.currentState?.validate() ?? false) {
//                     UserCredential result = await _authService.createUserWithEmailAndPassword(_email, _password);
//                     if (result == null) {
//                       // TODO: Handle sign up error
//                     }
//                   }
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }






import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:miniproject2/screens/auth_service.dart';
import 'package:miniproject2/main.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:miniproject2/reuseable_widgets/reusable_widgets.dart';

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
                            builder: (context) => MyApp(),
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
