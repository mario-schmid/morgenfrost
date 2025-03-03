import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Maya extends StatelessWidget {
  const Maya({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isHoveringQrCode = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    late double sizeQrCode;

    if (size.height > size.width) {
      sizeQrCode = size.width * 0.5;
    } else {
      sizeQrCode = size.height * 0.5;
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/background.jpg'), fit: BoxFit.fill)),
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: InkWell(
            onTap: () {
              _launchUrl();
            },
            onHover: (value) {
              setState(() {
                isHoveringQrCode = value;
              });
            },
            child: Transform.scale(
              scale: isHoveringQrCode ? 0.95 : 1,
              child: Image.asset('assets/images/qr-code.png', height: sizeQrCode, width: sizeQrCode, fit: BoxFit.cover),
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> _launchUrl() async {
  Uri url = Uri.parse('https://play.google.com/store/apps/details?id=com.software.maya');
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
