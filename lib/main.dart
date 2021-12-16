import 'package:flutter/material.dart';
import 'package:worldclock/pages/choose_location.dart';
import 'package:worldclock/pages/loading.dart';
import 'pages/home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => ScreenLoading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
  ));
}
