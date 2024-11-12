import 'package:flutter/material.dart';
import 'package:morgenfrost/digital.dart';
import 'package:morgenfrost/drawing.dart';
import 'package:morgenfrost/painting.dart';
import 'package:morgenfrost/maya.dart';
import 'package:morgenfrost/vector.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isHoveringPainting = false;
  bool isHoveringDrawing = false;
  bool isHoveringDigital = false;
  bool isHoveringVector = false;
  bool isHoveringMaya = false;
  bool isHoveringFimo = false;

  final double circlePaintingPosTop = 0.4;
  final double circlePaintingPosLeft = 0.45;

  final double circleDrawingPosTop = 0.7;
  final double circleDrawingPosLeft = 0.7;

  final double circleDigitalPosTop = 0.75;
  final double circleDigitalPosLeft = 0.24;

  final double circleVectorPosTop = 0.3;
  final double circleVectorPosLeft = 0.85;

  final double circleMayaPosTop = 0.95;
  final double circleMayaPosLeft = 0.95;

  final double circleFimoPosTop = 0.95;
  final double circleFimoPosLeft = 0.5;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    late double circlePaintingSize;
    late double circleDrawingSize;
    late double circleDigitalSize;
    late double circleVectorSize;
    late double circleMayaSize;
    late double circleFimoSize;

    late double borderSideSize;
    late double fontSize;

    if (size.height > size.width) {
      circlePaintingSize = size.width * 0.30;
      circleDrawingSize = size.width * 0.30;
      circleDigitalSize = size.width * 0.20;
      circleVectorSize = size.width * 0.25;
      circleFimoSize = size.width * 0.25;
      circleMayaSize = size.width * 0.17;
      borderSideSize = size.width * 0.002;
      fontSize = size.width * 0.04;
    } else {
      circlePaintingSize = size.height * 0.30;
      circleDrawingSize = size.height * 0.30;
      circleDigitalSize = size.height * 0.20;
      circleVectorSize = size.height * 0.25;
      circleFimoSize = size.height * 0.25;
      circleMayaSize = size.height * 0.17;
      borderSideSize = size.height * 0.002;
      fontSize = size.height * 0.04;
    }

    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background.jpg'),
                    fit: BoxFit.cover)),
            height: double.infinity,
            width: double.infinity,
            child: Stack(children: [
              Positioned(
                  top: size.height * circlePaintingPosTop - circlePaintingSize,
                  left: size.width * circlePaintingPosLeft - circlePaintingSize,
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Painting()));
                      },
                      onHover: (value) {
                        setState(() {
                          isHoveringPainting = value;
                        });
                      },
                      child: Transform.scale(
                        scale: isHoveringPainting ? 0.95 : 1,
                        child: Container(
                            height: circlePaintingSize,
                            width: circlePaintingSize,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Colors.white, width: borderSideSize),
                                image: const DecorationImage(
                                    image:
                                        AssetImage('assets/images/pattern.jpg'),
                                    fit: BoxFit.cover)),
                            child: Center(
                                child: Text('painting...',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: fontSize)))),
                      ))),
              Positioned(
                  top: size.height * circleDrawingPosTop - circleDrawingSize,
                  left: size.width * circleDrawingPosLeft - circleDrawingSize,
                  child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Drawing()));
                      },
                      onHover: (value) {
                        setState(() {
                          isHoveringDrawing = value;
                        });
                      },
                      child: Transform.scale(
                        scale: isHoveringDrawing ? 0.95 : 1,
                        child: Container(
                            height: circleDrawingSize,
                            width: circleDrawingSize,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Colors.white, width: borderSideSize),
                                image: const DecorationImage(
                                    image:
                                        AssetImage('assets/images/pattern.jpg'),
                                    fit: BoxFit.cover)),
                            child: Center(
                                child: Text('drawing...',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: fontSize)))),
                      ))),
              Positioned(
                  top: size.height * circleDigitalPosTop - circleDigitalSize,
                  left: size.width * circleDigitalPosLeft - circleDigitalSize,
                  child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Digital()));
                      },
                      onHover: (value) {
                        setState(() {
                          isHoveringDigital = value;
                        });
                      },
                      child: Transform.scale(
                        scale: isHoveringDigital ? 0.95 : 1,
                        child: Container(
                            height: circleDigitalSize,
                            width: circleDigitalSize,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Colors.white, width: borderSideSize),
                                image: const DecorationImage(
                                    image:
                                        AssetImage('assets/images/pattern.jpg'),
                                    fit: BoxFit.cover)),
                            child: Center(
                                child: Text('digital...',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: fontSize)))),
                      ))),
              Positioned(
                  top: size.height * circleVectorPosTop - circleVectorSize,
                  left: size.width * circleVectorPosLeft - circleVectorSize,
                  child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Vector()));
                      },
                      onHover: (value) {
                        setState(() {
                          isHoveringVector = value;
                        });
                      },
                      child: Transform.scale(
                        scale: isHoveringVector ? 0.95 : 1,
                        child: Container(
                            height: circleVectorSize,
                            width: circleVectorSize,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Colors.white, width: borderSideSize),
                                image: const DecorationImage(
                                    image:
                                        AssetImage('assets/images/pattern.jpg'),
                                    fit: BoxFit.cover)),
                            child: Center(
                                child: Text('vector...',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: fontSize)))),
                      ))),
              Positioned(
                  top: size.height * circleMayaPosTop - circleMayaSize,
                  left: size.width * circleMayaPosLeft - circleMayaSize,
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Maya()));
                      },
                      onHover: (value) {
                        setState(() {
                          isHoveringMaya = value;
                        });
                      },
                      child: Transform.scale(
                        scale: isHoveringMaya ? 0.95 : 1,
                        child: Container(
                            height: circleMayaSize,
                            width: circleMayaSize,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Colors.white, width: borderSideSize),
                                image: const DecorationImage(
                                    image:
                                        AssetImage('assets/images/pattern.jpg'),
                                    fit: BoxFit.cover)),
                            child: Center(
                                child: Text('maya...',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: fontSize)))),
                      ))),
              Positioned(
                  top: size.height * circleFimoPosTop - circleFimoSize,
                  left: size.width * circleFimoPosLeft - circleFimoSize,
                  child: InkWell(
                      onTap: () {},
                      onHover: (value) {
                        setState(() {
                          isHoveringFimo = value;
                        });
                      },
                      child: Transform.scale(
                        scale: isHoveringFimo ? 0.95 : 1,
                        child: Container(
                            height: circleMayaSize,
                            width: circleMayaSize,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Colors.white, width: borderSideSize),
                                image: const DecorationImage(
                                    image:
                                        AssetImage('assets/images/pattern.jpg'),
                                    fit: BoxFit.cover)),
                            child: Center(
                                child: Text('fimo...',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: fontSize)))),
                      )))
            ])));
  }
}
