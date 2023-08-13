import 'package:flutter/material.dart';
import 'package:image_pixels/image_pixels.dart';

class CircularProfileWidget extends StatelessWidget {
  const CircularProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String imageUrl =
        // "https://images.unsplash.com/photo-1600600423621-70c9f4416ae9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1888&q=80";
        "https://images.unsplash.com/photo-1464863979621-258859e62245?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=386&q=80";
    return ImagePixels(
      imageProvider: NetworkImage(imageUrl),
      builder: (context, img) {
        return Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: img.pixelColorAtAlignment!(Alignment.topLeft),
                blurRadius: 100,
                spreadRadius: 35,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(120),
            child: Image.network(
              imageUrl,
              width: 120,
              height: 120,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return const Icon(
                    Icons.account_circle_rounded,
                    size: 120,
                    color: Colors.grey,
                  );
                }
              },
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}