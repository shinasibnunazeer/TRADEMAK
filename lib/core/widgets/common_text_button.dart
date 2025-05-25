import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';

class CommonTextButton extends StatelessWidget {
  const CommonTextButton({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle view all action
      },
      child: Text(
        text,
        style: TextStyle(
          color: const Color(0xFF757575),
          fontSize: 10.rt,

          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
