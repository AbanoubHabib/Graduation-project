part of 'card_cubit.dart';

class CardState extends Equatable {
  final String cardNumber;
  final String expireDate;
  final String cvv;
  final String holderName;
  final bool rememberMyCard;

  CardState({
    this.cardNumber = '',
    this.expireDate = '',
    this.cvv = '',
    this.holderName = '',
    this.rememberMyCard = false,
  });

  @override
  List<Object?> get props => [cardNumber, expireDate, cvv, holderName, rememberMyCard];
}
