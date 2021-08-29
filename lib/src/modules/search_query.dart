// cmtcccd=&nhomdoituong=&ngaydangki=&hovaten=&diabancosoid=
// &cosoytema=&tinhtrangdangky=0&kiemtratrung=&page=0&size=50
class SearchQuery {
  SearchQuery({
    this.cmtcccd = '',
    this.ngaydangki = '',
    this.hovaten = '',
    this.kiemtratrung = '',
    this.nhomdoituong = '',
    this.cosoytema = '',
    this.diabancosoid = '',
    this.tinhtrangdangky = '',
    this.page = 0,
    this.size = 50,
  });

  String cmtcccd, nhomdoituong, ngaydangki, hovaten, diabancosoid;
  String cosoytema, tinhtrangdangky, kiemtratrung;
  int page, size;

  Map<String, dynamic> toJson() => {
    r"cmtcccd": cmtcccd,
    r"ngaydangki": ngaydangki,
    r"hovaten": hovaten,
    r"kiemtratrung": kiemtratrung,
    r"nhomdoituong": nhomdoituong,
    r"cosoytema": cosoytema,
    r"diabancosoid": diabancosoid,
    r"tinhtrangdangky": tinhtrangdangky,
    "page": page,
    "size": size,
  };
}
