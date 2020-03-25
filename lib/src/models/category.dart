class Category {
  String id;
  String name;
  String image;

  Category();

  Category.fromJSON(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'].toString(),
        name = jsonMap['name'],
        image = jsonMap['media'][0]['url'];
}
