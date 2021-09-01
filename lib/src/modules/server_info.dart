class ServerInfo {
  String title, desc, baseUrl, logoBanner, domainurl, apikey, apisec;

  ServerInfo({
    this.title,
    this.desc,
    this.baseUrl,
    this.domainurl,
    this.logoBanner,
    this.apikey,
    this.apisec,
  });

  static ServerInfo nukeviet = ServerInfo(
      title: r'nukeviet.vn',
      desc: r'CMS Nukeviet',
      baseUrl: r'https://hcm.nukeviet.vn/api.php',
      domainurl: r'https://hcm.nukeviet.vn',
      logoBanner: r'https://nukeviet.vn/uploads/logo.png',
      apikey: r'd7MQ2iU30Ixx2ym49hpa232P8d69GQKp',
      apisec: r'a2fOf6Wco2m4FrX4J0g5JLy3pMUn1cMf');
}
