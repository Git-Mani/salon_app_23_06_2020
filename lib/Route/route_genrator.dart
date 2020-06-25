import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:saloonapp23062020/Screen/HomeScreen.dart';
import 'package:saloonapp23062020/Screen/LoginScreen.dart';
import 'package:saloonapp23062020/Screen/Registration.dart';
import 'package:saloonapp23062020/main.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;


   // print("**"+ settings.arguments +"**");


    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/registration':
      // Validation of correct data type

          return MaterialPageRoute(
            builder: (_) => RegistrationScreen(),
          );
      case '/homescreen':
        FirebaseUser args2=args;
        return MaterialPageRoute(
          builder: (_) => HomeScreen(
            name: args2.displayName,
            imageUrl: args2.photoUrl,
          ),
        );

        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
        return _errorRoute();
      default:
      // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}