import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nukeviet/src/themes/default/color.dart';
import 'package:nukeviet/src/vendor/commons/toast.dart';
import 'package:nukeviet/src/vendor/components/base_scaffold.dart';
import 'package:nukeviet/src/vendor/components/custom_input.dart';
import 'package:nukeviet/src/vendor/components/vac_button.dart';
import 'package:nukeviet/src/vendor/components/text_box.dart';


import 'new_injector_vm.dart';


/// Đăng ký tiêm mới
class NewInjectorPage extends StatefulWidget {
  const NewInjectorPage();

  @override
  State createState() => _NewInjectorPageState();
}

class _NewInjectorPageState extends State<NewInjectorPage> {
  final viewModel = NewInjectorViewModel();

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldWidget(
      title: r'Đăng ký tiêm mới',
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: Column(
              children: [
                CustomInput(
                  title: r'Họ và tên',
                  isRequired: true,
                  onChanged: (t) => viewModel.injector.hoVaTen = t,
                ),
                CustomInput(
                  title: r'Ngày sinh',
                  hintText: r'dd/MM/yyyy, ddMMyyyy',
                  isRequired: true,
                  onChanged: (text) => viewModel.injector.ngaySinh = text,
                ),
                CustomInput(
                  title: r'Giới tính',
                  isButton: true,
                  onTap: () {
                    Toast.show(text: r'Giới tính');
                  },
                ),
                CustomInput(
                  title: r'Số CMND/CCCD',
                  isRequired: true,
                  onChanged: (t) => viewModel.injector.cmtcccd = t,
                ),
                CustomInput(
                  title: r'Số thẻ BHYT',
                  onChanged: (text) {},
                ),
                CustomInput(
                  title: r'Số điện thoại',
                  isRequired: true,
                  onChanged: (t) => viewModel.injector.soDienThoai = t,
                ),
                CustomInput(
                  title: r'Email',
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (t) => viewModel.injector.email = t,
                ),
                CustomInput(
                  title: r'Tỉnh/ Thành phố',
                  isRequired: true,
                  isButton: true,
                  onTap: () {
                    Toast.show(text: r'Tỉnh/ Thành phố');
                  },
                ),
                CustomInput(
                  title: r'Quận/ Huyện',
                  isRequired: true,
                  isButton: true,
                  onTap: () {
                    Toast.show(text: r'Quận/ Huyện');
                  },
                ),
                CustomInput(
                  title: r'Phường/ Xã',
                  isRequired: true,
                  isButton: true,
                  onTap: () {
                    Toast.show(text: r'Phường/ Xã');
                  },
                ),
                CustomInput(
                  title: r'Địa chỉ nơi ở',
                  hintText: r'Số nhà, đường, tổ dân phố, khóm ấp, thôn bản',
                  isRequired: true,
                  onChanged: (t) => viewModel.injector.diaChiNoiO = t,
                ),
                CustomInput(
                  title: r'Nhóm đối tượng',
                  isRequired: true,
                  isButton: true,
                  onTap: () {
                    Toast.show(text: r'Nhóm đối tượng');
                  },
                ),
                CustomInput(
                  title: r'Đơn vị công tác',
                  isRequired: true,
                  onChanged: (t) => viewModel.injector.donViCongTac = t,
                ),
                CustomInput(
                  title: r'Cơ sở y tế',
                  isRequired: true,
                  isButton: true,
                  onTap: () {
                    Toast.show(text: r'Cơ sở y tế');
                  },
                ),
                CustomInput(
                  title: r'Địa bàn cơ sở',
                  isButton: true,
                  onTap: () {
                    Toast.show(text: r'Địa bàn cơ sở');
                  },
                ),
                CustomInput(
                  title: r'Dân tộc',
                  isButton: true,
                  onTap: () {
                    Toast.show(text: r'Dân tộc');
                  },
                ),
                CustomInput(
                  title: r'Quốc tịch',
                  isButton: true,
                  onTap: () {
                    Toast.show(text: r'Quốc tịch');
                  },
                ),
                TextBox(
                  title: r'Tiền sử dị ứng',
                  onChanged: (t) => viewModel.injector.tienSuDiUng = t,
                ),
                TextBox(
                  title: r'Các bệnh lý đang mắc',
                  onChanged: (t) => viewModel.injector.cacBenhLyDangMac = t,
                ),
                TextBox(
                  title: r'Các thuốc đang dùng',
                  onChanged: (t) => viewModel.injector.cacThuocDangDung = t,
                ),
                CustomInput(
                  title: r'Ngày đăng ký tiêm',
                  hintText: r'dd/MM/yyyy, ddMMyyyy',
                  onChanged: (t) => viewModel.injector.ngayDangKi = t,
                ),
                CustomInput(
                  title: r'Lưu ý',
                  hintText: r'',
                  onChanged: (t) => viewModel.injector.ghiChu = t,
                ),
                Container(
                    height: 54,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        VacButton(
                          title: r'Hủy',
                          color: AppColor.error,
                          onTap: () => Get.back(),
                        ),
                        SizedBox(width: 16),
                        VacButton(
                          title: r'Đăng ký tiêm',
                          color: AppColor.main,
                          icon: Icons.save,
                          onTap: () {
                            Toast.show(text: r'Đăng ký tiêm');
                          },
                        )
                      ],
                    )),
                SizedBox(
                  height: MediaQuery.of(context).padding.bottom,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
