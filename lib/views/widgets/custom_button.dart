import 'package:flutter/material.dart';
import 'package:soft_news_ai/styles/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  const CustomButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 10), // Adjust padding for height
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: primaryColor, fontSize: 25),
          ),
        ),
      ),
    );
  }
}
