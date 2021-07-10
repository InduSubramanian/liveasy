import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';

import './screens/homeScreen.dart';
import './screens/mobileScreen.dart';
import './screens/verifyScreen.dart';
import './screens/profileScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
          button: GoogleFonts.montserrat(
            textStyle: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          headline1: GoogleFonts.roboto(
            textStyle: TextStyle(
              color: Color(0xff2E3B62), //Main Black
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          headline2: GoogleFonts.roboto(
            textStyle: TextStyle(
              color: Color(0xff2E3B62), //Main Black
              fontWeight: FontWeight.normal,
              fontSize: 18.0,
            ),
          ),
          headline3: GoogleFonts.roboto(
            textStyle: TextStyle(
              color: Color(0xff6A6C7B), //Grey
              fontWeight: FontWeight.normal,
              fontSize: 12.0,
            ),
          ),
          subtitle1: GoogleFonts.roboto(
            textStyle: TextStyle(
              color: Color(0xff6A6C7B), //Grey
              fontWeight: FontWeight.normal,
              fontSize: 14.0,
            ),
          ),
          subtitle2: GoogleFonts.roboto(
            textStyle: TextStyle(
              color: Color(0xff2E3B62), //Main Black
              fontWeight: FontWeight.normal,
              fontSize: 14.0,
            ),
          ),
          headline4: GoogleFonts.montserrat(
            textStyle: TextStyle(
                color: Color(0xff2E3B62), //Main Black
                fontWeight: FontWeight.w300,
                fontSize: 16),
          ),
          headline5: GoogleFonts.montserrat(
            textStyle: TextStyle(
                color: Color(0xff2E3B62), //Main Black
                fontWeight: FontWeight.normal,
                fontSize: 16),
          ),
          headline6: GoogleFonts.montserrat(
            textStyle: TextStyle(
                color: Color(0xff6A6C7B), //Grey
                fontWeight: FontWeight.normal,
                fontSize: 16),
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      routes: {
        '/MobileScreen': (ctx) => MobileScreen(),
        '/VerifyScreen': (ctx) => VerifyScreen(),
        '/ProfileScreen': (ctx) => ProfileScreen(),
      },
    );
  }
}
