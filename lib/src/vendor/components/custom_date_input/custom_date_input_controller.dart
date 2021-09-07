import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerController extends TextEditingController {
  DateTime initDate;
  DateTime maxData;
  DateTime minData;

  DateTime get date => initDate;
  DateTime get maxDate => maxData;
  DateTime get minDate => minData;

  set date(DateTime date) {
    if (date != null) {
      if (maxDate != null && initDate != null && initDate.isAfter(maxDate)) {
        initDate = null;
        text = '';
      } else if (minDate != null &&
          initDate != null &&
          initDate.isBefore(minDate)) {
        initDate = null;
        text = '';
      } else {
        initDate = date;
        text = DateFormat('dd/MM/yyyy').format(date);
      }
    } else {
      initDate = null;
      text = '';
    }
  }

  set maxDate(DateTime date) {
    maxDate = date;
    if (initDate != null && maxDate != null && initDate.isAfter(maxDate)) {
      initDate = null;
      text = '';
    }
  }

  set minDate(DateTime date) {
    minDate = date;
    if (initDate != null && minDate != null && initDate.isBefore(minDate)) {
      initDate = null;
      text = '';
    }
  }

  DatePickerController({this.initDate, this.maxData, this.minData});
}