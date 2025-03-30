import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'setting_state.dart';
part 'setting_cubit.freezed.dart';

@injectable
class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingState.initial());
}
