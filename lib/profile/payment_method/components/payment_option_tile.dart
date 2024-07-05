import 'package:flutter/material.dart';



class PaymentOptionTile extends StatelessWidget {
  const PaymentOptionTile({
    Key? key,
    required this.image,
    required this.label,
    required this.accountName,
    required this.onTap,
  }) : super(key: key);

  final String image;
  final String label;
  final String accountName;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16 / 2,
        horizontal: 16,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 60,
                height: 60,
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Image.asset(image),
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.black),
                  ),
                  const SizedBox(height: 16/ 3),
                  Text(
                    accountName,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.black),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
