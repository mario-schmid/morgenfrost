import 'package:flutter/material.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:simple_shadow/simple_shadow.dart';

class Digital extends StatelessWidget {
  Digital({super.key});

  final List<Image> list = [
    Image.asset('assets/images/digital/mushroom-house-landscape.jpg', fit: BoxFit.contain),
    Image.asset('assets/images/digital/mushroom.jpg', fit: BoxFit.contain),
    Image.asset('assets/images/digital/moon-and-stars.jpg', fit: BoxFit.contain),
    Image.asset('assets/images/digital/tree.jpg', fit: BoxFit.contain),
    Image.asset('assets/images/digital/leaves.jpg', fit: BoxFit.contain),
    Image.asset('assets/images/digital/snow-landscape.jpg', fit: BoxFit.contain),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    EdgeInsets edgeInsets = EdgeInsets.symmetric(horizontal: size.width * 0.18, vertical: size.width * 0.04);
    double sigma = size.width * 0.01;

    return Container(
      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/background.jpg'), fit: BoxFit.fill)),
      height: double.infinity,
      width: double.infinity,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1, childAspectRatio: 1 / .6),
        itemBuilder: (context, index) {
          return Padding(
            padding: edgeInsets,
            child: GestureDetector(
              onTap: () {
                showImageViewer(context, list[index].image, swipeDismissible: false);
              },
              child: SimpleShadow(opacity: 1.0, color: Colors.black, offset: Offset(0, 0), sigma: sigma, child: Center(child: list[index])),
            ),
          );
        },
        itemCount: list.length,
      ),
    );
  }
}
