import 'package:flutter/cupertino.dart';

class CustomCupertinoCheckOutDialog extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onConfirm;

  const CustomCupertinoCheckOutDialog({
    super.key,
    required this.onCancel,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoTheme(
      data: const CupertinoThemeData(
        brightness: Brightness.light, // Force light theme
      ),
      child: CupertinoAlertDialog(
        title: const Text(
          'Check Out?',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: CupertinoColors.black, // Ensures black text
          ),
        ),
        content: const Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Text(
            'Are you sure you want to check out?',
            style: TextStyle(
              fontSize: 16,
              color: CupertinoColors.black, // Ensures black text
            ),
          ),
        ),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            onPressed: onCancel,
            isDestructiveAction: false,
            child: const Text(
              'Cancel',
              style: TextStyle(
                fontWeight: FontWeight.w500,

                color: CupertinoColors.systemGrey,
              ),
            ),
          ),
          CupertinoDialogAction(
            onPressed: onConfirm,
            isDefaultAction: true,
            child: const Text(
              'Check Out',
              style: TextStyle(
                fontWeight: FontWeight.w500,

                color:
                    CupertinoColors.black, // Choose appropriate contrast color
              ),
            ),
          ),
        ],
      ),
    );
  }
}
