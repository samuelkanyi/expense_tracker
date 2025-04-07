import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'add_wallet_state.dart';
part 'add_wallet_cubit.freezed.dart';

@injectable
class AddWalletCubit extends Cubit<AddWalletState> {
  AddWalletCubit() : super(AddWalletState.initial());
}
