

import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';

abstract class NavigationService {
  void go({required Widget screen, FlexifyRouteAnimations animation});
  void goRemove({required Widget screen});
  void goRemoveAll({required Widget screen, required BuildContext context});
  void back();
}


