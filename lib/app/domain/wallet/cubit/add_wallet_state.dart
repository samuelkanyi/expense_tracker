part of 'add_wallet_cubit.dart';

@freezed
class AddWalletState with _$AddWalletState {
  const factory AddWalletState.initial(
      {@Default(AddWalletStep.initial) AddWalletStep step}) = _Initial;
  const factory AddWalletState.form(
      {@Default(AddWalletStep.form) AddWalletStep step,
      required String bankName,
      required double income,
      @Default(CardType.debit) CardType type}) = FormInput;

  const factory AddWalletState.success(
      {@Default('Credit info added successfuly') String message}) = Success;
}

enum AddWalletStep { initial, form, success, failure }

enum CardType { debit, credit }
