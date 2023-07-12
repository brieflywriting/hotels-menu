import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/models_hotel.dart';

/*This is a widget that shows personalized information about a specific hotel. */
class HotelScreen extends StatefulWidget {
  const HotelScreen({super.key});
  static const routeKey = "/hotelScreen";

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  List<String> imagesUrls =
      []; //this is a list of Urls of images. It exists so flutter can scrap those images with [Image.network]

  Color colorGuestRating(double rating) {
    //this is a function for changing the color of guest rating percentage number
    if (rating >= 80) {
      return Colors.green;
    } else if (rating >= 40) {
      return Colors.yellow;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    final searchRequest = ModalRoute.of(context)!
        .settings
        .arguments; //arguments from the [HomeScreen] are transferred to this screen with ModalRoute
    HotelModel currentHotel = searchRequest as HotelModel;
    for (final i in currentHotel.getPhotoId) {
      //this is a cycle that writes in [imagesUrls] all image urls from the predefined link that I found and with the photoId provided in the database
      imagesUrls.add(
          "https://photo.hotellook.com/image_v2/crop/${i.toString()}/1920/1020.auto");
    }
    for (int i = 0; i < imagesUrls.length; i++) {}
    return Scaffold(
      appBar: AppBar(title: Text(currentHotel.getName)),
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: PageView.builder(itemBuilder: (context, pagePosition) {
              return Image.network(imagesUrls[pagePosition], errorBuilder:
                      (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                return const Center(child: FittedBox(fit: BoxFit.scaleDown,child: Text('Scraping of images impossible: CORS policy enabled. This is a created placeholder. If you see this text, you are launching a profile or a release build.')));
              },
                  fit: BoxFit
                      .scaleDown); //this is where it shows the carousel of hotel room pictures. no specification on what rooms are being shown implemented.
            }),
          ),
          ListTile(
            //shows the name of the hotel
            title: Text(
              currentHotel.getName,
              style: const TextStyle(fontSize: 20),
            ),
            subtitle:
                Text(currentHotel.getAddress), //shows the address of the hotel
            trailing: SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Row(
                      children: List.generate(
                          5,
                          (index) => Icon(currentHotel.getStars >
                                  index //shows the rating of the hotel: from 1 to 5 stars. Ratings with floating points not supported.
                              ? Icons.star
                              : Icons.star_border))),
                )),
            titleAlignment: ListTileTitleAlignment.titleHeight,
          ),
          Card(
            //this widget shows the rating that guests gave to the hotel
            margin: const EdgeInsets.all(8),
            elevation: 9,
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text.rich(TextSpan(children: [
                  const TextSpan(
                      text: 'Guest Rating: ',
                      style: TextStyle(
                        fontSize: 18,
                      )),
                  TextSpan(
                      text: '${currentHotel.getGuestRating.toString()}% ',
                      style: TextStyle(
                          fontSize: 18,
                          color:
                              colorGuestRating(currentHotel.getGuestRating))),
                  const TextSpan(
                      text: "of the guests liked this place",
                      style: TextStyle(
                        fontSize: 18,
                      ))
                ]))),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Rooms",
              style: TextStyle(fontSize: 25),
            ),
          ),
          SizedBox(
              //this is a widget that would show specifications of different rooms with pictures and basic information. There is no indication I needed to do this, so I decided to leave a placeholder here.
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height * 0.3,
              child: PageView.builder(itemBuilder: (context, index) {
                return const Card(
                    margin: EdgeInsets.all(9),
                    elevation: 9,
                    child: Center(
                      child: Text(
                          "There will be information about available rooms."),
                    ));
              })),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Amenities",
              style: TextStyle(fontSize: 25),
            ),
          ),
          SizedBox(
            //this is a list of amenities provided by hotel. it can be scrolled horizontally.
            child: Card(
                margin: const EdgeInsets.all(20),
                elevation: 9,
                child: Container(
                  margin: const EdgeInsets.all(8),
                  height: 200,
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              childAspectRatio: 1 / 3.5,
                              mainAxisSpacing: 20),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: currentHotel.getAmenities.length,
                      itemBuilder: (context, i) {
                        return Row(
                          children: [
                            const Icon(Icons.accessibility_new_outlined),
                            Center(
                              child: Text(currentHotel.getAmenities[i]["name"]
                                  .toString()
                                  .replaceAll('\n', " ")),
                            ),
                          ],
                        );
                      }),
                )),
          )
        ],
      ),
    );
  }
}
