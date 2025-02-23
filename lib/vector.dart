import 'package:flutter/material.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';

class Vector extends StatelessWidget {
  Vector({super.key});

  final List<Image> list = [
    Image.asset('assets/images/vector/mushroom-house-landscape.jpg', fit: BoxFit.cover),
    Image.asset('assets/images/vector/pyramids.jpg', fit: BoxFit.cover),
    Image.asset('assets/images/vector/sign.png', fit: BoxFit.cover),
    Image.asset('assets/images/vector/leaves.jpg', fit: BoxFit.cover),
    Image.asset('assets/images/vector/spiral.jpg', fit: BoxFit.cover),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    EdgeInsets edgeInsets = EdgeInsets.symmetric(horizontal: size.width * 0.18, vertical: size.width * 0.04);

    return Container(
      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/background.jpg'), fit: BoxFit.cover)),
      height: double.infinity,
      width: double.infinity,
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: edgeInsets,
            child: GestureDetector(
              onTap: () {
                showImageViewer(context, list[index].image, swipeDismissible: false);
              },
              child: list[index],
            ),
          );
        },
      ),
    );
  }
}
