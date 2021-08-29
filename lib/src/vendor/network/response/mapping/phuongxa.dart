

import 'package:nukeviet/src/modules/base_item.dart';

class PhuongXa implements BaseItem {
  PhuongXa({
    this.id,
    this.code,
    this.name,
    this.parentID,
  });

  int id;
  String code;
  String name;
  int parentID;

  factory PhuongXa.fromJson(Map<String, dynamic> json) => PhuongXa(
    id: json["id"],
    code: json["phuongXaMa"],
    name: json["phuongXaTen"],
    parentID: json["quanHuyenID"],
  );

  static List<PhuongXa> listFromJson(dynamic data) =>
      List<PhuongXa>.from(data.map((x) => PhuongXa.fromJson(x)));
}