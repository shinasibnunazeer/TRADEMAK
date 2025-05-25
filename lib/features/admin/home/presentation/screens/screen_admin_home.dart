// import 'package:flexify/flexify.dart';
// import 'package:flutter/material.dart';
// import 'package:tagmak/core/constants/app_images.dart';
// import 'package:tagmak/core/constants/app_sizes.dart';
// import 'package:tagmak/core/widgets/common_filter_button.dart';
// import 'package:tagmak/core/widgets/common_text_button.dart';
// import 'package:tagmak/core/widgets/custom_search_bar.dart';
// import 'package:tagmak/features/admin/home/presentation/widgets/admin_profile_header.dart';
// import 'package:tagmak/features/admin/employees/presentation/widgets/employee_tile.dart';
// import 'package:tagmak/features/admin/home/presentation/widgets/tool_carousel.dart';

// class ScreenAdminHome extends StatelessWidget {
//   const ScreenAdminHome({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           physics: NeverScrollableScrollPhysics(),
//           child: Column(
//             spacing: 20,
//             children: [
//               AdminProfileHeader(),
//               ToolCarousel(
//                 assetImages: [
//                   AppImages.courosel,
//                   AppImages.courosel,
//                   AppImages.courosel,
//                   AppImages.courosel,
//                 ],
//               ),
//               Container(
//                 height: 800.rh,
//                 width: double.infinity,
//                 decoration: ShapeDecoration(
//                   color: const Color(0xFF2F343A),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(21),
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     SizedBox(height: 25),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: AppSizes.pagePadding,
//                       ),
//                       child: Row(
//                         children: [
//                           Text(
//                             'Employee List',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 20,

//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                           Spacer(),
//                           CommonTextButton(text: 'View all'),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(AppSizes.pagePadding),
//                       child: Row(
//                         children: [
//                           Expanded(child: CustomSearchBar()),
//                           SizedBox(width: 10),
//                           CommonFilterButton(),
//                         ],
//                       ),
//                     ),
//                     Expanded(
//                       child: ListView.builder(
//                         itemCount: 10,

//                         // separatorBuilder:
//                         //     (context, index) => const SizedBox(height: 0),
//                         itemBuilder: (context, index) {
//                           return EmployeeTile(
//                             name: 'Rahul Ravi',
//                             jobDescription: 'Job Description',
//                             employeeId: 'Employee ID',
//                             joinDate: 'Join Date',
//                             imagePath: "assets/images/sam_emp.png",
//                             onAssignTap: () {
//                               // Handle button tap
//                             },
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               // Add your device list or any other widgets here
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
