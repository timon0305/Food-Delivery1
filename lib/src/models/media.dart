class Media {
  String id;
  String name;
  String url;
  String thumb;
  String icon;
  String size;

  Media();

  Media.fromJSON(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'].toString(),
        name = jsonMap['name'],
        url = jsonMap['url'],
        thumb = jsonMap['thumb'],
        icon = jsonMap['icon'],
        size = jsonMap['formated_size'];
}
