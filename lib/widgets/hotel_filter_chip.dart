import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/models_amenities.dart';

class HotelFilterChip extends StatelessWidget {
  final Amenity _currentAmenity;
  const HotelFilterChip( this._currentAmenity, {super.key});
/*
This is a widget that shows a chip for filtering the list of hotels.
*/
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Chip(
          shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.black, width: 0.1),
              borderRadius: BorderRadius.circular(6)),
          // ignore: prefer_const_constructors
          label: Text(_currentAmenity.getName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),),
          backgroundColor: Colors.white),
    );
  }
}
