import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int days = 30;
    String name = "Codepur ";
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // if we want to change the background color to white, the drawer icon goes invisible, for that change iconTheme and make icon's color not white
          title: const Text(
            "Catalog App",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Text('Welcome to $days days of flutter by $name'),
        ),
        drawer: const MyDrawer(),
      ),
    );
  }
}
