import 'package:flutter/material.dart';
import 'package:interview/OTP/VerifyOtpScreen.dart';
import 'package:interview/utils/appColor.dart';
import '../utils/FontManager.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreen_State();
}

class _ResetPasswordScreen_State extends State<ResetPasswordScreen> {
  final TextEditingController newpasswordController = TextEditingController();
  final TextEditingController conformpasswordController = TextEditingController();
  bool isPasswordVisible = false;
  bool isConformPasswordVisible = false;
  FontManager fontManager = FontManager();

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
      body: Container(
        width: double.infinity,
        height: size.height,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          children: [
            // Top Content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      'Reset Password',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        fontFamily: fontManager.poppins_Regular,
                        color: appColor.dark,
                      ),
                    ),
                    const SizedBox(height: 48),
                    // Email
                    Text(
                      'New Password',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: fontManager.poppins_Regular,
                        color: appColor.dark,
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: newpasswordController,
                      obscureText: !isConformPasswordVisible,
                      decoration: InputDecoration(
                        hintText: '**********',
                        hintStyle:  TextStyle(fontSize: 16, fontWeight: FontWeight.w400,
                            fontFamily: fontManager.inter, color: appColor.halfdark),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isConformPasswordVisible ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              isConformPasswordVisible = !isConformPasswordVisible;
                            });
                          },
                        ),
                        border: const UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 40),
                    Text(
                      'Confirm Password',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: fontManager.poppins_Regular,
                        color: appColor.dark,
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: conformpasswordController,
                      obscureText: !isPasswordVisible,
                      decoration: InputDecoration(
                        hintText: '**********',
                        hintStyle:  TextStyle(fontSize: 16, fontWeight: FontWeight.w400,
                            fontFamily: fontManager.inter, color: appColor.halfdark),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                        ),
                        border: const UnderlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 60),

                    // Send OTP Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VerifyOtpScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Reset Password",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            fontFamily: fontManager.inter,
                            color: appColor.light,
                          ),
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
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: fontManager.inter,
                      color: appColor.halfdark,
                    ),
                    children: [
                      TextSpan(
                        text: 'M360 ICT',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          fontFamily: fontManager.inter,
                          color: appColor.greenColor,
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
    );
  }
}