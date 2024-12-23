import 'package:flutter/material.dart';
import 'package:morgenfrost/digital.dart';
import 'package:morgenfrost/drawing.dart';
import 'package:morgenfrost/maya.dart';
import 'package:morgenfrost/painting.dart';
import 'package:morgenfrost/vector.dart';
import 'package:url_launcher/url_launcher.dart';

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

  List<bool> isHovering = [false, false, false, false, false, false, false];

  final double circlePaintingPosTop = 0.2;
  final double circlePaintingPosLeft = 0.35;

  final double circleDrawingPosTop = 0.45;
  final double circleDrawingPosLeft = 0.55;

  final double circleDigitalPosTop = 0.55;
  final double circleDigitalPosLeft = 0.2;

  final double circleVectorPosTop = 0.22;
  final double circleVectorPosLeft = 0.75;

  final double circleMayaPosTop = 0.8;
  final double circleMayaPosLeft = 0.8;

  final double circleFimoPosTop = 0.75;
  final double circleFimoPosLeft = 0.4;

  List<Image> list = [
    Image.asset('assets/icons/kofi.png'),
    Image.asset('assets/icons/paypal.png'),
    Image.asset('assets/icons/patreon.png'),
    Image.asset('assets/icons/buy-me-a-coffee.png'),
    Image.asset('assets/icons/mastodon.png'),
    Image.asset('assets/icons/matrix.png'),
    Image.asset('assets/icons/github.png')
  ];

  List<Uri> urls = [
    Uri.parse('https://ko-fi.com/mario_schmid'),
    Uri.parse('https://www.paypal.com/paypalme/MarioSchmid1313'),
    Uri.parse('https://www.patreon.com/c/mario_schmid'),
    Uri.parse('https://buymeacoffee.com/mario_schmid'),
    Uri.parse('https://mastodon.social/@morgenfrost'),
    Uri.parse('https://matrix.to/#/@morgenfrost:matrix.org'),
    Uri.parse('https://github.com/mario-schmid')
  ];

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

    circlePaintingSize = size.width * 0.1 + size.height * 0.1;
    circleDrawingSize = size.width * 0.1 + size.height * 0.1;
    circleDigitalSize = size.width * 0.1 + size.height * 0.1;
    circleVectorSize = size.width * 0.1 + size.height * 0.1;
    circleFimoSize = size.width * 0.1 + size.height * 0.1;
    circleMayaSize = size.width * 0.07 + size.height * 0.07;
    borderSideSize = size.width * 0.001 + size.height * 0.001;
    fontSize = size.width * 0.014 + size.height * 0.014;

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
                  top: size.height * circlePaintingPosTop -
                      circlePaintingSize / 2,
                  left: size.width * circlePaintingPosLeft -
                      circlePaintingSize / 2,
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
                                        AssetImage('assets/images/circle.jpg'),
                                    fit: BoxFit.cover)),
                            child: Center(
                                child: Text('painting...',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: fontSize)))),
                      ))),
              Positioned(
                  top:
                      size.height * circleDrawingPosTop - circleDrawingSize / 2,
                  left:
                      size.width * circleDrawingPosLeft - circleDrawingSize / 2,
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
                                        AssetImage('assets/images/circle.jpg'),
                                    fit: BoxFit.cover)),
                            child: Center(
                                child: Text('drawing...',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: fontSize)))),
                      ))),
              Positioned(
                  top:
                      size.height * circleDigitalPosTop - circleDigitalSize / 2,
                  left:
                      size.width * circleDigitalPosLeft - circleDigitalSize / 2,
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
                                        AssetImage('assets/images/circle.jpg'),
                                    fit: BoxFit.cover)),
                            child: Center(
                                child: Text('digital...',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: fontSize)))),
                      ))),
              Positioned(
                  top: size.height * circleVectorPosTop - circleVectorSize / 2,
                  left: size.width * circleVectorPosLeft - circleVectorSize / 2,
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
                                        AssetImage('assets/images/circle.jpg'),
                                    fit: BoxFit.cover)),
                            child: Center(
                                child: Text('vector...',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: fontSize)))),
                      ))),
              Positioned(
                  top: size.height * circleMayaPosTop - circleMayaSize / 2,
                  left: size.width * circleMayaPosLeft - circleMayaSize / 2,
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
                                        AssetImage('assets/images/circle.jpg'),
                                    fit: BoxFit.cover)),
                            child: Center(
                                child: Text('maya...',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: fontSize)))),
                      ))),
              Positioned(
                  top: size.height * circleFimoPosTop - circleFimoSize / 2,
                  left: size.width * circleFimoPosLeft - circleFimoSize / 2,
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
                            height: circleFimoSize,
                            width: circleFimoSize,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Colors.white, width: borderSideSize),
                                image: const DecorationImage(
                                    image:
                                        AssetImage('assets/images/circle.jpg'),
                                    fit: BoxFit.cover)),
                            child: Center(
                                child: Text('fimo...',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: fontSize)))),
                      ))),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        height: 60,
                        width: 420,
                        child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 7,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 7),
                            itemBuilder: (conterxt, index) {
                              return Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: InkWell(
                                  onTap: () {},
                                  onHover: (value) {
                                    setState(() {
                                      isHovering[index] = value;
                                    });
                                  },
                                  child: Transform.scale(
                                    scale: isHovering[index] ? 1.1 : 1,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: Colors.white, width: 1),
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/circle.jpg'),
                                              fit: BoxFit.cover)),
                                      child: IconButton(
                                          padding: const EdgeInsets.all(10),
                                          onPressed: () {
                                            _launchUrl(urls[index]);
                                          },
                                          icon: list[index]),
                                    ),
                                  ),
                                ),
                              );
                            })),
                  ))
            ])));
  }
}

Future<void> _launchUrl(Uri url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
