import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pets_app_mvvm/Components/colors.dart';
import 'package:pets_app_mvvm/Components/myButton.dart';
import 'package:pets_app_mvvm/Utils/Routes/routes.dart';
import 'package:pets_app_mvvm/Utils/generalUtils.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // IMAGE
              Image.asset(
                'assets/petting-dog.png',
                width: Utils.screenWidth(context),
              ),

              // TEXT
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 0),
                child: Text(
                  "Know about your pet\nChoose what’s best for\nyou...",
                  style: GoogleFonts.montserrat(
                    fontStyle: FontStyle.normal,
                    color: AppColors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              // BUTTON
              MyButton(
                title: "GET STARTED",
                onPressed: () {
                  Navigator.pushNamed(context, RouteNames.home);
                },
              ),

              // SIZEDBOX
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
