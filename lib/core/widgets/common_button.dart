import 'package:flutter/material.dart';
import 'package:tagmak/core/theme/colors.dart';
import 'package:tagmak/core/widgets/loader/loading_widget.dart';

class CommonButton extends StatelessWidget {
  final String label;
  const CommonButton({
    super.key,
    this.label = 'start',
    this.onPressed,
    this.isLoading = false,
  });
  final Function()? onPressed;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {
          if (onPressed != null) {
            if (!isLoading) {
              onPressed!();
            }
          } else {}
        },
        child:
            isLoading
                ? LoadingWidget()
                : Text(
                  label,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
      ),
    );
  }
}
