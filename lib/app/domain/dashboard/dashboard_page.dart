import 'package:expense_tracker/app/domain/dashboard/view/dashboard_view.dart';
import 'package:expense_tracker/app/domain/expense/cubit/expense_cubit.dart';
import 'package:expense_tracker/app/domain/income/cubit/income_cubit.dart';
import 'package:expense_tracker/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => IncomeCubit()),
      BlocProvider(create: (context) => ExpenseCubit(getIt())),
    ], child: ExpenseDashboard());
  }
}
