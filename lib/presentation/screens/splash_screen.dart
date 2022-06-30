import 'package:fast_food/generated/resource.dart';
import 'package:fast_food/presentation/routes/app_pages.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1000), () {
      Navigator.pushReplacementNamed(context, onBoardingRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      R.ASSETS_PNG_START_PNG,
      fit: BoxFit.fill,
    );
  }
}
