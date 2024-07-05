import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:final_project/profile/payment_method/components/app_icons.dart';



class AddNewCardRow extends StatelessWidget {
  const AddNewCardRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text(
            'My Card',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/AddNewCardPage');
            },
            icon: SvgPicture.asset(AppIcons.cardAdd),
          )
        ],
      ),
    );
  }
}
