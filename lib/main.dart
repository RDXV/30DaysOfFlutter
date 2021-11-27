import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/pages/home_page.dart';
import 'package:flutter_catalog/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // You can define only either home: or the "/" route but not both at the same time.
      // darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.roboto().fontFamily,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        // By default the default route is "/" route but if we give initialroute: "/home" then the first page will be the "/home" page and not "/"
      },
      // themeMode: ThemeMode.light,
      // Inorder for themeMode to work you have to provide darkTheme properties
    );
    // We must return any type of app and not simply a container or a widget
  }
}
