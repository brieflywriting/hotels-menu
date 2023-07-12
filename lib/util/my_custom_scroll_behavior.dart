import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/*
This is Scroll Behavior widget. 
It is used to make the row of [HotelFilterChip]s to be dragged by mouse
*/

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      
      };
}