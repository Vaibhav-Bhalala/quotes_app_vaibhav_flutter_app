import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotes_app/Quotes_screen.dart';
import 'package:quotes_app/components/utils/globals.dart';
import 'package:quotes_app/views/homepage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: true, colorSchemeSeed: Globals.themecolor),
    routes: {
      '/': (context) => HomePage(),
      'Quote screen': (context) => QuotesScreen(),
    },
  ));
}
