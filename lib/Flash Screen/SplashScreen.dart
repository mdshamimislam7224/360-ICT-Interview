import 'dart:async';
import 'package:flutter/material.dart';
import '../utils/FontManager.dart';
import '../utils/appColor.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FontManager fontManager= FontManager();

  @override
  void initState() {
    super.initState();
    // Set a timer to navigate to the login screen after a delay
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  double getResponsiveTextSize(BuildContext context, double baseSize) {
    // Adjust text size based on screen width
    return baseSize * MediaQuery.of(context).size.width / 400;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xefefef).withOpacity(1.0), // Blue color similar to your image
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.3,),
          Expanded(
            child: Center(
              child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'images/flashscreen_logo.png',
            height: MediaQuery.of(context).size.height * 0.4,
          ),
        ],
      )
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30), // Padding for bottom spacing
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Powered by',
                  style: TextStyle(
                    color: appColor.halfdark,
                    fontWeight: FontWeight.w400,
                    fontSize: getResponsiveTextSize(context, 12),
                    fontFamily: fontManager.inter,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  ' M360 ICT',
                  style: TextStyle(
                    color: appColor.greenColor,
                    fontWeight: FontWeight.w700,
                    fontSize: getResponsiveTextSize(context, 14),
                    fontFamily: fontManager.poppins_Regular,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
