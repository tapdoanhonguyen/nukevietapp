import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nukeviet/src/include/base.dart';
import 'package:nukeviet/src/vendor/commons/utils.dart';
import 'package:nukeviet/src/vendor/components/custom_date_input/custom_date_input_controller.dart';
import 'package:nukeviet/src/vendor/components/custom_picker_input/custom_picker_input_controller.dart';
class RegisterController extends GetxController with BaseViewModel {
  var name = ''.obs;
  List<PickerItem> gender = [
    PickerItem(name: 'Nam', id: 0),
    PickerItem(name: 'Nữ', id: 1),
    PickerItem(name: 'Không xác định', id: 2),
  ];

  TextEditingController nameCtrl = TextEditingController();
  PickerController genderCtrl = PickerController();
  DatePickerController dobCtrl = DatePickerController();
  TextEditingController idCtrl = TextEditingController();
  TextEditingController bhytCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  PickerController cityCtrl = PickerController();
  PickerController districtCtrl = PickerController();
  PickerController wardCtrl = PickerController();
  TextEditingController addressCtrl = TextEditingController();
  PickerController groupCtrl = PickerController();
  TextEditingController unitCtrl = TextEditingController();
  PickerController csytCtrl = PickerController();
  PickerController localCtrl = PickerController();
  PickerController danTocCtrl = PickerController();
  PickerController quocTichCtrl = PickerController();
  TextEditingController tieuSuCtrl = TextEditingController();
  TextEditingController benhLyCtrl = TextEditingController();
  TextEditingController thuocCtrl = TextEditingController();
  DatePickerController ngayDKCtrl = DatePickerController();
  TextEditingController luuYCtrl = TextEditingController();

  @override
  onInit() {
    super.onInit();
    genderCtrl.listData = gender;
    Future.wait([

    ]);
  }



  ///
  register() {
    Map<String, dynamic> params = {
      "HoVaTen": nameCtrl.text,
      "NgaySinh": dobCtrl.text,
      "GioiTinh": genderCtrl.pickedID,
      "CMTCCCD": idCtrl.text,
      "NgheNghiep": "",
      "NhomDoiTuong": groupCtrl.pickedID,
      "DonViCongTac": unitCtrl.text,
      "SoDienThoai": phoneCtrl.text,
      "Email": emailCtrl.text,
      "MaSoBHXH": "",
      "SoTheBHYT": bhytCtrl.text,
      "DiaChiNoiO": addressCtrl.text,
      "TinhThanh_Ma": cityCtrl.pickedCode,
      "TinhThanh_Ten": cityCtrl.pickedName,
      "QuanHuyen_Ma": districtCtrl.pickedCode,
      "QuanHuyen_Ten": districtCtrl.pickedName,
      "PhuongXa_Ma": wardCtrl.pickedCode,
      "PhuongXa_Ten": wardCtrl.pickedName,
      "DiaBanCoSo_ID": localCtrl.pickedID,
      "CoSoYTe_Ma": csytCtrl.pickedID,
      "CoSoYTe_Ten": csytCtrl.pickedName,
      "DanToc_Ma": danTocCtrl.pickedID,
      "QuocTich_Ma": quocTichCtrl.pickedID,
      "TienSuDiUng": tieuSuCtrl.text,
      "CacBenhLyDangMac": benhLyCtrl.text,
      "CacThuocDangDung": thuocCtrl.text,
      "GhiChu": luuYCtrl.text,
      "NgayDangKi": ngayDKCtrl.text,
      "TinhTrangDangKi": 1
    };
    logger.info(params);
  }
}