import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:final_project/profile/payment_method/cubit/card_cubit.dart';
import 'package:final_project/presentation/forget_Password/app_back_button.dart';

class AddNewCardPage extends StatefulWidget {
  const AddNewCardPage({Key? key}) : super(key: key);

  @override
  State<AddNewCardPage> createState() => _AddNewCardPageState();
}

class _AddNewCardPageState extends State<AddNewCardPage> {
  late TextEditingController cardNumber;
  late TextEditingController expireDate;
  late TextEditingController cvv;
  late TextEditingController holderName;

  bool rememberMyCard = false;

  onTextChanged(v) {
    if (mounted) setState(() {});
  }

  @override
  void initState() {
    super.initState();
    cardNumber = TextEditingController();
    expireDate = TextEditingController();
    holderName = TextEditingController();
    cvv = TextEditingController();
  }

  @override
  void dispose() {
    cardNumber.dispose();
    expireDate.dispose();
    holderName.dispose();
    cvv.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: const Text('Add New Card',style: TextStyle(color: Colors.white),),
        backgroundColor: const Color(0xff04658e),
      ),
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 8),
            CreditCardWidget(
              cardNumber: cardNumber.text,
              expiryDate: expireDate.text,
              cardHolderName: holderName.text,
              isHolderNameVisible: true,
              backgroundImage: 'assets/images/payment/paymentimage.png',
              cvvCode: cvv.text,
              showBackView: false,
              cardType: CardType.visa,
              onCreditCardWidgetChange: (v) {},
              isChipVisible: false,
            ),
            CreditCardForm(
              cardNumber: cardNumber,
              expireDate: expireDate,
              cvv: cvv,
              holderName: holderName,
              rememberMyCard: rememberMyCard,
              onTextChanged: onTextChanged,
              onRememberMyCardChanged: (v) {
                rememberMyCard = !rememberMyCard;
                if (mounted) setState(() {});
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 40/1000,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.read<CardCubit>().updateCardInfo(
                          cardNumber: cardNumber.text,
                          expireDate: expireDate.text,
                          cvv: cvv.text,
                          holderName: holderName.text,
                          rememberMyCard: rememberMyCard,
                        );
                    Navigator.pop(context);
                  },
                  child: const Text('Add Card',style: TextStyle(color: Colors.white),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CreditCardForm extends StatelessWidget {
  const CreditCardForm({
    Key? key,
    required this.cardNumber,
    required this.expireDate,
    required this.cvv,
    required this.holderName,
    required this.rememberMyCard,
    required this.onTextChanged,
    required this.onRememberMyCardChanged,
  }) : super(key: key);

  final TextEditingController cardNumber;
  final TextEditingController expireDate;
  final TextEditingController cvv;
  final TextEditingController holderName;
  final bool rememberMyCard;
  final void Function(String?) onTextChanged;
  final void Function(bool v) onRememberMyCardChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Card Name"),
          const SizedBox(height: 8),
          TextFormField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            controller: holderName,
            onChanged: onTextChanged,
          ),
          const SizedBox(height: 16),
          const Text("Card Number"),
          const SizedBox(height: 8),
          TextFormField(
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            controller: cardNumber,
            onChanged: onTextChanged,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Expire Date"),
                    const SizedBox(height: 8),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      controller: expireDate,
                      onChanged: onTextChanged,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("CVV"),
                    const SizedBox(height: 8),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      controller: cvv,
                      onChanged: onTextChanged,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Remember My Card"),
              CupertinoSwitch(
                value: rememberMyCard,
                onChanged: onRememberMyCardChanged,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
