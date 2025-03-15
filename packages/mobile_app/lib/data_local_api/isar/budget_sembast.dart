import 'dart:convert';

import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/data_local_api/db/sembast_db.dart';

/// {@template budget_sembast_collection}
/// Sembast collection model for storing [Budget] data.
/// Handles persistence of budgets and their related data.
///
/// This collection maintains relationships between:
/// - [Budget]
///
/// @ai When generating code for this collection, ensure proper handling of
/// data serialization and maintain referential integrity with
/// related collections.
/// {@endtemplate}
class BudgetSembastCollection with SembastIdMixin<BudgetId> {
  /// Creates a [BudgetSembastCollection] instance
  BudgetSembastCollection();

  /// Creates instance from Sembast Map
  factory BudgetSembastCollection.fromMap(final Map<String, dynamic> map) =>
      BudgetSembastCollection()..budgetJson = map['budgetJson'] as String;

  /// Converts a domain [Budget] model to [BudgetSembastCollection]
  factory BudgetSembastCollection.fromDomain(final Budget budget) {
    final budgetJson = budget.toJson();

    return BudgetSembastCollection()
      ..id = budget.id
      ..budgetJson = jsonEncode(budgetJson);
  }

  Budget budget = Budget.empty;
  @override
  BudgetId id = BudgetId.empty;

  /// Converts to Map for Sembast storage
  Map<String, dynamic> toMap() => {'id': id, 'budgetJson': budgetJson};

  /// Converts [BudgetSembastCollection] to domain [Budget] model
  Budget toDomain() {
    final budgetJsonMap = jsonDecodeMap(budgetJson);
    return Budget.fromJson(budgetJsonMap);
  }
}
