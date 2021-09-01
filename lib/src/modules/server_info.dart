class ServerInfo {
  String title, desc, baseUrl, logoBanner;

  ServerInfo({
    this.title,
    this.desc,
    this.baseUrl,
    this.logoBanner,
  });

  static ServerInfo nukeviet = ServerInfo(
      title: r'nukeviet.vn',
      desc: r'CMS Nukeviet',
      baseUrl: r'https://nukeviet.vn/api.php',
      logoBanner: r'https://nukeviet.vn/uploads/logo.png');
}
