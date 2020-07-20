import 'package:flutter/material.dart';
import 'Route/route_genrator.dart';

void main() {
  runApp(MaterialApp(


    initialRoute: '/',

    onGenerateRoute: RouteGenerator.generateRoute,
  ));
}
