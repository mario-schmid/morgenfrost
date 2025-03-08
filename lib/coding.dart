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
  bool isHoveringMayaCalendarApp = false;

  List<bool> isHovering = [false];

  final double circleMayaCalendarAppPosTop = 0.30;
  final double circleMayaCalendarAppPosLeft = 0.80;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double circleMayaCalendarAppSize = size.width * 0.12 + size.height * 0.13;

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
              top: size.height * circleMayaCalendarAppPosTop - circleMayaCalendarAppSize / 2,
              left: size.width * circleMayaCalendarAppPosLeft - circleMayaCalendarAppSize / 2,
              child: InkWell(
                onTap: () => _launchUrl(),
                onHover: (value) {
                  setState(() {
                    isHoveringMayaCalendarApp = value;
                  });
                },
                child: Transform.scale(
                  scale: isHoveringMayaCalendarApp ? 0.95 : 1,
                  child: Container(
                    height: circleMayaCalendarAppSize,
                    width: circleMayaCalendarAppSize,
                    decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white, width: borderSideSize)),
                    child: Center(
                      child: Text('Maya \n Calendar \n App', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: fontSize)),
                    ),
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
  Uri url = Uri.parse('https://github.com/morgenfrost1313/maya');
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
