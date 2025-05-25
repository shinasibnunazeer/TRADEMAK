

import 'package:flutter/material.dart';

class TempNavigation {

  static  tempNavigation(context,  Widget screen) {
       Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  screen, // Replace with your screen
                        ),
                      );

  }
 
}
