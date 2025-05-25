import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  final String imagePath;
  final VoidCallback onChangePhoto;

  const CustomHeader({
    super.key,
    required this.imagePath,
    required this.onChangePhoto,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        // Header background
        Container(
          height: 160,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF4A0D09), Color(0xFF20091D)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        // Black arc cutting in
        // Positioned(
        //   top: 130,
        //   child: Container(
        //     height: 60,
        //     width: MediaQuery.of(context).size.width,
        //     decoration: const BoxDecoration(
        //       color: Color(0xFF1E1E1E),
        //       borderRadius: BorderRadius.vertical(
        //         top: Radius.circular(120),
        //       ),
        //     ),
        //   ),
        // ),
        // Profile image + Change button
        // Positioned(
        //   top: 80,
        //   child: GestureDetector(
        //     onTap: onChangePhoto,
        //     child: Stack(
        //       alignment: Alignment.bottomCenter,
        //       children: [
        //         CircleAvatar(
        //           radius: 60,
        //           backgroundColor: Colors.black,
        //           child: CircleAvatar(
        //             radius: 58,
        //             backgroundImage: AssetImage(imagePath),
        //           ),
        //         ),
        // Container(
        //   width: 120,
        //   padding: const EdgeInsets.symmetric(vertical: 4),
        //   decoration: BoxDecoration(
        //     color: Colors.black.withOpacity(0.6),
        //     borderRadius: const BorderRadius.vertical(
        //       bottom: Radius.circular(60),
        //     ),
        //   ),
        //   child: const Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Icon(Icons.camera_alt, color: Colors.white, size: 14),
        //       SizedBox(width: 4),
        //       Text(
        //         'Change photo',
        //         style: TextStyle(
        //           color: Colors.white,
        //           fontSize: 10,
        //           fontFamily: 'Poppins',
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
