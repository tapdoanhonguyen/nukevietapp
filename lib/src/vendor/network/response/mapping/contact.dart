

import 'package:nukeviet/src/modules/base_item.dart';

class Constact implements BaseItem {
  Constact({
    this.id,
    this.code,
    this.name,
    this.parentID = -1,
  });

  int id, parentID;
  String code;
  String name;

  factory Constact.fromJson(Map<String, dynamic> json) => Constact(
    id: json["id"],
    code: json["quocGiaMa"],
    name: json["quocGiaTen"],
  );

  static List<Constact> listFromJson(dynamic data) =>
      List<Constact>.from(data.map((x) => Constact.fromJson(x)));
}
