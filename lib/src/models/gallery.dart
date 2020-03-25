class Gallery {
  String id;
  String image;
  String description;

  Gallery();

  Gallery.fromJSON(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'].toString(),
        image = jsonMap['media'][0]['url'],
        description = jsonMap['description'];
}
