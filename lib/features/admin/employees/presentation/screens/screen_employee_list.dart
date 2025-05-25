import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tagmak/core/constants/app_sizes.dart';
import 'package:tagmak/core/constants/svg_strings.dart';
import 'package:tagmak/core/routing/navigation_services.dart';
import 'package:tagmak/core/routing/temp_navigation.dart';
import 'package:tagmak/core/widgets/common_filter_button.dart';
import 'package:tagmak/core/widgets/common_text_button.dart';
import 'package:tagmak/core/widgets/custom_search_bar.dart';
import 'package:tagmak/features/admin/employees/presentation/screens/screen_add_emp_profile.dart';
import 'package:tagmak/features/admin/employees/presentation/screens/screen_emp_tool_list.dart';
import 'package:tagmak/features/admin/employees/presentation/widgets/employee_tile.dart';
import 'package:tagmak/features/emp/profile/presentation/screens/screen_admin_profile.dart';
import 'package:tagmak/injection.dart';
import "package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart";

class ScreenEmployeeList extends StatelessWidget {
  const ScreenEmployeeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.pagePadding,
              ),
              child: Text(
                'Employee List',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,

                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.pagePadding,
              ),
              child: Row(
                children: [
                  Expanded(child: CustomSearchBar()),
                  SizedBox(width: 10),
                  CommonFilterButton(
                    svgIcon: SvgStrings.svgaddPerson,
                    onPressed: () {
                      TempNavigation.tempNavigation(
                        context,
                        ScreenAddEmpProfileScreen(),
                      );

                      //         PersistentNavBarNavigator.pushNewScreen(
                      //   context,
                      //   screen: ConfirmOrderScreen(fromBuyNow: true,
                      //     cartList: const [],
                      //     inventoryIds: const [],
                      //     orderId: state.directBuyOrderReturn?.orderId ?? 0,
                      //   ),
                      //   withNavBar: false, // OPTIONAL VALUE. True by default.
                      //   pageTransitionAnimation: PageTransitionAnimation.fade,
                      // );

                      // getIt<NavigationService>().go(
                      //   screen: ScreenAddEmpProfileScreen(),
                      // );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: 3,

                // separatorBuilder:
                //     (context, index) => const SizedBox(height: 0),
                itemBuilder: (context, index) {
                  return EmployeeTile(
                    name: exEmployeeList[index],
                    jobDescription: 'Job Description',
                    employeeId: 'Employee ID',
                    joinDate: 'Join Date',
                    imagePath: "assets/images/sam_emp.png",
                    onImageTap: () {
                      TempNavigation.tempNavigation(
                        context,
                        ScreenAdminProfile(),
                      );
                    },
                    onAssignTap: () {
                      TempNavigation.tempNavigation(
                        context,
                        ScreenEmpToolList(),
                      );

                      // Handle button tap
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  static const List<String> exEmployeeList = [
    'Rahul Ravi',
    'John Doe',
    'Jane Smith',
    'Alice Johnson',
    'Bob Brown',
  ];
}
