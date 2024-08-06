import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:introvertish/screens/home_screen/HomemainScreen/homecontent_screen.dart';

import '../screens/home_screen/home_page.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Verify your account",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              Text(
                "Enter the otp sent by support@introvertish.com",
                textAlign: TextAlign.center,
                style: TextStyle(),
              ),
              const SizedBox(
                height: 20.0,
              ),
              OtpTextField(
                numberOfFields: 6,
                fillColor: Colors.black.withOpacity(0.1),
                filled: true,
                onSubmit: (code) {
                  print("OTP is => $code");
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: 100,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent),
                    onPressed: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=> OTPScreen()));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SimpleBottomNavigation()));
                    },
                    child: Text(
                      "Verify",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
