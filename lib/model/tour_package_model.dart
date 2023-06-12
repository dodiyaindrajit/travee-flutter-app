import 'package:travee/model/itinerary_model.dart';
import 'transport_model.dart';

class Package {
  String name;
  String photo;
  String price;
  String duration; // like 7 Days, 6 Nights
  Transport transport;
  String fromDate;
  String toDate;
  String included; // like meals, flight, Accommodations, activities,
  List<Itinerary> itinerary; //A detailed schedule of the trip, including dates, times, and locations

  Package({
    required this.name,
    required this.photo,
    required this.price,
    required this.duration,
    required this.transport,
    required this.fromDate,
    required this.toDate,
    required this.included,
    required this.itinerary,
  });
}
