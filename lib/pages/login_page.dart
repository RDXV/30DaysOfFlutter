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
  final _formKey = GlobalKey<FormState>();
  // We need form key for validation of input in TextFormField. Also, formKey is a GlobalKey with FormState as the State of the Forms widget
  bool changeButton = false;

  moveToHome(BuildContext context) async {
    // This validate will see the validators in every FormField
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(milliseconds: 900));
      // This async and await are important for the animation to show and work otherwise animation wouldn't work
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      // We await the Navigator.push() and then changeButton is made false in setstate
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      // For small screens, make the things scrollable so that things don't go outside the screen
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Image.asset(
                "assets/images/hey_login.png",
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
                    // TextFormField() is useful than TextField() because we can use forms in which they are grouped. First wrap the Column() with Form()
                    // because we want this as a form entry for the username and password
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter username',
                        labelText: 'Username',
                      ),
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                      // TextFormField() gives us validator: which allows us to validate the field
                      // This value is the value user entered in the TextFormField
                      validator: (value) {
                        // The below if condition cannot be null so can't use '?'
                        if (value!.isEmpty) {
                          return "Username cannot be empty";
                          // If value empty(! for non-nullable as for null-safety) then validator returns message else null(where null means OK)
                        }
                        return null;
                        // return null means no validation problem
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Enter password',
                        labelText: 'Password',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password cannot be empty";
                        } else if (value.length < 6) {
                          return "Password length at least 6";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    // GestureDetector does not give feedback(ripple or splash effect) but inkwell gives the feedback animation
                    // Another way to add the ripple effect is to make the parent of InkWell() as Material() and giving it the color rather than
                    // in decoration of AnimatedContainer() and replace the borderRadius() from Container() to Material
                    Material(
                      // If you have ancestor then better give important decoration first to ancestor than child otherwise it may give unliked UI
                      // and overlapped output
                      borderRadius:
                          BorderRadius.circular(changeButton ? 50 : 8),
                      color: Colors.deepPurple,
                      child: InkWell(
                        onTap: () => moveToHome(context),
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
                          // We can instead use shape rather than borderRadius like shape: which can either be rectangle or circle
                          // shape: BoxShape.rectangle or BoxShape.circle or .values(when giving specific values)
                          // Also note that you can use either shape or radius not both as they have contradiction
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
