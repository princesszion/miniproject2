// import 'package:flutter/material.dart';
//
// import 'package:miniproject2/screens/book_search_screen.dart';
// import 'package:miniproject2/screens/settings.dart';
// import 'package:miniproject2/screens/splash_screen.dart';
//
// void main() {
//   runApp(MaterialApp(
//     title: 'My Book Search App',
//     theme: ThemeData(
//       primarySwatch: Colors.purple,
//     ),
//     home: Splash(),
//   ));
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'My Book Search App',
//       theme: ThemeData(
//         primarySwatch: Colors.purple,
//       ),
//       home: MainPage(),
//     );
//   }
// }
//
// class MainPage extends StatefulWidget {
//   @override
//   _MainPageState createState() => _MainPageState();
// }
//
// class _MainPageState extends State<MainPage> {
//   int _currentIndex = 0;
//
//   final List<Widget> _pages = [    HomePage(),    BookSearchScreen(),    Settings(),  ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Book Search App'),
//       ),
//       body: _pages[_currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search),
//             label: 'Search',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: 'Settings',
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           SizedBox(height: 20),
//           Text(
//             'Your One Stop For Book Search ',
//             style: TextStyle(fontSize: 24),
//           ),
//           SizedBox(height: 20),
//           Row(
//             children: [
//               Expanded(
//                 child: Column(
//                   children: [
//                     Image.asset('assets/images/book1.jpg', width: 150),
//                     SizedBox(height: 20),
//                     Text(
//                       'Imerserse Your Mind Into The World Of Literature',
//                       style: TextStyle(fontSize: 18),
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: Column(
//                   children: [
//                     Image.asset('assets/images/book2.jpg', width: 150),
//                     SizedBox(height: 20),
//                     Text(
//                       'Your Favorite Books At Your Fingers',
//                       style: TextStyle(fontSize: 18),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 20),
//           Row(
//             children: [
//               Expanded(
//                 child: Column(
//                   children: [
//                     Image.asset('assets/images/book3.jpg', width: 150),
//                     SizedBox(height: 20),
//                     Text(
//                       'Take Notes And Jot Down Takeaways From Your Readings',
//                       style: TextStyle(fontSize: 18),
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: Column(
//                   children: [
//                     Image.asset('assets/images/book1.jpg', width: 150),
//                     SizedBox(height: 20),
//                     Text(
//                       'Learning Never Ends So Read On The Goal',
//                       style: TextStyle(fontSize: 18),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';

import 'package:miniproject2/screens/book_search_screen.dart';
import 'package:miniproject2/screens/settings.dart';
import 'package:miniproject2/screens/splash_screen.dart';
import 'package:miniproject2/screens/notification_service.dart';
import 'package:miniproject2/screens/signup.dart';
import 'package:miniproject2/screens/login.dart';
import 'package:miniproject2/screens/home.dart';
import 'package:miniproject2/screens/note_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //await NotificationService.init(); // initialize notification service
  runApp(MaterialApp(
    title: 'My Book Search App',
    theme: ThemeData(
      primarySwatch: Colors.purple,
    ),
    home: Splash(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WORDSWORTH',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const signin(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Future<bool> _onBackPressed() async {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => MainPage()));
    return true;
  }

  int _currentIndex = 0;
  final List<Widget> _pages = [    HomePage(),    BookSearchScreen(),    Settings(),  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          title: Text('WORDSWORTH'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                // Navigate to notification page
              },
            ),
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => home()),
                );
              },
            ),
          ],
        ),
        body: _pages[_currentIndex],
        bottomNavigationBar: Container(
          color: Colors.purple, // set background color here
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20),
          Text(
            'Your One Stop For Book Search ',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Image.asset('assets/images/book1.jpg', width: 150),
                    SizedBox(height: 20),
                    Text(
                      'Imerserse Your Mind Into The World Of Literature',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Image.asset('assets/images/book2.jpg', width: 150),
                    SizedBox(height: 20),
                    Text(
                      'Your Favorite Books At Your Fingers',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Image.asset('assets/images/book3.jpg', width: 150),
                    SizedBox(height: 20),
                    Text(
                      'Take Notes And Jot Down Takeaways From Your Readings',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Image.asset('assets/images/book1.jpg', width: 150),
                    SizedBox(height: 20),
                    Text(
                      'Learning Never Ends So Read On The Goal',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
