import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Iconify extends StatelessWidget {
  final String icon;
  final Color? color;
  final double? size;

  const Iconify(
    this.icon, {
    Key? key,
    this.color,
    this.size = 24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      icon,
      color: color,
      width: size,
      height: size,
      alignment: Alignment.center,
    );
  }
}
