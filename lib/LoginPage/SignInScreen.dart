import 'package:flutter/material.dart';
import 'package:interview/Home/HomeScreen.dart';
import 'package:interview/OTP/Send_OTP.dart';
import 'package:interview/utils/appColor.dart';

import '../Signup/SignUPScreen.dart';
import '../utils/FontManager.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  FontManager fontManager= FontManager();
  bool rememberMe = false;
  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Text(
              'Sign In',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500,
                  fontFamily: fontManager.poppins_Regular, color: appColor.dark),
            ),
            const SizedBox(height: 8),
            Text(
              "Let's save environment together",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400,
                  fontFamily: fontManager.inter, color: appColor.dark),),
            const SizedBox(height: 40),

            // Email
            Text('Email', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,
                fontFamily: fontManager.poppins_Regular, color: appColor.dark),),
            const SizedBox(height: 5),
            TextFormField(
              controller: emailController,
              decoration:  InputDecoration(
                hintText: 'user@example.com',
                hintStyle:  TextStyle(fontSize: 16, fontWeight: FontWeight.w400,
                    fontFamily: fontManager.inter, color: appColor.halfdark),
                border: UnderlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            // Password
             Text('Password',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,
                 fontFamily: fontManager.poppins_Regular, color: appColor.dark),),
            const SizedBox(height: 8),
            TextFormField(
              controller: passwordController,
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

            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: rememberMe,
                      onChanged: (value) {
                        setState(() {
                          rememberMe = value ?? false;
                        });
                      },
                    ),
                     Text("Remember me",  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400,
                         fontFamily: fontManager.inter, color: appColor.dark),),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(  // Changed from pushReplacement to push
                      context,
                      MaterialPageRoute(builder: (context) => Send_OTP()),
                    );},
                  child: Text(
                    "Forgotten Password",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700,
                          fontFamily: fontManager.inter, color: appColor.greenColor),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Sign In Button
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
                  // Add sign-in logic here
                  Navigator.push(  // Changed from pushReplacement to push
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                  debugPrint('Email: ${emailController.text}');
                  debugPrint('Password: ${passwordController.text}');
                },
                child:  Text(
                  "Sign In",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700,
                        fontFamily: fontManager.inter, color: appColor.light),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: Text(
                "Or Sign In with",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400,
                    fontFamily: fontManager.inter, color: appColor.halfdark),
              ),
            ),
            const SizedBox(height: 24),
            // Social Icons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    debugPrint('Google clicked');
                  },
                  child:SocialIcon(iconData: Icons.g_mobiledata,),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    debugPrint('Microsoft clicked');
                  },
                  child: Image.asset('images/microsoft_icon.png', width: 24, height: 24),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    debugPrint('Facebook clicked');
                  },
                  child:SocialIcon(iconData: Icons.facebook),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    debugPrint('Apple clicked');
                  },
                  child:SocialIcon(iconData: Icons.apple),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Sign Up
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"
                    ,style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400,
                      fontFamily: fontManager.inter, color: appColor.halfdark),
                ),
                TextButton(
                  onPressed: () {

                  },
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(  // Changed from pushReplacement to push
                        context,
                        MaterialPageRoute(builder: (context) => SignUPScreen()),
                      );
                      debugPrint('Sign Up clicked');
                    },
                    child: Text(
                      "Sign Up",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700,
                        fontFamily: fontManager.inter, color: appColor.greenColor),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Center(
              child: Text.rich(
                TextSpan(
                  text: 'Powered by ',style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400,
                fontFamily: fontManager.inter, color: appColor.halfdark),
                  children: [
                    TextSpan(
                      text: 'M360 ICT',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700,
                fontFamily: fontManager.inter, color: appColor.greenColor),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SocialIcon extends StatelessWidget {
  final IconData iconData;
  const SocialIcon({super.key, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 22,
      backgroundColor: appColor.light,
      child: Icon(iconData, size: 28),
    );
  }
}
