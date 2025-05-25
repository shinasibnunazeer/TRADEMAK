import 'package:flutter/material.dart';
import 'package:tagmak/core/constants/app_images.dart';
import 'package:tagmak/core/constants/app_sizes.dart';
import 'package:tagmak/core/widgets/common_button.dart';
import 'package:tagmak/features/admin/employees/presentation/widgets/add_profile_header.dart';

class ScreenAddEmpProfileScreen extends StatelessWidget {
  const ScreenAddEmpProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController mobileController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController jobTitleController = TextEditingController();
    final TextEditingController departmentController = TextEditingController();

    return Scaffold(
      // backgroundColor: Colors.white,
      // backgroundColor: Color(0xFF1E1E1E),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.pagePadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 32),

              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      radius: 66,
                      backgroundImage: AssetImage(
                        AppImages.samEmp,
                      ), // Replace with real image
                    ),
                  ),
                  Positioned(
                    bottom: 6,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.camera_alt, color: Colors.white, size: 14),
                          SizedBox(width: 4),
                          Text(
                            "Change photo",
                            style: TextStyle(color: Colors.white, fontSize: 8),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              _buildTextField(label: "Name", controller: nameController),
              _buildTextField(
                label: "Email address",
                controller: emailController,
              ),
              _buildTextField(label: "Mobile", controller: mobileController),
              _buildTextField(
                label: "Address",
                controller: addressController,
                maxLines: 4,
              ),
              _buildTextField(
                label: "Job Title",
                controller: jobTitleController,
              ),
              _buildTextField(
                label: "Department",
                controller: departmentController,
              ),
              const SizedBox(height: 32),
              CommonButton(label: "Save"),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: const TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.orange),
            borderRadius: BorderRadius.circular(12),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          filled: true,
          fillColor: Color(0xFF1E1E1E),
        ),
      ),
    );
  }
}
