import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tagmak/core/constants/app_images.dart';
import 'package:tagmak/core/constants/app_sizes.dart';
import 'package:tagmak/features/admin/employees/presentation/widgets/approval_card_widget.dart';
import 'package:tagmak/features/admin/employees/presentation/widgets/tool_tile_emp.dart';
import 'package:tagmak/features/emp/add_device/presentation/screens/screen_add_device.dart';

class ScreenEmpToolList extends StatefulWidget {
  const ScreenEmpToolList({super.key});

  @override
  State<ScreenEmpToolList> createState() => _ScreenEmpToolListState();
}

class _ScreenEmpToolListState extends State<ScreenEmpToolList> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSizes.pagePadding),
          child: ListView.builder(
            itemCount: 5,

            // separatorBuilder:
            //     (context, in2dex) => const SizedBox(height: 0),
            itemBuilder: (context, index) {
              return ToolTileEmp(
                toolname: "Product Name",
                jobDescription: 'Brand Name',
                employeeId: 'Product ID',
                imagePath: AppImages.driller,
                isAdd: isAdd[index],
                onAssignTap: () {
                 
                  // Handle button tap
                },
              );
            },
          ),
        ),
      ),
    );
  }

  List<bool> get isAdd => [true, false, true, false, true];
}
