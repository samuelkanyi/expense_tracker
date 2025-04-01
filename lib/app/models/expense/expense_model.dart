import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'expense_model.freezed.dart';
part 'expense_model.g.dart';

@freezed
class ExpenseModel with _$ExpenseModel {
  // Private constructor needed for Freezed
  const ExpenseModel._();

  // Main constructor with factory
  @HiveType(typeId: 0, adapterName: 'ExpenseModelAdapter')
  factory ExpenseModel({
    @HiveField(0) required String id,
    @HiveField(1) required double amount,
    @HiveField(2) required String currency,
    @HiveField(3) required String category,
    @HiveField(4) @Default('') String description,
    @HiveField(5) required String paymentMethod,
    @HiveField(6) required DateTime createdAt,
    @HiveField(7) String? attachmentPath,
  }) = _ExpenseModel;

  // Factory for creating new instances with auto-generated ID
  factory ExpenseModel.create({
    required double amount,
    required String currency,
    required String category,
    String description = '',
    required String paymentMethod,
    String? attachmentPath,
  }) {
    return ExpenseModel(
      id: const Uuid().v4(),
      amount: amount,
      currency: currency,
      category: category,
      description: description,
      paymentMethod: paymentMethod,
      createdAt: DateTime.now(),
      attachmentPath: attachmentPath,
    );
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
