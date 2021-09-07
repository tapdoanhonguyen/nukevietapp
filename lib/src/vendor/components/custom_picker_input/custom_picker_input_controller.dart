import 'package:flutter/material.dart';

class PickerItem {
  String name;
  String code;
  dynamic id;
  PickerItem({
    this.name = '',
    this.id,
    this.code = '',
  });
}

class PickerController extends TextEditingController {
  List<PickerItem> listMap;
  PickerItem itemData;
  dynamic itemValue;

  String get pickedID {
    return (itemData != null) ? '${itemData.id}' : '';
  }

  String get pickedName {
    return (itemData != null) ? itemData.name : '';
  }

  String get pickedCode {
    return (itemData != null) ? itemData.code : '';
  }

  // PickerItem get data => itemData;
  // dynamic get dataValue => itemValue;
  // List get listData => listMap;

  set listData(_listData) {
    listMap = _listData;
    itemValue = null;
    itemData = null;
    clear();
  }

  //value của item được chọn trong list
  set dataValue(dynamic _valueData) {
    if (_valueData != null && _valueData != '') {
      itemData = listMap.firstWhere((element) => element.id == _valueData,
          orElse: () => null);
      if (itemData != null) {
        itemValue = _valueData;
        text = itemData.name;
      } else {
        itemValue = _valueData;
        itemData = PickerItem(name: _valueData, id: _valueData);
        text = _valueData;
      }
    }
  }

  set dataValueCustom(_valueData) {
    itemValue = _valueData;
    itemData = PickerItem(name: _valueData, id: _valueData);
    text = _valueData;
  }

  PickerController({
    this.listMap,
  });
}