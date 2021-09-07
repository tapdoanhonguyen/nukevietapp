import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nukeviet/src/themes/default/color.dart';
import 'package:nukeviet/src/vendor/components/custom_form_input.dart';
import 'package:nukeviet/src/vendor/components/custom_picker_input/custom_picker_input_controller.dart';
import 'package:nukeviet/src/vendor/components/custom_search_bar.dart';
import 'package:tiengviet/tiengviet.dart';
enum DropDownType {
  singleSelect,
  multiSelect,
}

class CustomPickerInput extends StatefulWidget {
  final String label;
  final bool disable;
  final bool showSearchBar;
  final Function selectData;
  final Function(PickerItem) onSelectedData;
  final Function onDismiss;
  final BuildContext mainContext;
  final bool showButtonSearch;
  final String searchPlaceholder;
  final bool showDoneButton;
  final bool noSort;

  //Trường hợp nhập ô search box và lấy value từ ô đó
  final bool getValueFromSearchBox;
  final Function validator;
  final PickerController controller;
  final DropDownType type;

  CustomPickerInput({
    @required this.label,
    this.selectData,
    this.onSelectedData,
    @required this.controller,
    @required this.mainContext,
    this.onDismiss,
    this.disable = false,
    this.showSearchBar = true,
    this.showButtonSearch = true,
    this.searchPlaceholder,
    this.noSort = false,
    this.showDoneButton = false,
    this.getValueFromSearchBox = false,
    this.validator,
    this.type = DropDownType.singleSelect,
  });

  @override
  _CustomPickerInputState createState() => _CustomPickerInputState();
}

class _CustomPickerInputState extends State<CustomPickerInput> {
  selectCardType({
    BuildContext mainContext,
    List<PickerItem> data,
    Function selectData,
    Function onDismiss,
    String label,
    bool showSearchBar,
    bool showButtonSearch,
    String searchPlaceholder,
    bool showDoneButton = false,
    bool noSort,
    bool getValueFromSearchBox,
    DropDownType type,
  }) {
    if (data == null || data.isEmpty) {
      return;
    }
    if ((showSearchBar && data.length > 10) && !noSort)
      data.sort((a, b) =>
          TiengViet.parse(a.name).compareTo(TiengViet.parse(b.name)));

    showActionSheetBar(
        data: data,
        currentData: widget.controller.itemData,
        label: label,
        searchPlaceholder: searchPlaceholder,
        mainContext: mainContext,
        showButtonSearch: showButtonSearch,
        showSearchBar: showSearchBar,
        showDoneButton: showDoneButton,
        getValueFromSearchBox: getValueFromSearchBox,
        selectMultidata: (data) {
          selectData(data);
        },
        selectData: (PickerItem dataValue) async {
          if (selectData != null) await selectData(dataValue);
          widget.controller.dataValue = dataValue.id;

          if (widget.onSelectedData != null) {
            widget.onSelectedData(dataValue);
          }
        },
        type: type);
  }

  showActionSheetBar(
      {BuildContext mainContext,
        List data,
        Function selectData,
        Function selectMultidata,
        Function onDismiss,
        String label,
        bool showSearchBar = false,
        bool showButtonSearch = false,
        String searchPlaceholder,
        bool showDoneButton = false,
        PickerItem currentData,
        bool noSort = false,
        DropDownType type = DropDownType.singleSelect,
        bool getValueFromSearchBox = false}) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      isDismissible: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      context: mainContext,
      builder: (BuildContext context) {
        return DropDownContent(
          data: data,
          currentData: currentData,
          label: label,
          placeholder: searchPlaceholder,
          mainContext: mainContext,
          showButtonSearch: showButtonSearch,
          showSearchBar: showSearchBar,
          showDoneButton: showDoneButton,
          selectMultidata: selectMultidata,
          getValueFromSearchBox: getValueFromSearchBox,
          type: type,
          onPressItem: (int index, data) async {
            try {
              Navigator.pop(context);
              await selectData(data);
            } catch (e) {}
          },
        );
      },
    ).then((value) => onDismiss != null ? onDismiss() : null);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          CustomFormInput(
            labelText: widget.label,
            controller: widget.controller,
            validator: widget.validator,
            enabled: !widget.disable,
            suffixIcon: !widget.disable
                ? Container(
              height: 7,
              width: 7,
              child: Center(
                child: Icon(Icons.arrow_drop_down),
              ),
            )
                : SizedBox(),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: InkWell(
              onTap: () {
                if (!widget.disable) {
                  BuildContext _context = widget.mainContext ?? context;
                  selectCardType(
                    mainContext: _context,
                    data: widget.controller.listMap,
                    selectData: widget.selectData,
                    onDismiss: widget.onDismiss,
                    label: widget.label,
                    showSearchBar: widget.showSearchBar,
                    noSort: widget.noSort,
                    searchPlaceholder: widget.searchPlaceholder,
                    showButtonSearch: widget.showButtonSearch,
                    showDoneButton: widget.showDoneButton,
                    getValueFromSearchBox: widget.getValueFromSearchBox,
                    type: widget.type,
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

class DropDownContent extends StatefulWidget {
  final List<PickerItem> data;
  final String label;
  final PickerItem currentData;
  final Function onPressItem;
  final Function selectMultidata;
  final bool showSearchBar;
  final String placeholder;
  final bool showButtonSearch;
  final bool showDoneButton;
  final bool getValueFromSearchBox;
  final BuildContext mainContext;
  final DropDownType type;

  DropDownContent(
      {this.data,
        this.onPressItem,
        this.label,
        this.currentData,
        this.placeholder,
        this.showButtonSearch = true,
        this.showDoneButton = false,
        this.showSearchBar,
        this.mainContext,
        this.getValueFromSearchBox = false,
        this.selectMultidata,
        this.type = DropDownType.singleSelect});

  @override
  _DropDownContentState createState() => _DropDownContentState();
}

class _DropDownContentState extends State<DropDownContent> {
  List<PickerItem> data = [];
  List<PickerItem> dataFilter = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    data = widget.data;
    // if (widget.type == DropDownType.multiSelect) {
    //   data = widget.data.map((e) => {...e, 'active': false}).toList();
    // }
    dataFilter = data;
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  filterData(value) {
    String valueParse = TiengViet.parse(value).toLowerCase();
    var listData = data
        .where((element) => TiengViet.parse(element.name)
        .toLowerCase()
        .replaceAll('ð', 'd')
        .contains(valueParse))
        .toList();
    setState(() {
      dataFilter = listData;
    });
  }

  // onPressItemMultiselect(value) {
  //   dataFilter = dataFilter.map<Map<dynamic, dynamic>>((item) {
  //     if (item['value'] == value['value']) {
  //       return {
  //         ...item,
  //         'active': !item['active'],
  //       };
  //     } else {
  //       return item;
  //     }
  //   }).toList();
  //   data = data.map<Map<dynamic, dynamic>>((item) {
  //     if (item['value'] == value['value']) {
  //       return {
  //         ...item,
  //         'active': !item['active'],
  //       };
  //     } else {
  //       return item;
  //     }
  //   }).toList();
  //   setState(() {});
  // }

  // onPressDoneMultiselect() {
  //   List<Map> selectedData =
  //       data.where((element) => element['active'] == true).toList();
  //   widget.selectMultidata(selectedData);
  // }

  @override
  Widget build(BuildContext context) {
    bool showSearch = (widget.data.length > 10 && widget.showSearchBar) ||
        widget.getValueFromSearchBox;

    return SafeArea(
      top: true,
      child: Container(
        height: min(500, Get.height / 2),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  height: 52,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: AppColor.divider,
                      ),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.label,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.merriweather(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: AppColor.nearlyBlack,
                          ),
                        ),
                      ),
                      widget.showDoneButton
                          ? Container(
                        width: 100,
                        child: TextButton(
                          onPressed: () {
                            // widget.type == DropDownType.multiSelect
                            //     ? onPressDoneMultiselect()
                            //     :
                            widget.onPressItem(null, {
                              'title': searchController.text,
                              'value': searchController.text,
                            });
                          },
                          child: Text(
                            'Xác nhận',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              color: AppColor.link,
                            ),
                          ),
                        ),
                      )
                          : SizedBox(
                        width: 100,
                      )
                    ],
                  ),
                ),
                showSearch
                    ? Container(
                  child: CustomSearchBar(
                    placeholder: widget.placeholder,
                    radius: 0,
                    background: AppColor.backgroundWhite,
                    controller: searchController,
                    showButtons: widget.showButtonSearch,
                    onChanged: filterData,
                  ),
                )
                    : SizedBox(),
                Expanded(
                  /**
                      child: ListView.builder(
                      itemCount: dataFilter.length,
                      itemBuilder: (BuildContext context, int index) {
                      return Container(
                      height: itemHeight,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: InkWell(
                      onTap: () {
                      // if (widget.type == DropDownType.multiSelect) {
                      //   onPressItemMultiselect(dataFilter[index]);
                      // } else
                      widget.onPressItem(index, dataFilter[index]);
                      },
                      child: Container(
                      height: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                      border: Border(
                      bottom: BorderSide(
                      color: AppColor.divider,
                      width: 0.7,
                      ),
                      ),
                      ),
                      child:
                      // widget.type == DropDownType.multiSelect
                      //     ? Container(
                      //         padding: EdgeInsets.symmetric(vertical: 12),
                      //         child: Row(
                      //           crossAxisAlignment:
                      //               CrossAxisAlignment.start,
                      //           children: [
                      //             Image(
                      //               width: 20,
                      //               height: 20,
                      //               image: AssetImage(dataFilter[index]
                      //                       ['active']
                      //                   ? 'assets/images/icon_checkbox_active.png'
                      //                   : 'assets/images/icon_checkbox.png'),
                      //             ),
                      //             SizedBox(
                      //               width: 8,
                      //             ),
                      //             Expanded(
                      //               child: Column(
                      //                 crossAxisAlignment:
                      //                     CrossAxisAlignment.start,
                      //                 children: [
                      //                   Text(
                      //                     '${dataFilter[index]['title']}',
                      //                     textAlign: TextAlign.left,
                      //                     maxLines: 2,
                      //                     style: TextStyle(
                      //                       fontWeight: FontWeight.normal,
                      //                       fontSize: 16,
                      //                       color: AppColor.nearlyBlack,
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       )
                      //     :
                      // dataFilter[index]['content'] ??
                      Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                      '${dataFilter[index].title}',
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                      color: (widget.currentData != null &&
                      (widget.currentData.value ==
                      dataFilter[index].value))
                      ? AppColor.link
                      : AppColor.nearlyBlack,
                      fontSize: 16,
                      ),
                      ),
                      ),
                      ),
                      ),
                      );
                      },
                      ), */
                  child: ListView(
                    padding: EdgeInsets.all(8),
                    children: ListTile.divideTiles(
                      context: context,
                      tiles: List.generate(
                        dataFilter.length,
                            (int index) {
                          return ListTile(
                            title: Text(
                              dataFilter[index].name,
                              style: GoogleFonts.roboto(),
                            ),
                            onTap: () =>
                                widget.onPressItem(index, dataFilter[index]),
                          );
                        },
                      ),
                    ).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}