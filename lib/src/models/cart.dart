import '../models/extra.dart';
import '../models/food.dart';

class Cart {
  String id;
  Food food;
  double quantity;
  List<Extra> extras;
  String userId;

  Cart();

  Cart.fromJSON(Map<String, dynamic> jsonMap) {
    id = jsonMap['id'].toString();
    quantity = jsonMap['quantity'] != null ? jsonMap['quantity'].toDouble() : 0.0;
    food = jsonMap['food'] != null ? Food.fromJSON(jsonMap['food']) : new Food();
    extras = jsonMap['extras'] != null
        ? List.from(jsonMap['extras']).map((element) => Extra.fromJSON(element)).toList()
        : [];
    food.price = getFoodPrice();
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["quantity"] = quantity;
    map["food_id"] = food.id;
    map["user_id"] = userId;
    map["extras"] = extras.map((element) => element.id).toList();
    return map;
  }

  double getFoodPrice() {
    double result = food.price;
    if (extras.isNotEmpty) {
      extras.forEach((Extra extra) {
        result += extra.price != null ? extra.price : 0;
      });
    }
    return result;
  }

  @override
  bool operator ==(dynamic other) {
    return other.id == this.id;
  }
}
