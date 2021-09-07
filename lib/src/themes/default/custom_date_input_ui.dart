import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nukeviet/src/vendor/components/custom_date_input/custom_date_input_controller.dart';
import 'package:nukeviet/src/vendor/components/custom_form_input.dart';

class CustomDateInput extends StatelessWidget {
  final String label;
  final Function selectData;
  final bool disable;
  final CupertinoDatePickerMode mode;
  final DatePickerController controller;
  final Function validator;
  CustomDateInput({
    @required this.label,
    this.selectData,
    this.disable = false,
    @required this.controller,
    this.validator,
    this.mode = CupertinoDatePickerMode.date,
  });

  checkInitDate(DateTime initDate, DateTime maxDate, DateTime minDate) {
    DateTime now = DateTime.now();
    if (initDate == null) {
      DateTime date = initDate ?? now;
      if (maxDate != null && date.isAfter(maxDate)) {
        // Nếu có max và initDate đã quá max thì initDate = max - 1s
        return maxDate.subtract(Duration(seconds: 1));
      } else if (minDate != null && date.isBefore(minDate)) {
        // Nễu có min và initDate trước ngày min thì initData = min + 1s
        return minDate.add(Duration(seconds: 1));
      } else {
        return date;
      }
    } else {
      return initDate;
    }
  }

  onClickDateTime({
    @required BuildContext context,
    @required Function selectData,
    String label,
    CupertinoDatePickerMode mode = CupertinoDatePickerMode.date,
  }) async {
    DateTime pickDate;
    DateTime initDate =
    checkInitDate(controller.date, controller.maxDate, controller.minDate);
    pickDate = await showDatePicker(
      context: context,
      helpText: label,
      initialDate: initDate,
      firstDate: controller.minDate ??
          DateTime.now().subtract(Duration(
              days: 100 * 365)), //Nếu không có minDate thì min là 100 năm trước
      lastDate:
      controller.maxDate ?? DateTime.now().add(Duration(days: 100 * 365)),
    );

    if (pickDate != null) {
      controller.date = pickDate;
      if (selectData != null) selectData(controller.date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          CustomFormInput(
            labelText: label,
            controller: controller,
            validator: validator,
            enabled: !disable,
          ),
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: InkWell(
              onTap: () {
                if (!disable) {
                  onClickDateTime(
                    context: context,
                    selectData: selectData,
                    label: label,
                    mode: mode,
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}