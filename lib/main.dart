import 'package:flutter/material.dart';
import 'package:nkap/colors/colors.dart';
import 'package:nkap/ui/coin.dart';

void main() {
  runApp(Nkap());
}

class Nkap extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(

          primary: NkapColors.primary,
          secondary: NkapColors.secondary,
        ),
      ),
      home: Coin(),
    );
  }
}


