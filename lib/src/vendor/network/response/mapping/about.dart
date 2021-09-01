

import 'package:nukeviet/src/modules/base_item.dart';

class About implements BaseItem {
  About({
    this.id,
    this.code,
    this.name,
    this.parentID = -1,
  });

  int id, parentID;
  String code;
  String name;

  factory About.fromJson(Map<String, dynamic> json) => About(
    id: json["id"],
    code: json["quocGiaMa"],
    name: json["quocGiaTen"],
  );

  static List<About> listFromJson(dynamic data) =>
      List<About>.from(data.map((x) => About.fromJson(x)));
}
