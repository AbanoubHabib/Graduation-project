import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'card_state.dart';

class CardCubit extends Cubit<CardState> {
  CardCubit() : super(CardState());

  void updateCardInfo({
    required String cardNumber,
    required String expireDate,
    required String cvv,
    required String holderName,
    required bool rememberMyCard,
  }) {
    emit(CardState(
      cardNumber: cardNumber,
      expireDate: expireDate,
      cvv: cvv,
      holderName: holderName,
      rememberMyCard: rememberMyCard,
    ));
  }
}
