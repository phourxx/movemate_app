import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
  final String? text;
  final TextStyle? style;
  final double? size;
  final double? height;
  final Color? color;
  final String? family;
  final FontWeight? weight;
  final TextAlign? textAlign;
  final TextOverflow? overflow;

  const AppText(this.text,
      {Key? key,
        this.style,
        this.size = 14,
        this.height = 21,
        this.color,
        this.family,
        this.overflow,
        this.weight,
        this.textAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style1 = style ?? GoogleFonts.encodeSans();
    return Text(text ?? '',
      textAlign: textAlign,
      overflow: overflow,
      style: style1.copyWith(
        inherit: true,
        color: color,
        fontWeight: weight,
        fontSize: size != null ? size!.sp : null,
        height: size != null ? (height! / size!) : null,
        fontFamily: family,
      ),
    );
  }
}
