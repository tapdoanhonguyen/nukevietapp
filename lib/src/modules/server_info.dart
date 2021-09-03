class ServerInfo {
  String title, desc, baseUrl, logoBanner, domainurl, protocol, apikey, apisec, module, action;

  ServerInfo({
    this.title,
    this.desc,
    this.baseUrl,
    this.protocol,
    this.domainurl,
    this.logoBanner,
    this.apikey,
    this.apisec,
    this.module,
    this.action,
  });
  static List<ServerInfo> all = [nukeviet];
  static ServerInfo nukeviet = ServerInfo(
      title: r'nukeviet.vn',
      desc: r'NUKEVIET CMS',
      baseUrl: r'hcm.nukeviet.vn/api.php',
      domainurl: r'https://hcm.nukeviet.vn',
      protocol: 'https',
      logoBanner: r'https://nukeviet.vn/uploads/logo.png',
      apikey: r'd7MQ2iU30Ixx2ym49hpa232P8d69GQKp',
      apisec: r'a2fOf6Wco2m4FrX4J0g5JLy3pMUn1cMf',
      module: r'',
      action: r'');
}
