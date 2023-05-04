import 'dart:async';
import 'package:flutter/material.dart';
import 'package:miniproject2/main.dart';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  double _opacity = 0; // initial opacity

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => (MyApp())));
    });

    // add the animation
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1; // set opacity to 1 after 500ms
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(seconds: 1), // animation duration
              curve: Curves.easeInOut, // animation curve
              height: _opacity == 0 ? 0 : 200, // set height based on opacity
              child: Image.asset("assets/images/splash.png"),
            ),
            SizedBox(height: 5),
            Opacity(
              opacity: _opacity, // use opacity for text as well
              child: Text(
                'Welcome to My Book Search App!',
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xFFF7D661),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}