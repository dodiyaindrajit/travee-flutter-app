import 'dart:core';

import 'package:travee/model/tour_package_model.dart';

class TourCategoriesModel {
  final String name;
  final String photo;
  List<Package> packageList;

  TourCategoriesModel({
    required this.name,
    required this.photo,
    required this.packageList,
  });
}

// Transportation: Airfare or ground transportation to/from the destination and for excursions.
// Accommodations: Hotel or lodging arrangements.
// Meals: Some or all meals depending on the package.
// Activities: Sightseeing tours, cultural experiences, and/or adventure activities.
// Tour guide: A guide to provide information and assistance throughout the trip.
// Entrance fees: Admission fees to museums, parks, or other attractions.
// Travel insurance: Optional insurance coverage for unexpected events.
// Itinerary: A detailed schedule of the trip, including dates, times, and locations.
// Other services: Additional services such as visa assistance, airport transfers, or language translation.
