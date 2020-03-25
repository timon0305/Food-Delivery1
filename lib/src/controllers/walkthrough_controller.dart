import 'package:mvc_pattern/mvc_pattern.dart';

import '../models/restaurant.dart';

class WalkthroughController extends ControllerMVC {
  List<Restaurant> topRestaurants = <Restaurant>[];

  WalkthroughController() {
    //listenForTopRestaurants();
  }
//  void listenForTopRestaurants() async {
//    LocationData _locationData = await getCurrentLocation();
//    final Stream<Restaurant> stream = await getNearRestaurants(_locationData, _locationData);
//    stream.listen((Restaurant _restaurant) {
//      setState(() => topRestaurants.add(_restaurant));
//    }, onError: (a) {}, onDone: () {});
//  }
}
