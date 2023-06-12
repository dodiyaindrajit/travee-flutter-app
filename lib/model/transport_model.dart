class Transport {
  String by; // road, train or plan
  String toSource; // source = pickup point
  String fromDestination; // destination = drop point
  String pickupTime;
  String dropTime;

  Transport({
    required this.by,
    required this.toSource,
    required this.fromDestination,
    required this.pickupTime,
    required this.dropTime,
  });
}
