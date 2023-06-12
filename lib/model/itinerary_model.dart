class Itinerary {
  String day;
  Place place;

  Itinerary({
    required this.day,
    required this.place,
  });
}

class Place {
  final String name;
  final String details;

  Place({
    required this.name,
    required this.details,
  });
}
