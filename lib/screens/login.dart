// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:auth_service.dart';
//
// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   final AuthService _authService = AuthService();
//   final _formKey = GlobalKey<FormState>();
//   String _email = '';
//   String _password = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login'),
//       ),
//       body: Container(
//         padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               SizedBox(height: 20),
//               TextFormField(
//                 validator: (val) => val.isEmpty ? 'Enter an email' : null,
//                 onChanged: (val) {
//                   setState(() {
//                     _email = val;
//                   });
//                 },
//               ),
//               SizedBox(height: 20),
//               TextFormField(
//                 obscureText: true,
//                 validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
//                 onChanged: (val) {
//                   setState(() {
//                     _password = val;
//                   });
//                 },
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 child: Text('Login'),
//                 onPressed: () async {
//                   if (_formKey.currentState.validate()) {
//                     UserCredential result = await _authService.signInWithEmailAndPassword(_email, _password);
//                     if (result == null) {
//                       // TODO: Handle login error
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



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
// ignore: unused_import, implementation_imports
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:miniproject2/main.dart';
import 'package:miniproject2/screens/home.dart';
import 'package:miniproject2/screens/signup.dart';
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
                  logoWidget("assets/images/splash.png"),
                  Text("WORDSWORTH",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
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
                          context, MaterialPageRoute(builder: (context) => MainPage()));
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
