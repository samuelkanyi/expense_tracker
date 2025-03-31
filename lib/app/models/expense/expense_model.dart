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

  // JSON serialization
  factory ExpenseModel.fromJson(Map<String, dynamic> json) =>
      _$ExpenseModelFromJson(json);

  @override
  // TODO: implement amount
  double get amount => throw UnimplementedError();

  @override
  // TODO: implement attachmentPath
  String? get attachmentPath => throw UnimplementedError();

  @override
  // TODO: implement category
  String get category => throw UnimplementedError();

  @override
  // TODO: implement createdAt
  DateTime get createdAt => throw UnimplementedError();

  @override
  // TODO: implement currency
  String get currency => throw UnimplementedError();

  @override
  // TODO: implement description
  String get description => throw UnimplementedError();

  @override
  // TODO: implement id
  String get id => throw UnimplementedError();

  @override
  // TODO: implement paymentMethod
  String get paymentMethod => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
