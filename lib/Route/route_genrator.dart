import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:saloonapp23062020/Screen/CartPage.dart';
import 'package:saloonapp23062020/Screen/HomeScreen.dart';
import 'package:saloonapp23062020/Screen/LoginScreen.dart';
import 'package:saloonapp23062020/Screen/Registration.dart';
import 'package:saloonapp23062020/Screen/DetailPage.dart';
import 'package:saloonapp23062020/api/Saloon.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    final args2 = settings;

    switch (settings.name) {
      case '/detailPage':
        Salon salon = args2.arguments;

        return MaterialPageRoute(
            builder: (_) => detailList(
                  id: salon.id,
                  serviceMapping: salon.serviceMappings,
                ));
      case '/':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/registration':
        // Validation of correct data type

        return MaterialPageRoute(
          builder: (_) => RegistrationScreen(),
        );
      case '/homescreen':
        if (args is GoogleSignInAccount) {
          GoogleSignInAccount args3 = args;
          return MaterialPageRoute(
            builder: (_) => HomeScreen(
              name: args3.email,
              imageUrl: args3.photoUrl,
            ),
          );
        } else if (args is FirebaseUser) {
          FirebaseUser args2 = args;
          return MaterialPageRoute(
            builder: (_) => HomeScreen(
              name: args2.displayName,
              imageUrl: args2.photoUrl,
            ),
          );
        }
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

