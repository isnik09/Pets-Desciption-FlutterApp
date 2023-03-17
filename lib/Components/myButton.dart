import 'package:flutter/material.dart';
import 'package:pets_app_mvvm/Components/colors.dart';

class MyButton extends StatelessWidget {
  MyButton({required this.title, required this.onPressed});

  final String title;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.accent,
      ),
      height: 54,
      width: 275,
      // color: AppColors.accent,
      child: InkWell(
          child: Center(
            child: Text(
              "$title",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
          ),
          onTap: onPressed),
    );
  }
}
