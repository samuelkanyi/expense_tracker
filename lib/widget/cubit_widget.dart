import 'package:expense_tracker/injection/injection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// This widget helps you perform repetitive tasks involving Cubits.
/// But it has some limitations:
/// - It is harder to do stateful widget - this is for situations 
/// if you want to have cubit and some local state (outside of cubit)
abstract class CubitWidget<T extends Cubit<S>, S> extends StatefulWidget {
  const CubitWidget({super.key});

  @override
  CubitWidgetState<T, S> createState() => CubitWidgetState<T, S>();

  Widget build(BuildContext context, T cubit, S state);

  void initState(BuildContext context, T cubit) {}
}

class CubitWidgetState<T extends Cubit<S>, S> extends State<CubitWidget<T, S>> {
  late final T _cubit = getIt.get();

  @override
  void initState() {
    super.initState();
    widget.initState(context, _cubit);
  }

  @override
  Future<void> dispose() async {
    /// This is here to properly call async things in dispose
    /// See this: https://github.com/flutter/flutter/issues/64935
    await SynchronousFuture(() async => _cubit.close());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: BlocBuilder<T, S>(
        builder: (BuildContext context, S state) =>
            widget.build(context, _cubit, state),
      ),
    );
  }
}
