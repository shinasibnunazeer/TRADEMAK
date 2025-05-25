import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tagmak/core/constants/svg_strings.dart';

class CommonFilterButton extends StatelessWidget {
  const CommonFilterButton({super.key, this.svgIcon = SvgStrings.svgFilter, this.onPressed});
  final String svgIcon;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 46,
        height: 40,
        padding: const EdgeInsets.all(10),
        decoration: ShapeDecoration(
          color: const Color(0x11D9D9D9),
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: const Color(0xFF5F5F5F)),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: SvgPicture.string(svgIcon),
      ),
    );
  }
}
