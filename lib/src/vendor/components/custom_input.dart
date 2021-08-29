import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nukeviet/src/themes/default/color.dart';


class CustomInput extends StatefulWidget {
  final String title;
  final TextStyle style;
  final Stream<bool> invalid;
  final String invalidText;
  final ValueChanged<String> onChanged;
  final TextInputType keyboardType;
  final bool isRequired;
  final String initialText;
  final String hintText;
  final bool isButton;
  final Function onTap;

  const CustomInput({
    this.title = '',
    this.invalid,
    this.style,
    this.onChanged,
    this.isRequired = false,
    this.invalidText = '',
    this.initialText = '',
    this.hintText,
    this.isButton = false,
    this.onTap,
    this.keyboardType = TextInputType.text,
  });

  @override
  _CustomInputState createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  Color cursorColor = AppColor.main;
  Color warningColor = Colors.red;

  final textCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();

    textCtrl.text = widget.initialText ?? '';

    textCtrl.selection = TextSelection.fromPosition(TextPosition(
      offset: textCtrl.text.length,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: widget.title,
              style: GoogleFonts.roboto(
                color: AppColor.nearlyBlack,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
              children: widget.isRequired
                  ? [
                      TextSpan(
                        text: ' (*)',
                        style: GoogleFonts.merriweather(
                          color: warningColor,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.italic,
                          fontSize: 12,
                        ),
                      ),
                    ]
                  : [],
            ),
          ),
          StreamBuilder<bool>(
            stream: widget.invalid,
            builder: (ctx, snapshot) {
              bool invalid = false;
              if (snapshot.hasData) {
                invalid = snapshot.data;
              }

              return Column(
                children: [
                  InkWell(
                    onTap: widget.onTap,
                    radius: 4,
                    child: Stack(
                      children: [
                        Container(
                          height: 44,
                          margin: EdgeInsets.only(top: 8),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: invalid ? warningColor : AppColor.border,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Center(
                            child: TextField(
                              readOnly: widget.isButton,
                              controller: textCtrl,
                              style: widget.style ?? GoogleFonts.roboto(),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(bottom: 8),
                                hintText: widget.hintText ?? widget.title,
                                hintStyle: widget.style ?? GoogleFonts.roboto(),
                              ),
                              cursorColor: cursorColor,
                              keyboardType: widget.keyboardType,
                              onChanged: widget.onChanged,
                              textInputAction: TextInputAction.done,
                            ),
                          ),
                        ),
                        widget.isButton
                            ? Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.grey,
                                    ),
                                    onPressed: null,
                                  ),
                                ),
                              )
                            : SizedBox.shrink(),
                      ],
                    ),
                  ),
                  invalid
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            widget.invalidText,
                            style: GoogleFonts.roboto(color: warningColor),
                          ),
                        )
                      : SizedBox()
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
