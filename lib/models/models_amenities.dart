// ignore_for_file: unused_field

class AmenityAssigner {


  //several available amenities. I didn't cover all of them because I wanted to showcase the principle the filter is build upon. This class was creating for filtering which I decided to not implement.
 static const List<Amenity> allAmenities=[
    Amenity("131", "Wi-Fi in public areas","General"),
    Amenity("50", "24h.Reception", "General"),
     Amenity("56", "Car parking","Parking"),
     Amenity("29", "Disabled facilities", "General"),
     Amenity("9", "Restaurant", "General"),
     Amenity("14", "Bar", "General"),
     Amenity("40", "Gym/Fitness Centre", "Activities")

  ];
  
}
//constructor for the class
class Amenity {
  final String _id;
  final String _name;
  final String _groupName;
  const Amenity(this._id, this._name, this._groupName);

//getters and setters
  String get getName => _name;
}
 
                      