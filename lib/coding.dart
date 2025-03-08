import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Coding extends StatelessWidget {
  const Coding({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: CodingPage());
  }
}

class CodingPage extends StatefulWidget {
  const CodingPage({super.key});

  @override
  State<CodingPage> createState() => _CodingPageState();
}

class _CodingPageState extends State<CodingPage> {
  bool isHoveringMaya = false;

  List<bool> isHovering = [false];

  final double circleMayaPosTop = 0.30;
  final double circleMayaPosLeft = 0.80;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double circleMayaSize = size.width * 0.12 + size.height * 0.13;

    double borderSideSize = size.width * 0.003 + size.height * 0.003;
    double fontSize = size.width * 0.016 + size.height * 0.016;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/background.jpg'), fit: BoxFit.fill)),
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: size.height * circleMayaPosTop - circleMayaSize / 2,
              left: size.width * circleMayaPosLeft - circleMayaSize / 2,
              child: InkWell(
                onTap: () => _launchUrl(),
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
                    decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white, width: borderSideSize)),
                    child: Center(child: Text('maya', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: fontSize))),
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

Future<void> _launchUrl() async {
  Uri url = Uri.parse('https://gitlab.com/morgenfrost/maya');
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
