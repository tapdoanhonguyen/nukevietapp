class User {
  User({
    this.id,
    this.tenDangNhap,
    this.first_name,
    this.gender,
    this.photo,
    this.email,
    this.birthday,
    this.last_name,
    this.active
  });

  int id;
  String tenDangNhap;
  String first_name;
  String gender;
  String photo;
  String email;
  String birthday;
  String last_name;
  int active;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["message"]["userid"],
    tenDangNhap: json["message"]["username"],
    first_name: json["message"]["first_name"],
    gender: json["message"]["gender"],
    photo: json["message"]["photo"],
    email: json["message"]["email"],
    birthday: json["message"]["birthday"],
    active: json["message"]["active"],
    last_name: json["message"]["last_name"]
  );

  Map<String, dynamic> params() => {};
}
