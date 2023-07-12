import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/models_hotel.dart';
import 'package:flutter_application_1/screens/hotel_screen.dart';

/*
This is a widget HotelCard. It represents a card with hotel information.
It is a Stateless widget.
*/
class HotelCard extends StatelessWidget {
  //this is a field with hotel that will be shown on this specific card
  final HotelModel _hotel;

  //constructor for the card
  const HotelCard(this._hotel, {super.key});

//MediaQuery is used to scale the widget with the screen.
  //I wouldn't normally write constants like [0.18] without defining them beforehand,
  //but I have a problem with distribution of resizable widgets, so I decided to keep them as is.

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.18,
      child: GestureDetector(
        //GestureDetector is needed to make this Card transfer user to the page with full hotel information.
        onTap: () => Navigator.pushNamed(context, HotelScreen.routeKey,
            arguments: _hotel),
        child: Card(
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                //this is a widget that shows an image of one of the rooms of the hotel on the card
                height: MediaQuery.of(context).size.height * 0.2,
                padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    "https://photo.hotellook.com/image_v2/crop/${_hotel.getFirstPhotoById}/1200/1200.auto", //scraping for this image is impossible with enabled CORS policy. in launch.json, add necessary arguments or switch to the debug profile.
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return Image.asset(
                          "../../assets/error-garrys-mod.gif"); //this is an image that shows up if you do not disable CORS policy.
                    }, //data provided didn't have any information on the whereabouts of images, so I took the liberty to scrap them with provided photo ids
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Expanded(
                // this is a widget that shows the name of the hotel and three amenities provided by it
                flex: 8,
                child: ListTile(
                    contentPadding: const EdgeInsets.fromLTRB(6, 0, 0, 0),
                    title: Text(
                      // this is a widget that shows the name of the hotel
                      _hotel.getName,
                      style: const TextStyle(
                          fontWeight: FontWeight.w900, fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment
                            .centerLeft, // this is a widget that shows a column of amenities accessible. FittedBox allows scaling.
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              _hotel.getAmenities[0]["name"]
                                  .toString()
                                  .replaceAll("\n", " "),
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            Text(
                                _hotel.getAmenities[1]["name"]
                                    .toString()
                                    .replaceAll("\n", " "),
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600)),
                            Text(
                                _hotel.getAmenities[2]["name"]
                                    .toString()
                                    .replaceAll("\n", " "),
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600))
                          ],
                        ),
                      ),
                    )),
              ),
              Expanded(
                //this is a widget that shows an "add to favorites" button and maximum price per night. I have picked maximum price because I wasn't sure that other fields show price per night.
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Expanded(
                            //this is a widget that shows an "add to favorites" button
                            flex: 1,
                            child: IconButton(
                                onPressed: null,
                                icon: Icon(Icons.star_border))),
                        Expanded(
                          //this is a widget that shows a maximum price per night for this hotel
                          flex: 1,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                                "from \n\$ ${_hotel.getMaxPricePerNight.toString()}",
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 14),
                                textAlign: TextAlign.left),
                          ),
                        ),
                        const Spacer(
                            flex:
                                1), //spacer is used to change the position of the two widgets above
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
