import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:morgenfrost/digital.dart';
import 'package:morgenfrost/drawing.dart';
import 'package:morgenfrost/coding.dart';
import 'package:morgenfrost/painting.dart';
import 'package:morgenfrost/vector.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const HomePage());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const MyHomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'painting',
          builder: (BuildContext context, GoRouterState state) {
            return Painting();
          },
        ),
        GoRoute(
          path: 'drawing',
          builder: (BuildContext context, GoRouterState state) {
            return Drawing();
          },
        ),
        GoRoute(
          path: 'digital',
          builder: (BuildContext context, GoRouterState state) {
            return Digital();
          },
        ),
        GoRoute(
          path: 'vector',
          builder: (BuildContext context, GoRouterState state) {
            return Vector();
          },
        ),
        GoRoute(
          path: 'coding',
          builder: (BuildContext context, GoRouterState state) {
            return Coding();
          },
        ),
      ],
    ),
  ],
);

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(debugShowCheckedModeBanner: false, routerConfig: _router);
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
  bool isHoveringCoding = false;
  bool isHoveringFimo = false;

  List<bool> isHovering = [false, false, false, false, false, false, false];

  /*final double circlePaintingPosTop = 0.2;
  final double circlePaintingPosLeft = 0.35;

  final double circleDrawingPosTop = 0.45;
  final double circleDrawingPosLeft = 0.55;

  final double circleDigitalPosTop = 0.55;
  final double circleDigitalPosLeft = 0.2;

  final double circleVectorPosTop = 0.22;
  final double circleVectorPosLeft = 0.75;

  final double circleCodingPosTop = 0.8;
  final double circleCodingPosLeft = 0.8;

  final double circleFimoPosTop = 0.75;
  final double circleFimoPosLeft = 0.4;*/

  final double circlePaintingPosTop = 0.20;
  final double circlePaintingPosLeft = 0.40;

  final double circleDrawingPosTop = 0.36;
  final double circleDrawingPosLeft = 0.60;

  final double circleDigitalPosTop = 0.40;
  final double circleDigitalPosLeft = 0.2;

  final double circleVectorPosTop = 0.22;
  final double circleVectorPosLeft = 0.80;

  final double circleCodingPosTop = 0.60;
  final double circleCodingPosLeft = 0.74;

  final double circleFimoPosTop = 0.56;
  final double circleFimoPosLeft = 0.44;

  List<Image> list = [
    Image.asset('assets/icons/kofi.png'),
    Image.asset('assets/icons/liberapay.png'),
    Image.asset('assets/icons/patreon.png'),
    Image.asset('assets/icons/buy-me-a-coffee.png'),
    Image.asset('assets/icons/mastodon.png'),
    Image.asset('assets/icons/matrix.png'),
    Image.asset('assets/icons/gitlab.png'),
  ];

  List<Uri> urls = [
    Uri.parse('https://ko-fi.com/morgenfrost'),
    Uri.parse('https://de.liberapay.com/morgenfrost'),
    Uri.parse('https://www.patreon.com/c/morgenfrost'),
    Uri.parse('https://buymeacoffee.com/morgenfrost'),
    Uri.parse('https://mastodon.social/@morgenfrost'),
    Uri.parse('https://matrix.to/#/@morgenfrost:matrix.org'),
    Uri.parse('https://gitlab.com/morgenfrost'),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double circlePaintingSize = size.width * 0.09 + size.height * 0.1;
    double circleDrawingSize = size.width * 0.09 + size.height * 0.1;
    double circleDigitalSize = size.width * 0.09 + size.height * 0.1;
    double circleVectorSize = size.width * 0.09 + size.height * 0.1;
    double circleFimoSize = size.width * 0.09 + size.height * 0.1;
    double circleCodingSize = size.width * 0.09 + size.height * 0.07;

    double borderSideSize = size.width * 0.003 + size.height * 0.003;
    double fontSize = size.width * 0.016 + size.height * 0.016;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/main-background.jpg'), fit: BoxFit.fill)),
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: size.height * circlePaintingPosTop - circlePaintingSize / 2,
              left: size.width * circlePaintingPosLeft - circlePaintingSize / 2,
              child: InkWell(
                onTap: () => context.go('/painting'),
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
                    decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white, width: borderSideSize)),
                    child: Center(child: Text('painting...', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: fontSize))),
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.height * circleDrawingPosTop - circleDrawingSize / 2,
              left: size.width * circleDrawingPosLeft - circleDrawingSize / 2,
              child: InkWell(
                onTap: () => context.go('/drawing'),
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
                    decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white, width: borderSideSize)),
                    child: Center(child: Text('drawing...', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: fontSize))),
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.height * circleDigitalPosTop - circleDigitalSize / 2,
              left: size.width * circleDigitalPosLeft - circleDigitalSize / 2,
              child: InkWell(
                onTap: () => context.go('/digital'),

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
                    decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white, width: borderSideSize)),
                    child: Center(child: Text('digital...', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: fontSize))),
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.height * circleVectorPosTop - circleVectorSize / 2,
              left: size.width * circleVectorPosLeft - circleVectorSize / 2,
              child: InkWell(
                onTap: () => context.go('/vector'),

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
                    decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white, width: borderSideSize)),
                    child: Center(child: Text('vector...', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: fontSize))),
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.height * circleCodingPosTop - circleCodingSize / 2,
              left: size.width * circleCodingPosLeft - circleCodingSize / 2,
              child: InkWell(
                onTap: () => context.go('/coding'),
                onHover: (value) {
                  setState(() {
                    isHoveringCoding = value;
                  });
                },
                child: Transform.scale(
                  scale: isHoveringCoding ? 0.95 : 1,
                  child: Container(
                    height: circleCodingSize,
                    width: circleCodingSize,
                    decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white, width: borderSideSize)),
                    child: Center(child: Text('coding...', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: fontSize))),
                  ),
                ),
              ),
            ),
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
                    decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white, width: borderSideSize)),
                    child: Center(child: Text('fimo...', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: fontSize))),
                  ),
                ),
              ),
            ),
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
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7),
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
                              decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 2)),
                              child: IconButton(
                                padding: const EdgeInsets.all(10),
                                onPressed: () {
                                  _launchUrl(urls[index]);
                                },
                                icon: list[index],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _launchUrl(Uri url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
