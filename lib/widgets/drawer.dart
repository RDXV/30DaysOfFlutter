import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore_for_file:prefer_const_declarations
class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "https://s3.amazonaws.com/mlg-gamebattles-production/assets/arenas/teams/13/293/037/logo423172393771364601201.png";
    return Drawer(
      // use listview.builder() for many items in a list as that shows only items and renders only those
      // here only 4-5 items in listview

      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                // change colors using decoration: boxdecoration()
                // decoration: BoxDecoration(color: Colors.blue),
                accountEmail: const Text("varunarora@gmail.com"),
                accountName: const Text("Varun"),
                // currentAccountPicture: Image.network(imageUrl),
                // for circular image use CircularAvatar
                // NetworkImage() and AssetImage() are image provider used with backgroundImage which takes ImageProvider whereas
                // Image.asset() and Image.network() are widgets
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                style: TextStyle(
                  color: Colors.white,
                ),
                textScaleFactor: 1.2,
                // changes the scale of the text and is by default 1
              ),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                size: 26,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                style: TextStyle(
                  color: Colors.white,
                ),
                textScaleFactor: 1.2,
                // changes the scale of the text and is by default 1
              ),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text(
                "Email me",
                style: TextStyle(
                  color: Colors.white,
                ),
                textScaleFactor: 1.2,
                // changes the scale of the text and is by default 1
              ),
            )
          ],
        ),
      ),
    );
  }
}
