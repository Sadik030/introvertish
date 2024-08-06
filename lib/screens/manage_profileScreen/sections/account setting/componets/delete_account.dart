import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:introvertish/Custom_widgets/primary_button.dart';
import 'package:introvertish/screens/manage_profileScreen/CustomWidgets/titleTextfield_container.dart';

class DeleteAccount extends StatelessWidget {
  const DeleteAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        //Icon(Icons.arrow_back),
        title: Text(
          "Delete Account",
          style: TextStyle(),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Image.asset(
                  "assets/images/info.png",
                  width: 100,
                ),
                Text("Delete Account"),
                Text(
                    "This is will delete your account info, profile, and all of your data"),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
            Text(
              "Confirm your Account Phone Number",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            TitleTextfildContainer(
              title: 'Mobile',
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 110),
              child: PrimaryButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ConfirmDeleteAccount()),
                  );
                },
                title: 'Confirm',
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ConfirmDeleteAccount extends StatelessWidget {
  const ConfirmDeleteAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        //Icon(Icons.arrow_back),
        title: Text(
          "Confirm Delete Account",
          style: TextStyle(),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Enter the OTP sent to your registered number"),
            SizedBox(
              height: 40,
            ),
            OtpTextField(
              enabledBorderColor: Colors.black,
            ),
            SizedBox(
              height: 40,
            ),
            PrimaryButton(title: "Delete", onPressed: () {}, color: Colors.red)
          ],
        ),
      ),
    );
  }
}
