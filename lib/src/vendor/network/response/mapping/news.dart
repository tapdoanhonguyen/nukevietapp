

import 'package:nukeviet/src/modules/base_item.dart';

class News implements BaseItem {
  News({
    this.id,
    this.code,
    this.name,
    this.parentID = -1,
  });

  int id, parentID;
  String code;
  String name;

  factory News.fromJson(Map<String, dynamic> json) => News(
    id: json["id"],
    code: json["quocGiaMa"],
    name: json["quocGiaTen"],
  );

  static List<News> listFromJson(dynamic data) =>
      List<News>.from(data.map((x) => News.fromJson(x)));
}
