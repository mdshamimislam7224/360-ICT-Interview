import 'package:flutter/material.dart';
import 'package:interview/OTP/ResetPasswordScreen.dart';
import 'package:interview/utils/appColor.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../utils/FontManager.dart'; // Add this package in pubspec.yaml

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  String otpCode = "";
  FontManager fontManager= FontManager();


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: appColor.dark),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            children: [
              // Top Content
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40),
                      Text(
                        'Verify OTP',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: appColor.dark,
                          fontFamily: fontManager.poppins_Regular,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Recover your account in easy steps",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: appColor.dark,
                          fontFamily: fontManager.inter,
                        ),
                      ),
                      const SizedBox(height: 30),
                      RichText(
                        text: TextSpan(
                          text: 'An email has been sent to ',
                           style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: appColor.halfdark,
                          fontFamily: fontManager.inter,
                        ),
                          children:  [
                            TextSpan(
                              text: 'user@example.com',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: appColor.dark,
                                  fontFamily: fontManager.inter,
                                ),
                            ),
                            TextSpan(text: '.\nPlease enter the sent OTP.',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: appColor.halfdark,
                                fontFamily: fontManager.inter,
                              ),),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      // OTP TextField
                      PinCodeTextField(
                        appContext: context,
                        length: 4,
                        onChanged: (value) => otpCode = value,
                        keyboardType: TextInputType.number,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(8),
                          fieldHeight: 60,
                          fieldWidth: 60,
                          activeColor: Colors.green,
                          selectedColor: Colors.green,
                          inactiveColor: Colors.grey.shade400,
                        ),
                      ),
                      const SizedBox(height: 60),

                      // Verify Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(  // Changed from pushReplacement to push
                              context,
                              MaterialPageRoute(builder: (context) => ResetPasswordScreen()),
                            );
                            debugPrint("Entered OTP: $otpCode");
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child:  Text(
                            "Verify OTP",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: appColor.light,
                              fontFamily: fontManager.inter,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Text.rich(
                          TextSpan(
                            text: "Didn't receive a code? ",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: appColor.halfdark,
                              fontFamily: fontManager.inter,
                            ),
                            children: [
                              TextSpan(
                                text: 'Resend',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: appColor.greenColor,
                                  fontFamily: fontManager.inter,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Bottom Text
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Center(
                  child: Text.rich(
                    TextSpan(
                      text: 'Powered by ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: appColor.halfdark,
                        fontFamily: fontManager.inter,
                      ),
                      children:  [
                        TextSpan(
                          text: 'M360 ICT',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: appColor.greenColor,
                            fontFamily: fontManager.inter,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
