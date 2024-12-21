import 'package:flutter/material.dart';
import 'package:soft_news_ai/styles/app_colors.dart';

class ParentGradiuntWidget extends StatelessWidget {
  final Widget child;
  const ParentGradiuntWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [primaryColor, primaryLightColor],
        ),
      ),
      child: child,
    );
  }
}
