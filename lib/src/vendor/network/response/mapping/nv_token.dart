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
    accessToken: json["access_token"],
    expiresIn: json["expires_in"],
    roleName: json["role_name"],
    tokenType: json["token_type"],
    userId: json["userid"]
  );
}
