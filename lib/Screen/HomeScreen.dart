import 'package:flutter/material.dart';
import 'package:saloonapp23062020/Services/googleSignIn.dart';
import 'package:saloonapp23062020/api/saloonList.dart';

class HomeScreen extends StatelessWidget {
  //final FirebaseUser user;
  final name;
  final imageUrl;

  HomeScreen({this.name, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      //this widget handle mobile back button
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: new AppBar(
          backgroundColor: Colors.orangeAccent,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          centerTitle: true,
          title: Text(
            "Saloon",
            style: TextStyle(
              color: Colors.black,
              letterSpacing: 2.0,
              fontSize: 28.0,
            ),
          ),
        ),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Welcome : $name'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                  title: Text('Sign Out'),
                  onTap: () async {
                    await googleSignIn().signOutWithGoogle();
                    Navigator.of(context).pushReplacementNamed('/');
                  }),
            ],
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.red,
          child: Column(
            children: <Widget>[
              ListView(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  //BannerWidgetArea(),
                  SaloonList(),
                ],
              )
            ],
          ),
        ),
      ),
      onWillPop: () => showDialog<bool>(
        context: context,
        builder: (c) => AlertDialog(
          title: Text('Warning'),
          content: Text('Do you really want to exit'),
          actions: [
            FlatButton(
              child: Text('Yes'),
              onPressed: () => Navigator.pop(c, true),
            ),
            FlatButton(
              child: Text('No'),
              onPressed: () => Navigator.pop(c, false),
            ),
          ],
        ),
      ),
    );
  }

}