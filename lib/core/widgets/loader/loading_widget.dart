import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tagmak/core/theme/colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SpinKitCircle(
      color: AppColors.backgroundDark,
      size: 20.0,
      //controller: AnimationController(vsync: this, duration: const Duration(milliseconds: 1200)),
    );
  }
}
