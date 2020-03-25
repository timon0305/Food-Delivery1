import '../models/extra.dart';
import '../models/food.dart';

class Favorite {
  String id;
  Food food;
  List<Extra> extras;
  String userId;

  Favorite();

  Favorite.fromJSON(Map<String, dynamic> jsonMap) {
    id = jsonMap['id'] != null ? jsonMap['id'].toString() : null;
    food = jsonMap['food'] != null ? Food.fromJSON(jsonMap['food']) : null;
    extras = jsonMap['extras'] != null
        ? List.from(jsonMap['extras']).map((element) => Extra.fromJSON(element)).toList()
        : null;
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["food_id"] = food.id;
    map["user_id"] = userId;
    map["extras"] = extras.map((element) => element.id).toList();
    return map;
  }
}
