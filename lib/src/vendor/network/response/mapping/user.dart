import 'dart:math';

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
    this.goldadmin,
    this.sadmin,
    this.admin,
    this.users,
    this.role,
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
  int  goldadmin;
  int  sadmin;
  int  admin;
  int  users;
  int role = 0;

  NRoles get nRole {
    switch (role) {
      case 1: return NRoles.ADMIN;
      case 2: return NRoles.SADMIN;
      case 3: return NRoles.GOLDADMIN;
      default: return NRoles.USER;
    }
  }

  String get roleName {
    return nRole.toString().split('.').last;
  }
  factory User.fromJson(Map<String, dynamic> json) {
    var user = User(
        id: json["message"]["userid"],
        username: json["message"]["username"],
        first_name: json["message"]["first_name"],
        gender: json["message"]["gender"],
        photo: json["message"]["photo"],
        email: json["message"]["email"],
        birthday: json["message"]["birthday"],
        active: json["message"]["active"],
        last_name: json["message"]["last_name"],
        goldadmin: json["message"]["goldadmin"],
        sadmin: json["message"]["sadmin"],
        admin: json["message"]["admin"],
        users: json["message"]["users"],
      role: json["message"]["role"]
    );

    return user;
  }
}



enum NRoles {
  USER,
  ADMIN,
  SADMIN,
  GOLDADMIN,
}