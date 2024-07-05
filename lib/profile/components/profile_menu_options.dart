import 'profile_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:final_project/profile/payment_method/components/app_icons.dart';

class ProfileMenuOptions extends StatelessWidget {
  const ProfileMenuOptions({
    Key? key,
  }) : super(key: key);

  Future<void> _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushNamedAndRemoveUntil(context, '/Login', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 40 / 100,
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset: Offset(1, 2),
            )
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            ProfileListTile(
              title: 'My Profile',
              icon: AppIcons.profilePerson,
              onTap: () {},
            ),
            const Divider(thickness: 0.1),
            ProfileListTile(
                title: 'Payment',
                icon: AppIcons.profilePayment,
                onTap: () {
                  Navigator.pushNamed(context, "/PaymentMethodPage");
                }),
            const Divider(thickness: 0.1),
            ProfileListTile(
              title: 'Privacy Policy',
              icon: AppIcons.privacy,
              onTap: () {
               //Navigator.pushNamed(context, "/PrivacyPolicyPage");
              },
            ),
            const Divider(thickness: 0.1),
            ProfileListTile(
              title: 'About us',
              icon: AppIcons.aboutUs,
              onTap: () {
                //Navigator.pushNamed(context, "/AboutUsPage");
              },
            ),
            const Divider(thickness: 0.1),
            ProfileListTile(
              title: 'Logout',
              icon: AppIcons.profileLogout,
              onTap: () async {
                await _logout(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
