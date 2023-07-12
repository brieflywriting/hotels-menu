// ignore_for_file: unused_field

/*
This is documentation on class HotelModel. 
This class is used to store data about singular hotel.
*/
class HotelModel {
///Hotel characteristics
  //string fields
  final String _fullUrl;
  final String _url;
  final String _id;
  final String _name;
  final String _address;

  //int fields
  final int _maxPrice;
  final int _maxPricePerNight;
  final int _price;
  final int _minPriceTotal;
  final int _photoCount;

  //double fields                         //could have grouped them by their meaning, but at this moment it just works.
  final double _distance;
  final double _guestScore;
  final double _stars;

  //complex type fields
  Map<String, double> location;      /*struct location with lat/lon. From what I saw in RAW data, 
                                      lat/lon can both have above 50 digits after the floating point. 
                                      I would import decimal or some other thing, but it is not stated in the task provided.*/

  final List<int> _photoId;
  final List<dynamic> _amenities;

//constructor for the class
  HotelModel(
      this._fullUrl,
      this._maxPrice,
      this._maxPricePerNight,
      this._price,
      this._minPriceTotal,
      this._photoCount,
      this._guestScore,
      this._id,
      this._name,
      this._address,
      this._distance,
      this._amenities,
      this.location,
      this._stars,
      this._photoId,
      this._url);

//getters and setters
  int get getMaxPricePerNight => _maxPricePerNight;
  int get getFirstPhotoById => _photoId[0];
  List<int> get getPhotoId => _photoId;
  String get getName => _name;
  double get getStars=>_stars;
  List<dynamic> get getAmenities =>_amenities;
  String get getAddress =>_address;
  double get getGuestRating=>_guestScore;
}
