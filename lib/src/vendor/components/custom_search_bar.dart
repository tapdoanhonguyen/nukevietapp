import 'package:flutter/material.dart';
import 'package:nukeviet/src/themes/default/color.dart';

class CustomSearchBar extends StatefulWidget {
  final String placeholder;
  final Function onSubmit;
  final Color background;
  final Color hintTextColor;
  final Color iconColor;
  final Color textColor;
  final Function onClickVoice;
  final TextEditingController controller;
  final Function onChanged;
  final bool canSearch;
  final bool showButtons;
  final double width;
  final double height;
  final double radius;
  final bool showSubmitButton;
  final TextInputType keyboardType;
  final bool showVoiceIcon;

  const CustomSearchBar(
      {Key key,
        this.placeholder = r'Bạn đang tìm kiếm gì ?',
        this.onSubmit,
        this.background = Colors.white,
        this.hintTextColor = Colors.grey,
        this.iconColor = Colors.black,
        this.textColor = Colors.black,
        this.onChanged,
        this.controller,
        this.onClickVoice,
        this.canSearch = true,
        this.showButtons = true,
        this.width,
        this.radius = 8,
        this.height = kMinInteractiveDimension,
        this.keyboardType = TextInputType.text,
        this.showVoiceIcon = false,
        this.showSubmitButton = false})
      : super(key: key);

  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  TextEditingController textCtrl;
  FocusNode mFocusNode;

  @override
  void initState() {
    super.initState();
    mFocusNode = FocusNode();
    textCtrl = widget.controller != null
        ? widget.controller
        : new TextEditingController();
  }

  @override
  void dispose() {
    mFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(textScaleFactor: 1);
    double width = MediaQuery.of(context).size.width;
    if (widget.width != null) width = widget.width;
    return Container(
      height: widget.height,
      padding: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.radius),
        color: widget.background,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget.showButtons
              ? SizedBox(
            width: 40,
            child: TextButton(
              onPressed: () => widget.onClickVoice(),
              child: Icon(
                Icons.search,
                color: AppColor.nearlyBlack,
              ),
            ),
          )
              : SizedBox(),
          width > 100
              ? Expanded(
            child: MediaQuery(
              data: mqDataNew,
              child: TextField(
                controller: textCtrl,
                autofocus: false,
                enabled: widget.canSearch,
                keyboardType: widget.keyboardType,
                style: TextStyle(color: widget.textColor),
                decoration: InputDecoration(
                  filled: true,
                  hintText:
                  widget.placeholder ?? 'Bạn đang tìm kiếm gì ?',
                  hintStyle: TextStyle(color: widget.hintTextColor),
                  fillColor: Colors.transparent,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
                onChanged: (value) {
                  if (widget.onChanged != null) widget.onChanged(value);
                },
                onSubmitted: (value) {
                  widget.onSubmit(value);
                },
                focusNode: mFocusNode,
              ),
            ),
          )
              : SizedBox(),
          !widget.showSubmitButton
              ? widget.showButtons && width > 100
              ? SizedBox(
            width: 40,
            // child: TextButton(
            //   onPressed: () => widget.onClickVoice(),
            //   child: SvgPicture.asset(
            //     'assets/svgs/icon_search_voice.svg',
            //     fit: BoxFit.contain,
            //     width: 16,
            //     color: widget.iconColor,
            //   ),
            // ),
          )
              : SizedBox()
              : SizedBox(
            width: 40,
            child: IconButton(
              onPressed: () => widget.onSubmit(),
              icon: Icon(
                Icons.send,
                color: widget.iconColor,
                size: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}