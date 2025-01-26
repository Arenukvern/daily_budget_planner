part of 'isar.dart';

// https://isar.dev/recipes/string_ids.html#fast-hash-function
@collection
class BudgetIsarCollection with IsarIdMixin {
  /// Creates a [BudgetIsarCollection] instance
  BudgetIsarCollection();

  /// Converts a domain [Budget] model to [BudgetIsarCollection]
  ///
  /// @ai Ensure that the budget data is correctly serialized and deserialized
  /// to maintain data integrity.
  factory BudgetIsarCollection.fromDomain(final Budget budget) =>
      BudgetIsarCollection()
        ..id = budget.id.value
        ..createdAt = budget.date
        ..budgetJson = jsonEncode(budget.toJson());

  /// Full budget data as JSON string
  String budgetJson = '';

  /// Budget creation date
  DateTime createdAt = dateTimeNowUtc();

  /// Converts [BudgetIsarCollection] to domain [Budget] model
  Budget toDomain() => Budget.fromJson(jsonDecodeMap(budgetJson));
}
