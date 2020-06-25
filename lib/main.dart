import 'package:flutter/material.dart';
import 'Route/route_genrator.dart';

import 'package:saloonapp23062020/Screen/LoginScreen.dart';
import 'package:saloonapp23062020/Screen/HomePage.dart';
import 'package:saloonapp23062020/Screen/HomeScreen.dart';
import 'package:saloonapp23062020/Screen/Registration.dart';
void main() {
  runApp(MaterialApp(


    initialRoute: '/',

    onGenerateRoute: RouteGenerator.generateRoute,
  ));
}
