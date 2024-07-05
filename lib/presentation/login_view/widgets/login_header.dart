import 'package:flutter/material.dart';
import 'package:final_project/presentation/resources/assets_manager.dart';

class LoginPageHeader extends StatelessWidget {
  const LoginPageHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          child: AspectRatio(
            aspectRatio: 1 / 1,
            child: ColorFiltered(
              colorFilter: const ColorFilter.mode(
                Color(0xffefefef), // Set the desired background color here
                BlendMode.darken,
              ),
              child: Image.asset(ImageAssets.passwordImg),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Welcome to our',
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'TrepEase',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color:const Color(0xff04658E),
              ),
        )
      ],
    );
  }
}
