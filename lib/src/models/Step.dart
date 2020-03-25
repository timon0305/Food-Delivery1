import 'package:google_maps_flutter/google_maps_flutter.dart';

class Step {
  LatLng startLatLng;

  Step({this.startLatLng});

  factory Step.fromJson(Map<String, dynamic> json) {
    print(json["end_location"]["lat"]);
    return new Step(
      startLatLng: new LatLng(json["end_location"]["lat"], json["end_location"]["lng"]),
    );
  }
}
