import 'package:expense_tracker/app/models/expense/expense_model.dart';
import 'package:expense_tracker/hive/repository/base_repository.dart';
import 'package:hive_ce/hive.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BaseHiveRepository<ExpenseModel>)
class ExpenseRepository extends BaseHiveRepository<ExpenseModel> {
  ExpenseRepository() : super(boxName: 'expense');

  @override
  Future<void> add(ExpenseModel model) async {
    final box = await Hive.openBox<ExpenseModel>(boxName);
    await box.add(model);
  }

  @override
  Future<List<ExpenseModel>> getAll() async {
    final box = await Hive.openBox<ExpenseModel>(boxName);

    return box.values.toList();
  }

  @override
  Future<void> delete(String id) async {
    final box = await Hive.openBox(boxName);
    await box.delete(id);
  }

  @override
  Future<void> update(String id, ExpenseModel model) async {
    final box = await Hive.openBox<ExpenseModel>(boxName);
    await box.put(model.id, model);
  }

  @override
  Future<void> deleteAll() async {
    final box = await Hive.openBox<ExpenseModel>(boxName);
    int boxLength = box.values.length;
    for (int i = 0; i <= boxLength; i++) {
      await box.deleteAt(i);
    }
  }

  @override
  Future<double> totalExpenses() async {
    final box = await Hive.openBox<ExpenseModel>(boxName);
    List<ExpenseModel> models = box.values.toList();

    if (models.isEmpty) {
      return 0;
    }
    double total =
        models.map((model) => model.amount).reduce((prev, next) => prev + next);

    return total;
  }
}
