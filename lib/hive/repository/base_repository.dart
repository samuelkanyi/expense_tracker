abstract class BaseHiveRepository<T> {
  late String boxName;
  BaseHiveRepository({required this.boxName});

  Future<void> add(T model);

  Future<List<T>> getAll();

  Future<void> delete(String id);

  Future<void> update(String id, T model);
}
