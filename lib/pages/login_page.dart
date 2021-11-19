import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';

// ignore_for_file:prefer_const_constructors
class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      // For small screens, make the things scrollable so that things don't go outside the screen
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Image.asset(
              "assets/images/secure_login.png",
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Welcome',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter username',
                      labelText: 'Username',
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Enter password',
                      labelText: 'Password',
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print('Hi Varun. login button was pressed');
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    },
                    child: Text('Login'),
                    // style: accepts buttonstyle but instead we use TextButton which extends from ButtonStyleButton .stylefrom() which is ButtonStyle
                    // styleFrom and so this works rather than ButtonStyle
                    style: TextButton.styleFrom(
                      minimumSize: Size(150, 55),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
