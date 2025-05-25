import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';
import 'package:tagmak/core/constants/app_images.dart';

class ProductImageInTile extends StatelessWidget {
  const ProductImageInTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              AppImages
                  .driller, // replace with your image asset or network path
              width: 60.rw,
              height: 47.rh,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            "View Details",
            style: TextStyle(color: Colors.white70, fontSize: 10.rt),
          ),
        ],
      ),
    );
  }
}
