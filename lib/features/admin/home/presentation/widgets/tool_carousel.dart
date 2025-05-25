import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:tagmak/features/admin/home/presentation/provider/carousel_provider.dart';
// import your provider

class ToolCarousel extends StatelessWidget {
  final List<String> assetImages;

  const ToolCarousel({super.key, required this.assetImages});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 180,
            enlargeCenterPage: true,
            autoPlay: true,
            viewportFraction: 0.9,
            aspectRatio: 16 / 9,
            autoPlayInterval: const Duration(seconds: 4),
            onPageChanged: (index, reason) {
              Provider.of<CarouselProvider>(
                context,
                listen: false,
              ).updateIndex(index);
            },
          ),
          items:
              assetImages.map((assetPath) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    assetPath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                );
              }).toList(),
        ),
        const SizedBox(height: 8),
        Consumer<CarouselProvider>(
          builder: (context, provider, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(assetImages.length, (index) {
                final isActive = provider.currentIndex == index;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: isActive ? 16 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    //525252
                    color: const Color(0xFF525252),
                    borderRadius: BorderRadius.circular(8),
                  ),
                );
              }),
            );
          },
        ),
      ],
    );
  }
}
