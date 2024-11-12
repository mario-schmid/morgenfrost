import 'package:flutter/material.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';

class Drawing extends StatelessWidget {
  Drawing({super.key});

  final List<Image> list = [
    Image.asset('assets/images/drawings/heart.jpg'),
    Image.asset('assets/images/drawings/face.jpg'),
    Image.asset('assets/images/drawings/flower.jpg'),
    Image.asset('assets/images/drawings/flower02.jpg'),
    Image.asset('assets/images/drawings/flower03.jpg'),
    Image.asset('assets/images/drawings/heart02.jpg')
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
              padding: edgeInsetsEnd,
              child: GestureDetector(
                  onTap: () {
                    showImageViewer(context, list[4].image,
                        swipeDismissible: false);
                  },
                  child: list[4]))
        ])));
  }
}
