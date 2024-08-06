import 'package:flutter/material.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../constants/Colors/colors.dart';
import '../constants/strings.dart';
import '../screens/signup_page/signup.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late PageController _pageController;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  TextEditingController _dateController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(25.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: demodata.length,
                  controller: _pageController,
                  itemBuilder: (context, index) => OnboardingWidget(
                    title: demodata[index].title ?? "",
                    image: demodata[index].image ??
                        "assets/ScreenImages/default.png",
                    column: demodata[index].column ?? Container(),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: mint),
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    );

                    _pageController.nextPage(
                        duration: const Duration(microseconds: 300),
                        curve: Curves.ease);
                  },
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  // Future<void> _selectDate() async {
  //   DateTime? _picked  = await showDatePicker(context: context, firstDate: DateTime(2000), lastDate: DateTime(2100),initialDate: DateTime.now());
  // }
}

class OnBoard {
  final String? image, title;
  Widget? column;

  OnBoard({
    this.image,
    this.title,
    this.column,
  });
}

final List<OnBoard> demodata = [
  OnBoard(
    image: "assets/ScreenImages/Logo.jpg",
    title: "Welcome!",
    column: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Imsg,
          style: TextStyle(),
        ),
        Text(
          "Introvertish.",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  ),
];

class OnboardingWidget extends StatelessWidget {
  OnboardingWidget(
      {super.key,
      required this.image,
      required this.title,
      required this.column});

  final String image, title;
  Widget column;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          image,
          width: 100,
          height: 100,
        ),
        SizedBox(
          height: 50,
        ),
        Text(title,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(fontWeight: FontWeight.w500, fontFamily: 'Lato')),
        SizedBox(
          height: 20,
        ),
        column,
        // Spacer(),
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.end,
        //   children: [
        //     ElevatedButton(onPressed: (){}, child: Text("Continue")),
        //   ],
        // ),
        // Spacer()
      ],
    );
  }
}
