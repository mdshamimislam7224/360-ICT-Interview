import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:interview/utils/appColor.dart';
import '../utils/FontManager.dart';

class SignUPScreen extends StatefulWidget {
  const SignUPScreen({super.key});
  @override
  State<SignUPScreen> createState() => _SignUPScreenState();
}

class _SignUPScreenState extends State<SignUPScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController conformPasswordController = TextEditingController();

  FontManager fontManager = FontManager();
  bool isPasswordVisible = false;
  bool isConformPasswordVisible = false;
  String countryCode = '+880'; // Default country code for Bangladesh


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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                fontFamily: fontManager.poppins_Regular,
                color: appColor.dark,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Let's save environment together",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: fontManager.inter,
                color: appColor.dark,
              ),
            ),
            const SizedBox(height: 40),
            //name
            Text(
              'Name',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: fontManager.poppins_Regular,
                color: appColor.dark,
              ),
            ),
            const SizedBox(height: 5),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'e.g: Ahmed Ariyan',
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: fontManager.inter,
                  color: appColor.halfdark,
                ),
                border: const UnderlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            // Phone Number with Country Code
          Text(
            'Phone Number',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: fontManager.poppins_Regular,
              color: appColor.dark,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              CountryCodePicker(
                onChanged: (country) {
                  setState(() {
                    countryCode = country.dialCode!;
                  });
                },
                initialSelection: 'BD', // Default country (Bangladesh)
                favorite: ['+880', 'BD'],
                showCountryOnly: false,
                showOnlyCountryWhenClosed: false,
                alignLeft: false,
                showFlag: true,
                showFlagDialog: true,
                flagWidth: 25,
                padding: EdgeInsets.zero,
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: fontManager.inter,
                  color: appColor.halfdark,
                ),
              ),
              Expanded(
                child: TextFormField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: '17XXXXXXXX',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: fontManager.inter,
                      color: appColor.halfdark,
                    ),
                    border: const UnderlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
            const SizedBox(height: 20),
            // Email
            Text(
              'Email',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: fontManager.poppins_Regular,
                color: appColor.dark,
              ),
            ),
            const SizedBox(height: 5),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'user@example.com',
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: fontManager.inter,
                  color: appColor.halfdark,
                ),
                border: const UnderlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            // Password
            Text(
              'Password',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: fontManager.poppins_Regular,
                color: appColor.dark,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: passwordController,
              obscureText: !isPasswordVisible,
              decoration: InputDecoration(
                hintText: '**********',
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: fontManager.inter,
                  color: appColor.halfdark,
                ),
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
            const SizedBox(height: 20),
            // Confirm Password
            Text(
              'Confirm Password',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: fontManager.poppins_Regular,
                color: appColor.dark,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: conformPasswordController,
              obscureText: !isConformPasswordVisible,
              decoration: InputDecoration(
                hintText: '**********',
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: fontManager.inter,
                  color: appColor.halfdark,
                ),
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
            const SizedBox(height: 90),

            // Sign Up Button
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
                  debugPrint('Email: ${emailController.text}');
                  debugPrint('Password: ${passwordController.text}');
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontFamily: fontManager.inter,
                    color: appColor.light,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: Text(
                "Or Sign In with",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontFamily: fontManager.inter,
                  color: appColor.halfdark,
                ),
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
                  child: SocialIcon(iconData: Icons.g_mobiledata),
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
                  child: SocialIcon(iconData: Icons.facebook),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    debugPrint('Apple clicked');
                  },
                  child: SocialIcon(iconData: Icons.apple),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Sign In Option
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontFamily: fontManager.inter,
                    color: appColor.halfdark,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    debugPrint('Sign In clicked');
                  },
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontFamily: fontManager.inter,
                      color: appColor.greenColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Center(
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