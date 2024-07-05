import 'profile_squre_tile.dart';
import 'package:flutter/material.dart';
import 'package:final_project/profile/payment_method/components/app_icons.dart';

class ProfileHeaderOptions extends StatelessWidget {
  const ProfileHeaderOptions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:  MediaQuery.of(context).size.width*39/100,
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset: Offset(1, 2),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ProfileSqureTile(
              label: 'All Order',
              icon: AppIcons.truckIcon,
              onTap: () {
              },
            ),
            ProfileSqureTile(
              label: 'Voucher',
              icon: AppIcons.voucher,
              onTap: () {
                
              },
            ),
            ProfileSqureTile(
              label: 'Address',
              icon: AppIcons.homeProfile,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
