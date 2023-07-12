import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/hotel_screen.dart';
import 'package:flutter_application_1/screens/main_screen.dart';

import 'util/my_custom_scroll_behavior.dart';

void main() {
  runApp(const HotelsMenu());
}

class HotelsMenu extends StatelessWidget {
  const HotelsMenu({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      title: 'Many Hotels',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: {
        HotelScreen.routeKey: (context) => const HotelScreen()
      }, //a route for the [HotelScreen] that allows transfer from one screen to the other
      home: const MainScreen(),
    );
  }
}
