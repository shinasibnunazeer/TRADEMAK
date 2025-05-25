import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';
import 'package:tagmak/core/theme/colors.dart';

class ToolTileEmp extends StatelessWidget {
  final String toolname;
  final String jobDescription;
  final String employeeId;
  final String imagePath;
  final VoidCallback onAssignTap;
  final bool isAdd;

  const ToolTileEmp({
    super.key,
    required this.toolname,
    required this.jobDescription,
    required this.employeeId,
    required this.imagePath,
    required this.onAssignTap,
    required this.isAdd,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onAssignTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        padding: const EdgeInsets.all(12),
        // decoration: BoxDecoration(
        //   color: AppColors.primaryDark,
        //   borderRadius: BorderRadius.circular(16),
        // ),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: const Color(0xFF2F343A),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 0),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8), // use 0 for sharp corners
              child: Image.asset(
                imagePath,
                width: 56,
                height: 56,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 56,
                    height: 56,
                    // color: Colors.grey[800],
                    color: AppColors.darkGrey,
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.error,
                      color: Colors.white54,
                      size: 24,
                    ),
                  );
                },
              ),
            ),

            // CircleAvatar(radius: 28, backgroundImage: AssetImage(imagePath)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    toolname,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    jobDescription,
                    style: const TextStyle(fontSize: 8, color: Colors.white70),
                  ),
                  Text(
                    employeeId,
                    style: const TextStyle(fontSize: 8, color: Colors.white70),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: onAssignTap,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                // width: 55.rw,
                // height: 20.rh,
                decoration: ShapeDecoration(
                  color: const Color(0xFF1C1C1C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),

                // onPressed: onAssignTap,
                // style: ElevatedButton.styleFrom(
                //   backgroundColor: AppColors.primaryDark,
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(8),
                //   ),
                //   padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                // ),
                child: Row(
                  children: [
                    Text(
                      isAdd ? 'Add item' : 'Remove',
                      style: TextStyle(
                        fontSize: 9.rt,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 4.rw),
                    Icon(
                      isAdd ? Icons.add : Icons.delete_outline_sharp,
                      size: 14.rw,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
