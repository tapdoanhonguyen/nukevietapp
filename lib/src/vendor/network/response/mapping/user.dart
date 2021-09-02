class User {
  User({
    this.id,
    this.username,
    this.first_name,
    this.gender,
    this.photo,
    this.email,
    this.birthday,
    this.last_name,
    this.active,
    this.quanTriHeThong
  });

  int id;
  String username;
  String first_name;
  int gender;
  String photo;
  String email;
  int birthday;
  String last_name;
  int active;
  int quanTriHeThong;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["message"]["userid"],
      username: json["message"]["username"],
      first_name: json["message"]["first_name"],
      gender: json["message"]["gender"],
      photo: json["message"]["photo"],
      email: json["message"]["email"],
      birthday: json["message"]["birthday"],
      active: json["message"]["active"],
      last_name: json["message"]["last_name"],
      quanTriHeThong: json["message"]["quanTriHeThong"]
  );

  Map<String, dynamic> params() => {};
}
