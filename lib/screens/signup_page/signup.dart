import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl/intl.dart';
import 'package:introvertish/OnBoardingScreen/otp_verify.dart';

import '../../constants/strings.dart';
import '../profileCreation/profile_create.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  DateTime _selectedDate = DateTime.now();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double buttonWidth = MediaQuery.of(context).size.width * 0.7;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign Up",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Phone",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            IntlPhoneField(
              controller: phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            TextField(
                controller: dateController,
                decoration: InputDecoration(
                  label: Text(
                    "DOB",
                    style: TextStyle(),
                  ),
                  prefixIcon: Icon(Icons.calendar_today),
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                ),
                readOnly: true,
                onTap: () {
                  _selectDate();
                }),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            Center(
              child: SizedBox(
                width: buttonWidth - 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                  ),
                  onPressed: _isSignUpButtonEnabled()
                      ? () {
                          print(phoneNumberController.text);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OTPScreen()));
                        }
                      : null, // Disable the button if any of the fields is empty
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Center(
                child: Text(
              Iterms,
              style: TextStyle(),
            )),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900), // Adjust this according to your requirements
      lastDate: DateTime.now(), // Disallow future dates
    );
    if (pickedDate != null) {
      // Calculate age based on the selected date
      int age = DateTime.now().year - pickedDate.year;
      if (DateTime.now().month < pickedDate.month ||
          (DateTime.now().month == pickedDate.month &&
              DateTime.now().day < pickedDate.day)) {
        age--;
      }
      if (age < 18) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Age Restriction'),
              content:
                  const Text('You must be at least 18 years old to sign up.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        setState(() {
          _selectedDate = pickedDate;
          String formattedDate = DateFormat('dd-MM-yyyy').format(_selectedDate);
          dateController.text = formattedDate;
        });
      }
    }
  }

  bool _isSignUpButtonEnabled() {
    return phoneNumberController.text.isNotEmpty &&
        dateController.text.isNotEmpty;
  }
}
