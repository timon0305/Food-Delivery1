import 'dart:convert';

import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';

import '../helpers/helper.dart';
import '../models/restaurant.dart';
import '../models/review.dart';
import '../models/user.dart';
import '../repository/user_repository.dart';

Future<Stream<Restaurant>> getTopRestaurants() async {
  User _user = await getCurrentUser();
  final String _apiToken = 'api_token=${_user.apiToken}';
  final String url = '${GlobalConfiguration().getString('api_base_url')}restaurants?$_apiToken';

  final client = new http.Client();
  final streamedRest = await client.send(http.Request('get', Uri.parse(url)));

  return streamedRest.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .map((data) => Helper.getData(data))
      .expand((data) => (data as List))
      .map((data) {
    return Restaurant.fromJSON(data);
  });
}

Future<Stream<Restaurant>> getNearRestaurants(LocationData myLocation, LocationData areaLocation) async {
  User _user = await getCurrentUser();
  final String _apiToken = 'api_token=${_user.apiToken}';
  String _nearParams = '';
  String _orderLimitParam = '';
  if (myLocation != null && areaLocation != null) {
    _orderLimitParam = 'orderBy=area&limit=5';
    _nearParams =
        '&myLon=${myLocation.longitude}&myLat=${myLocation.latitude}&areaLon=${areaLocation.longitude}&areaLat=${areaLocation.latitude}';
  }
  final String url =
      '${GlobalConfiguration().getString('api_base_url')}restaurants?$_apiToken$_nearParams&$_orderLimitParam';

  final client = new http.Client();
  final streamedRest = await client.send(http.Request('get', Uri.parse(url)));

  return streamedRest.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .map((data) => Helper.getData(data))
      .expand((data) => (data as List))
      .map((data) {
    return Restaurant.fromJSON(data);
  });
}

Future<Stream<Restaurant>> searchRestaurants(String search, LocationData location) async {
  User _user = await getCurrentUser();
  final String _apiToken = 'api_token=${_user.apiToken}';
  final String _searchParam = 'search=name:$search;description:$search&searchFields=name:like;description:like';
  final String _locationParam =
      'myLon=${location.longitude}&myLat=${location.latitude}&areaLon=${location.longitude}&areaLat=${location.latitude}';
  final String _orderLimitParam = 'orderBy=area&limit=5';
  final String url =
      '${GlobalConfiguration().getString('api_base_url')}restaurants?$_apiToken&$_searchParam&$_locationParam&$_orderLimitParam';

  final client = new http.Client();
  final streamedRest = await client.send(http.Request('get', Uri.parse(url)));

  return streamedRest.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .map((data) => Helper.getData(data))
      .expand((data) => (data as List))
      .map((data) {
    return Restaurant.fromJSON(data);
  });
}

Future<Stream<Restaurant>> getRestaurant(String id) async {
  User _user = await getCurrentUser();
  final String _apiToken = 'api_token=${_user.apiToken}';
  final String url = '${GlobalConfiguration().getString('api_base_url')}restaurants/$id?$_apiToken';

  final client = new http.Client();
  final streamedRest = await client.send(http.Request('get', Uri.parse(url)));

  return streamedRest.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .map((data) => Helper.getData(data))
      .map((data) => Restaurant.fromJSON(data));
}

Future<Stream<Review>> getRestaurantReviews(String id) async {
  User _user = await getCurrentUser();
  final String _apiToken = 'api_token=${_user.apiToken}&';
  final String url =
      '${GlobalConfiguration().getString('api_base_url')}restaurant_reviews?${_apiToken}with=user&search=restaurant_id:$id';

  final client = new http.Client();
  final streamedRest = await client.send(http.Request('get', Uri.parse(url)));

  return streamedRest.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .map((data) => Helper.getData(data))
      .expand((data) => (data as List))
      .map((data) {
    return Review.fromJSON(data);
  });
}

Future<Stream<Review>> getRecentReviews() async {
  User _user = await getCurrentUser();
  final String _apiToken = 'api_token=${_user.apiToken}&';
  final String url =
      '${GlobalConfiguration().getString('api_base_url')}restaurant_reviews?${_apiToken}orderBy=updated_at&sortedBy=desc&limit=3&with=user';

  final client = new http.Client();
  final streamedRest = await client.send(http.Request('get', Uri.parse(url)));

  return streamedRest.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .map((data) => Helper.getData(data))
      .expand((data) => (data as List))
      .map((data) {
    return Review.fromJSON(data);
  });
}
