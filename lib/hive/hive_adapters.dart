import 'package:expense_tracker/app/models/expense/expense_model.dart';
import 'package:hive_ce/hive.dart';

part 'hive_adapters.g.dart';

@GenerateAdapters([
  AdapterSpec<ExpenseModel>(),
  AdapterSpec<DateTime>(),
])
class HiveAdapters {}
