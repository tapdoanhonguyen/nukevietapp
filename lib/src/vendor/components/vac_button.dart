import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nukeviet/src/themes/default/color.dart';

class VacButton extends StatelessWidget {
  final Function onTap;
  final String title;
  final double radius;
  final double height;
  final double width;
  final TextStyle style;
  final FontWeight weight;
  final Color color;
  final IconData icon;

  const VacButton({
    @required this.onTap,
    this.title = '',
    this.radius = 4,
    this.height = 40,
    this.width,
    this.weight,
    this.style,
    this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color ?? AppColor.main,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Icon(icon ?? Icons.close, color: Colors.white, size: 18),
                ),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: style ??
                      GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: weight ?? FontWeight.normal,
                      ),
                )
              ],
            ),
          ),
        ),
        onPressed: onTap,
      ),
    );
  }
}
