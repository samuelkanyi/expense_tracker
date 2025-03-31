import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'income_state.dart';
part 'income_cubit.freezed.dart';

@injectable
class IncomeCubit extends Cubit<IncomeState> {
  IncomeCubit() : super(const IncomeState.initial(100000));
  double income = 100000.0;

  void updateIncome(double value) {
    emit(IncomeState.loaded(income - value));
  }
}
