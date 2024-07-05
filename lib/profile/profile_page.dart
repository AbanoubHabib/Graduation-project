import 'package:flutter/material.dart';
import 'components/profile_header.dart';
import 'package:animate_do/animate_do.dart';
import 'components/profile_menu_options.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade300,
      child: SingleChildScrollView(
        child: Column(
          children: [
            FadeInUp(
                delay: const Duration(milliseconds: 500),
                child: ProfileHeader()),
            FadeInUp(
                delay: const Duration(milliseconds: 600),
                child: ProfileMenuOptions()),
          ],
        ),
      ),
    );
  }
}
