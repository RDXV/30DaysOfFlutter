import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';

// ignore_for_file:prefer_const_constructors
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
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
              'Welcome $name',
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
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
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
                  // GestureDetector does not give feedback(ripple or splash effect) but inkwell gives the feedback animation
                  InkWell(
                    onTap: () async {
                      setState(() {
                        changeButton = true;
                      });
                      await Future.delayed(Duration(milliseconds: 900));
                      // This async and await are important for the animation to show and work otherwise animation wouldn't work
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    },
                    // Use Ink above Container(which became AnimatedContainer) with color defined inside Ink rather than boxdecoration for ripple effect
                    child: AnimatedContainer(
                      // duration parameter required
                      // curve definition is optional
                      duration: Duration(milliseconds: 700),
                      alignment: Alignment.center,
                      height: 50,
                      width: changeButton ? 50 : 150,
                      child: changeButton
                          ? Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        // We can instead use shape rather than borderRadius like shape: which can either be rectangle or circle
                        // shape: BoxShape.rectangle or BoxShape.circle or .values(when giving specific values)
                        // Also note that you can use either shape or radius not both as they have contradiction
                        borderRadius:
                            BorderRadius.circular(changeButton ? 50 : 8),
                      ),
                    ),
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     print('Hi Varun. login button was pressed');
                  //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                  //   },
                  //   child: Text('Login'),
                  //   // style: accepts buttonstyle but instead we use TextButton which extends from ButtonStyleButton .stylefrom() which is ButtonStyle
                  //   // styleFrom and so this works rather than ButtonStyle
                  //   style: TextButton.styleFrom(
                  //     minimumSize: Size(150, 55),
                  //   ),
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
