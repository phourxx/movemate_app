import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppContainer extends StatelessWidget {
  final Widget child;
  final bool showTopRadius;
  final bool showBottomRadius;
  final bool elevate;
  final Widget? button;
  final String? image;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  const AppContainer({
    super.key,
    required this.child,
    this.elevate=true,
    this.showTopRadius=true,
    this.showBottomRadius=true,
    this.button,
    this.image,
    this.width,
    this.height,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      width: width,
      height: height,
      decoration: ShapeDecoration(
        color: Colors.white,
        image: image != null ? DecorationImage(
          image: AssetImage(image!),
          alignment: Alignment.bottomRight,
          fit: BoxFit.contain,
        ) : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: showTopRadius ? Radius.circular(16.r) : Radius.zero,
            topRight: showTopRadius ? Radius.circular(16.r) : Radius.zero,
            bottomRight: showBottomRadius ? Radius.circular(16.r) : Radius.zero,
            bottomLeft: showBottomRadius ? Radius.circular(16.r) : Radius.zero,
          ),
        ),
        shadows: [
          if(elevate)
            BoxShadow(
              color: Colors.grey.withOpacity(.1),
              blurRadius: 2.r,
              spreadRadius: 2.r,
              offset: const Offset(0, 2),
            )
        ],
      ),
      child: button == null ? child : Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          child,
          Divider(color: Colors.grey[200]),
          button!,
        ],
      ),
    );
  }
}
