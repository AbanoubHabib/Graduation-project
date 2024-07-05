import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class PaymentDefaultCard extends StatelessWidget {
  const PaymentDefaultCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CreditCardWidget(
      cardNumber: '146465465456',
      expiryDate: '10/24',
      cardHolderName: 'Abanoub Habib',
      labelCardHolder: 'Abanoub',
      isHolderNameVisible: true,
      backgroundImage: 'assets/images/payment/paymentimagefront.png',
      cvvCode: '5424',
      showBackView: false,
      cardType: CardType.visa,
      onCreditCardWidgetChange: (v) {},
      isChipVisible: false,
    );
  }
}
