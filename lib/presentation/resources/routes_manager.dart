import 'package:flutter/material.dart';
import 'package:final_project/profile/profile_page.dart';
import 'package:final_project/main/views/home_view.dart';
import 'package:final_project/main/views/startView.dart';
import 'package:final_project/profile/components/about_us.dart';
import 'package:final_project/profile/components/privacy_policy.dart';
import 'package:final_project/presentation/login_view/login_view.dart';
import 'package:final_project/presentation/resources/strings_manager.dart';
import 'package:final_project/presentation/sinup_widgets/sign_up_view.dart';
import 'package:final_project/presentation/onboarding/onboarding_view.dart';
import 'package:final_project/profile/payment_method/add_new_card_page.dart';
import 'package:final_project/profile/payment_method/payment_method_page.dart';
import 'package:final_project/presentation/splashscreen/splashscreen_view.dart';
import 'package:final_project/presentation/sinup_widgets/login_or_signup_view.dart';
import 'package:final_project/presentation/forget_Password/forget_password_view.dart';

class Routes {
  static const String SplashView = "/";
  static const String OnboardingPage = "/OnboardingPage";
  static const String StartView = "/startView";
  static const String LoginOrSignUpPage = "/Login_or_signup";
  static const String LoginView = "/Login";
  static const String SignUpView = "/SignUp";
  static const String ForgetPasswordView = "/forget_password";
  static const String NumberVerificationView = "/confirm_password";
  static const String PasswordResetView = "/new_password";
  static const String MyHomeView = "/home";
  static const String SearchView = "/search";
  static const String ProfilePage = "/ProfilePage";
  static const String NotificationPage = "/NotificationPage";
  static const String PaymentMethodPage = "/PaymentMethodPage";
  static const String AddNewCardPage = "/AddNewCardPage";
  static const String PrivacyPolicyPage = "/PrivacyPolicyPage";
  static const String AboutUsPage = "/AboutUsPage";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.SplashView:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.OnboardingPage:
        return MaterialPageRoute(builder: (_) => const OnboardingPage());

      case Routes.StartView:
        // initLoginModule();
        return MaterialPageRoute(builder: (_) => StartView());

      case Routes.LoginOrSignUpPage:
        return MaterialPageRoute(builder: (_) => const LoginOrSignUpPage());

      case Routes.LoginView:
        //initRegisterModule();
        return MaterialPageRoute(builder: (_) => LoginView());

      case Routes.SignUpView:
        // initForgotPasswordModule();
        return MaterialPageRoute(builder: (_) => SignUpView());

      case Routes.ForgetPasswordView:
        //initHomeModule();
        return MaterialPageRoute(builder: (_) => ForgetPasswordView());

      case Routes.PrivacyPolicyPage:
        return MaterialPageRoute(builder: (_) => PrivacyPolicyPage());

      case Routes.AboutUsPage:
        return MaterialPageRoute(builder: (_) => AboutUsPage());

      case Routes.MyHomeView:
        // initStoreDetailsModule();
        return MaterialPageRoute(
          builder: (_) => MyHomeView(
            title: "Home",
          ),
        );

      case Routes.ProfilePage:
        return MaterialPageRoute(builder: (_) => ProfilePage());

      case Routes.PaymentMethodPage:
        return MaterialPageRoute(builder: (_) => PaymentMethodPage());

      case Routes.AddNewCardPage:
        return MaterialPageRoute(builder: (_) => AddNewCardPage());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
        ),
        body: const Center(child: Text(AppStrings.noRouteFound)),
      ),
    );
  }
}
