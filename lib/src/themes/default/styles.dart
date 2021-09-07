import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color.dart';

class AppStyle {
  static TextStyle appBarTitle = GoogleFonts.roboto(
    color: AppColor.nearlyWhite,
    fontWeight: FontWeight.w500,
    fontSize: 15,
  );
  static TextStyle normal = GoogleFonts.roboto(
    fontWeight: FontWeight.normal,
    fontSize: 14,
    color: AppColor.nearlyBlack,
  );
}