import 'package:flutter/material.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';

class Painting extends StatelessWidget {
  Painting({super.key});

  final List<Image> list = [
    Image.asset('assets/images/paintings/under-a-red-sky.jpg'),
    Image.asset('assets/images/paintings/mushroom-family.jpg'),
    Image.asset('assets/images/paintings/beautiful-world.jpg'),
    Image.asset('assets/images/paintings/pink-flower.jpg'),
    Image.asset('assets/images/paintings/bloom.jpg'),
    Image.asset('assets/images/paintings/flowers.jpg'),
    Image.asset('assets/images/paintings/star.jpg'),
    Image.asset('assets/images/paintings/waves.jpg'),
    Image.asset('assets/images/paintings/house.jpg'),
    Image.asset('assets/images/paintings/butterflys.jpg')
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double padding = size.width * 0.03 + size.height * 0.03;
    EdgeInsets edgeInsets = EdgeInsets.fromLTRB(padding, padding, padding, 0);
    EdgeInsets edgeInsetsEnd =
        EdgeInsets.fromLTRB(padding, padding, padding, padding);

    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover)),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
            child: Column(children: [
          Padding(
              padding: edgeInsets,
              child: GestureDetector(
                  onTap: () {
                    showImageViewer(context, list[0].image,
                        swipeDismissible: false);
                  },
                  child: list[0])),
          Padding(
              padding: edgeInsets,
              child: GestureDetector(
                  onTap: () {
                    showImageViewer(context, list[1].image,
                        swipeDismissible: false);
                  },
                  child: list[1])),
          Padding(
              padding: edgeInsets,
              child: GestureDetector(
                  onTap: () {
                    showImageViewer(context, list[2].image,
                        swipeDismissible: false);
                  },
                  child: list[2])),
          Padding(
              padding: edgeInsets,
              child: GestureDetector(
                  onTap: () {
                    showImageViewer(context, list[3].image,
                        swipeDismissible: false);
                  },
                  child: list[3])),
          Padding(
              padding: edgeInsets,
              child: GestureDetector(
                  onTap: () {
                    showImageViewer(context, list[4].image,
                        swipeDismissible: false);
                  },
                  child: list[4])),
          Padding(
              padding: edgeInsets,
              child: GestureDetector(
                  onTap: () {
                    showImageViewer(context, list[5].image,
                        swipeDismissible: false);
                  },
                  child: list[5])),
          Padding(
              padding: edgeInsets,
              child: GestureDetector(
                  onTap: () {
                    showImageViewer(context, list[6].image,
                        swipeDismissible: false);
                  },
                  child: list[6])),
          Padding(
              padding: edgeInsets,
              child: GestureDetector(
                  onTap: () {
                    showImageViewer(context, list[7].image,
                        swipeDismissible: false);
                  },
                  child: list[7])),
          Padding(
              padding: edgeInsets,
              child: GestureDetector(
                  onTap: () {
                    showImageViewer(context, list[8].image,
                        swipeDismissible: false);
                  },
                  child: list[8])),
          Padding(
              padding: edgeInsetsEnd,
              child: GestureDetector(
                  onTap: () {
                    showImageViewer(context, list[9].image,
                        swipeDismissible: false);
                  },
                  child: list[9]))
        ])));
  }
}
