


import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';
import 'package:tagmak/core/routing/navigation_services.dart';


class FlexifyRouting implements NavigationService {

  
  @override

  void go({required Widget screen, FlexifyRouteAnimations animation = FlexifyRouteAnimations.slide}) {
    Flexify.go(
      screen,
      animation: animation,
      animationDuration: const Duration(milliseconds: 500),
    );
  }

  @override
  void goRemove({required Widget screen}) {
    Flexify.goRemove(
      screen,
      animation: FlexifyRouteAnimations.slide,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void goRemoveAll({required Widget screen, required BuildContext context}) {
    Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (context) => screen), (route) => false);
  }

  @override
  void back() {
    Flexify.back();
  }
}

