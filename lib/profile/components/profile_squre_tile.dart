import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';



class ProfileSqureTile extends StatelessWidget {
  const ProfileSqureTile({
    Key? key,
    required this.label,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final String label;
  final String icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SvgPicture.asset(icon),
              const SizedBox(height: 8),
              Text(
                label,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.black,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
