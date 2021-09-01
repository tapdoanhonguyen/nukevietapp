class InjectorPaging {
  int total;
  List<NguoiTiemChung> data;

  InjectorPaging({this.total, this.data});

  factory InjectorPaging.fromJson(Map<String, dynamic> json) => InjectorPaging(
    total: json['total'],
    data: NguoiTiemChung.listFromJson(json['data']),
  );
}

class NguoiTiemChung {
  NguoiTiemChung({
    this.id,
    this.hoVaTen,
    this.ngaySinh,
    this.gioiTinh,
    this.cmtcccd,
    this.nhomDoiTuong,
    this.donViCongTac,
    this.soDienThoai,
    this.email,
    this.soTheBhyt,
    this.diaChiNoiO,
    this.tinhThanhMa,
    this.tinhThanhTen,
    this.quanHuyenMa,
    this.quanHuyenTen,
    this.phuongXaMa,
    this.phuongXaTen,
    this.diaBanCoSoId,
    this.coSoYTeMa,
    this.coSoYTeTen,
    this.danTocMa,
    this.quocTichMa,
    this.tienSuDiUng,
    this.cacBenhLyDangMac,
    this.cacThuocDangDung,
    this.ghiChu,
    this.ngayDangKi,
    this.tinhTrangDangKi,
    this.kiemTraTrung,
    this.ketQuaKiemTra,
    this.maQr,
    this.muiTiemChung,
    this.phieuHenTiem,
  });

  int id;
  String hoVaTen;
  String ngaySinh;
  int gioiTinh;
  String cmtcccd;
  int nhomDoiTuong;
  String donViCongTac, ngheNghiep;
  String soDienThoai;
  String email;
  String soTheBhyt, maSoBHXH;
  String diaChiNoiO;
  String tinhThanhMa, tinhThanhTen;
  String quanHuyenMa, quanHuyenTen;
  String phuongXaMa, phuongXaTen;
  int diaBanCoSoId;
  String coSoYTeMa, coSoYTeTen;
  String danTocMa;
  String quocTichMa;
  String tienSuDiUng;
  String cacBenhLyDangMac;
  String cacThuocDangDung;
  String ghiChu;
  String ngayDangKi;
  int tinhTrangDangKi;
  int kiemTraTrung;
  String ketQuaKiemTra;
  String maQr;
  List<dynamic> muiTiemChung;
  List<dynamic> phieuHenTiem;

  factory NguoiTiemChung.fromJson(Map<String, dynamic> json) => NguoiTiemChung(
    id: json["id"],
    hoVaTen: json["hoVaTen"],
    ngaySinh: json["ngaySinh"],
    gioiTinh: json["gioiTinh"],
    cmtcccd: json["cmtcccd"],
    nhomDoiTuong: json["nhomDoiTuong"],
    donViCongTac: json["donViCongTac"],
    soDienThoai: json["soDienThoai"],
    email: json["email"],
    soTheBhyt: json["soTheBHYT"],
    diaChiNoiO: json["diaChiNoiO"],
    tinhThanhMa: json["tinhThanhMa"],
    tinhThanhTen: json["tinhThanhTen"],
    quanHuyenMa: json["quanHuyenMa"],
    quanHuyenTen: json["quanHuyenTen"],
    phuongXaMa: json["phuongXaMa"],
    phuongXaTen: json["phuongXaTen"],
    diaBanCoSoId: json["diaBanCoSoId"],
    coSoYTeMa: json["coSoYTeMa"],
    coSoYTeTen: json["coSoYTeTen"],
    danTocMa: json["danTocMa"],
    quocTichMa: json["quocTichMa"],
    tienSuDiUng: json["tienSuDiUng"],
    cacBenhLyDangMac: json["cacBenhLyDangMac"],
    cacThuocDangDung: json["cacThuocDangDung"],
    ghiChu: json["ghiChu"],
    ngayDangKi: json["ngayDangKi"],
    tinhTrangDangKi: json["tinhTrangDangKi"],
    kiemTraTrung: json["kiemTraTrung"],
    ketQuaKiemTra: json["ketQuaKiemTra"],
    maQr: json["maQR"],
    muiTiemChung: List<dynamic>.from(json["muiTiemChung"].map((x) => x)),
    phieuHenTiem: List<dynamic>.from(json["phieuHenTiem"].map((x) => x)),
  );

  Map<String, dynamic> params() => {
    "HoVaTen": hoVaTen,
    "NgaySinh": ngaySinh,
    "GioiTinh": gioiTinh,
    "CMTCCCD": cmtcccd,
    "NgheNghiep": ngheNghiep,
    "NhomDoiTuong": nhomDoiTuong,
    "DonViCongTac": donViCongTac,
    "SoDienThoai": soDienThoai,
    "Email": email,
    "MaSoBHXH": maSoBHXH,
    "SoTheBHYT": soTheBhyt,
    "DiaChiNoiO": diaChiNoiO,
    "TinhThanh_Ma": tinhThanhMa,
    "TinhThanh_Ten": tinhThanhTen,
    "QuanHuyen_Ma": quanHuyenMa,
    "QuanHuyen_Ten": quanHuyenTen,
    "PhuongXa_Ma": phuongXaMa,
    "PhuongXa_Ten": phuongXaTen,
    "DiaBanCoSo_ID": diaBanCoSoId,
    "CoSoYTe_Ma": coSoYTeMa,
    "CoSoYTe_Ten": coSoYTeTen,
    "DanToc_Ma": danTocMa,
    "QuocTich_Ma": quocTichMa,
    "TienSuDiUng": tienSuDiUng,
    "CacBenhLyDangMac": cacBenhLyDangMac,
    "CacThuocDangDung": cacThuocDangDung,
    "GhiChu": ghiChu,
    "NgayDangKi": ngayDangKi,
    "TinhTrangDangKi": tinhTrangDangKi,
  };

  static List<NguoiTiemChung> listFromJson(dynamic data) =>
      List<NguoiTiemChung>.from(data.map((x) => NguoiTiemChung.fromJson(x)));
}
