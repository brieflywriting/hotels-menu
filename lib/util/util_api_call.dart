import 'dart:convert';
import 'dart:io';

import 'package:flutter_application_1/models/models_hotel.dart';
import 'package:http/http.dart' as http;

/*
This is class HotelsData.
This class is used to store information about all hotels and to make a GET request to server to receive them.
*/
class HotelsData {
  //list of all hotels
  static final List<HotelModel> _hotelModelList = [];
  //predefined server URL. In production, API keys should be generated and provided from the server from a diffent class.
  static const String _apiHotelUrl =
      "https://k106555.hostde21.fornex.host/v1/test_api.php?key=getHotels&apiKey=RoCyGPs9ocF92neCHnGcAOMvpnLo2ol6";
  static const String _apiKey="RoCyGPs9ocF92neCHnGcAOMvpnLo2ol6";
  //a method to make a GET request to the server specified in [apiHotelUrl]. I would have used headers, but I didn't get them to work: I need to know specifications of the server.
  static Future getHotelsFuture() async {
    return http.get(Uri.parse(_apiHotelUrl)).then((response) {
      //if status code of the response is equal to 200 and that internal status of data is "true", then proceed with retrieval of data
      if ((response.statusCode ~/ 100) == 2&&jsonDecode(response.body )["status"]as bool) {

        //the data recieved needs to be decoded from json format
        List<dynamic> jsonHotels = jsonDecode(response.body)["data"]["result"];

        //in a cycle, map all values from each instance of json-decoded data to values of [HotelModel] object and add the latter to [_hotelModelList]
        for (var hotel in jsonHotels) {
          _hotelModelList.add(HotelModel(
              hotel["fullUrl"],
              hotel["maxPrice"],
              hotel["maxPricePerNight"],
              hotel["price"],
              hotel["minPriceTotal"],
              hotel["photoCount"],
              hotel["guestScore"],
              hotel["id"].toString(),
              hotel["name"].toString().replaceAll("\n",
                  " "), //truncate the name and address to have it without line breaks
              hotel["address"].toString().replaceAll("\n",
                  " "),
              hotel["distance"],
              hotel["amenitieDB"],
              Map.from(hotel[
                  "location"]), //[hotel["location"]] is a _JsonMap object with several fields. It is decoded to Map.
              hotel["stars"],
              List<int>.from(hotel["photoId"]
                  as List), //[hotel["photoId"]] is a List<dynamic>. It is upcasted to List<Int>.
              hotel["url"]));
        }
      }
      else throw Exception(); //this is a placeholder exception
    });
  }

  //getter for the list of all hotels
  static List<HotelModel> get getHotelList => _hotelModelList;
}
