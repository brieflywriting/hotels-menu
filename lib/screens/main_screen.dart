import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/models_amenities.dart';
import 'package:flutter_application_1/util/util_api_call.dart';
import 'package:flutter_application_1/widgets/hotel_filter_chip.dart';
import 'package:flutter_application_1/widgets/widgets_hotel_card.dart';


/*
This is main screen widget. It consists of a header and a list of hotels.
It is a Stateful Widget.
 */
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

// check this page
class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    //Future Builder waits until its [future] is completed and acts upon it with a snapshot
    return FutureBuilder(
        future: HotelsData.getHotelsFuture(),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          return Scaffold(
              backgroundColor: Colors.white,
              body: Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18, top: 18),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 1,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                          child: Text(
                              "Add place to live in Almaty, \nKazahkstan",      //this is header
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                        ),
                        const Text("date-date, some nights"),
                        SingleChildScrollView(                                  //this is a scrollable row of filters(not included in this version of the app)
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.only(top: 8, bottom: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                for (var i in AmenityAssigner.allAmenities)
                                  HotelFilterChip(i)
                              ],
                            )),
                        Expanded(
                          flex: 8,
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.8,
                            child: snapshot.connectionState ==                  //this is a widget that reacts on whether data is loaded correctly
                                    ConnectionState.waiting
                                ? snapshot.hasError
                                    ? const Center(
                                        child: Text(
                                            "There was an error. \n Please, reload the app."))    //if there is an error in loading the data, app will show it
                                    : const Center(child: CircularProgressIndicator())            //if the app is waiting for data, it will show a circle progress indicator
                                : snapshot.hasError
                                    ? const Center(
                                        child: Text(
                                            "There was an error. \n Please, reload the app."))
                                    : ListView.builder(
                                        itemBuilder: (context, index) {
                                        return HotelCard(
                                            HotelsData.getHotelList[index]);                      //list of hotels
                                      }),
                          ),
                        ),

                        // ListView.builder(itemBuilder: (context, index) {return hotelCard();})
                      ]),
                ),
              ));
        });
  }
}
