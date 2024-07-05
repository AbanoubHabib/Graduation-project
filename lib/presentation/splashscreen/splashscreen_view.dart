import 'dart:async';
import 'package:flutter/material.dart';
import 'package:final_project/presentation/resources/assets_manager.dart';
import 'package:final_project/presentation/resources/routes_manager.dart';
import 'package:final_project/presentation/resources/constants_manager.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstants.splashDelay), _goNext);
  }

  _goNext() {
    Navigator.pushReplacementNamed(context, Routes.OnboardingPage);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: const Color(0xffEFEFEF),
      //backgroundColor: ColorsManager.primaryColorLight,
      body: Center(
        child: Image(
          image: AssetImage(ImageAssets.splashLogo),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }
}
