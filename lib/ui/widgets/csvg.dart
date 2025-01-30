import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MySvg extends StatelessWidget {
  const MySvg(
    this.asset, {
    super.key,
    this.color,
    this.width,
    this.height,
    this.fit,
  });
  final String asset;
  final Color? color;
  final double? width;
  final double? height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      asset,
      colorFilter:
          color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
      width: width,
      height: height,
      fit: fit ?? BoxFit.contain,
    );
  }
}
