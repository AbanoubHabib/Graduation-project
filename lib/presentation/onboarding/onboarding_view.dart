import 'package:final_project/presentation/onboarding/data/onboarding_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'components/onboarding_view.dart';
import 'data/onboarding_model.dart';
import 'model/app_defaults.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentPage = 0;
  late PageController controller;
  List<OnboardingModel> items = OnboardingData.items;

  onPageChange(int value) {
    currentPage = value;
    setState(() {});
  }

  _gotoNextPage() {
    if (currentPage < items.length - 1) {
      controller.nextPage(
        duration: AppDefaults.duration,
        curve: Curves.ease,
      );
    } else {
      _checkAuthStatus();
    }
  }

  _checkAuthStatus() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Navigator.pushNamed(context, '/home');
    } else {
      Navigator.pushNamed(context, '/startView');
    }
  }

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEFEFEF),
      //backgroundColor: Color.fromARGB(255, 131, 27, 139),
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: PageView.builder(
                onPageChanged: onPageChange,
                itemCount: items.length,
                controller: controller,
                itemBuilder: (context, index) {
                  return OnboardingView(
                    data: items[index],
                  );
                },
              ),
            ),
            const Spacer(),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                TweenAnimationBuilder(
                  duration: AppDefaults.duration,
                  tween: Tween<double>(
                      begin: 0, end: (1 / items.length) * (currentPage + 1)),
                  curve: Curves.easeInOutBack,
                  builder: (context, double value, _) => SizedBox(
                    height: 70,
                    width: 70,
                    child: CircularProgressIndicator(
                      value: value,
                      strokeWidth: 6,
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      color: const Color(0xff04658e),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: _gotoNextPage,
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor: Color(0xff04658e),
                  ),
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 29,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
