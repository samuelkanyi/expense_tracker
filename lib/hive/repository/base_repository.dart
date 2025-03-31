abstract class BaseHiveRepository<T> {
  BaseHiveRepository({required this.boxName});
  late String boxName;

  Future<void> add(T model);

  Future<List<T>> getAll();

  Future<void> delete(String id);

  Future<void> update(String id, T model);

  Future<void> deleteAll();

  Future<double> totalExpenses();
}
