import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0x11D9D9D9), // Dark background
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF5F5F5F), // Gray border
          width: 1,
        ),
      ),
      child: Row(
        children: [
          const Expanded(
            child: TextField(
              style: TextStyle(color: Colors.grey),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              cursorColor: Colors.grey,
            ),
          ),
          Icon(
            Icons.search,
            color: Colors.grey.shade500, // Gray search icon
            size: 24,
          ),
        ],
      ),
    );
  }
}
