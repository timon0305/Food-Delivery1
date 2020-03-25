class Address {
  String id;
  String description;
  String address;
  String latitude;
  String longitude;
  bool isDefault;
  String userId;

  Address();

  Address.fromJSON(Map<String, dynamic> jsonMap) {
    id = jsonMap['id'].toString();
    description = jsonMap['description'] != null ? jsonMap['description'].toString() : '';
    address = jsonMap['address'] != null ? jsonMap['address'].toString() : '';
    latitude = jsonMap['latitude'].toString();
    longitude = jsonMap['longitude'].toString();
    isDefault = jsonMap['is_default'] ?? false;
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["description"] = description;
    map["address"] = address;
    map["latitude"] = latitude;
    map["longitude"] = longitude;
    map["is_default"] = isDefault;
    map["user_id"] = userId;
    return map;
  }
}
