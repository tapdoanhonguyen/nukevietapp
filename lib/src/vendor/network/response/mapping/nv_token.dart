class NVToken {
  NVToken({
    this.accessToken,
    this.expiresIn,
    this.roleName,
    this.tokenType,
    this.userId,
  });

  String accessToken;
  int expiresIn;
  String roleName;
  String tokenType;
  int userId;

  factory NVToken.fromJson(Map<String, dynamic> json) => NVToken(
    accessToken: json['message']["access_token"],
    expiresIn: json['message']["expires_in"],
    roleName: json['message']["role_name"],
    tokenType: json['message']["token_type"],
    userId: json['message']["userid"],
  );
}
