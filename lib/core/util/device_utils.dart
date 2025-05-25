import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tagmak/core/enums/haptic_type.dart';
import 'package:tagmak/core/theme/colors.dart';

class DeviceUtils {
  /// Full screen size (width & height)
  static Size screenSize(BuildContext context) => MediaQuery.of(context).size;

  /// Screen width
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  /// Screen height
  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  /// Status bar height (top notch area)
  static double statusBarHeight(BuildContext context) =>
      MediaQuery.of(context).padding.top;

  /// Bottom inset (usually keyboard or bottom gesture area)
  static double bottomInset(BuildContext context) =>
      MediaQuery.of(context).viewInsets.bottom;

  /// Bottom padding (useful for bottom navigation bars)
  static double bottomPadding(BuildContext context) =>
      MediaQuery.of(context).padding.bottom;

  /// App bar height (typically 56 by default)
  static double appBarHeight() => kToolbarHeight;

  /// Bottom navigation bar height (typically 56)
  static double bottomNavigationBarHeight() => kBottomNavigationBarHeight;

  static void showTopSheet({
    required BuildContext context,
    required Widget child,
  }) {
    showGeneralDialog(
      context: context,

      barrierDismissible: true,
      barrierLabel: "TopSheet",
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: Alignment.topCenter,
          child: Material( child: child),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0, -1),
            end: Offset(0, 0),
          ).animate(CurvedAnimation(parent: anim1, curve: Curves.easeOut)),
          child: child,
        );
      },
      transitionDuration: Duration(milliseconds: 600),
    );
  }


//haptic feedbacks
  static final Map<HapticType, VoidCallback> _hapticActions = {
    HapticType.light: HapticFeedback.lightImpact,
    HapticType.medium: HapticFeedback.mediumImpact,
    HapticType.heavy: HapticFeedback.heavyImpact,
    HapticType.selection: HapticFeedback.selectionClick,
    HapticType.vibrate: HapticFeedback.vibrate,
  };

  static void hapticFeedback([HapticType type = HapticType.vibrate]) {
    final action = _hapticActions[type];
    if (action != null) action();
  }


//hide keyboard
  static void hideKeyboard() => FocusManager.instance.primaryFocus?.unfocus();






































}
