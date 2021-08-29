import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nukeviet/src/themes/default/color.dart';

class TextBox extends StatefulWidget {
  final String title;
  final TextStyle style;
  final Stream<bool> invalid;
  final ValueChanged<String> onChanged;
  final bool isRequired;
  final String initialText;

  const TextBox({
    this.title,
    this.invalid,
    this.isRequired: false,
    this.style,
    this.initialText,
    this.onChanged,
  });

  @override
  _TextBoxState createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {
  Color cursorColor = AppColor.main;

  final textCtrl = TextEditingController();

  @override
  void initState() {
    textCtrl.text = widget.initialText ?? '';

    textCtrl.selection = TextSelection.fromPosition(TextPosition(
      offset: textCtrl.text.length,
    ));

    super.initState();
  }

  void onChanged(text) {
    widget.onChanged(text);
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
                        style: GoogleFonts.roboto(
                            color: AppColor.error,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.italic,
                            fontSize: 12),
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
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    constraints: BoxConstraints(minHeight: 44, maxHeight: 88),
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: invalid ? AppColor.error : AppColor.border,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: TextFormField(
                      controller: textCtrl,
                      style: widget.style ?? GoogleFonts.roboto(),
                      maxLines: null,
                      maxLength: 1000,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 8),
                        counter: SizedBox.shrink(),
                      ),
                      cursorColor: cursorColor,
                      onChanged: onChanged,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
