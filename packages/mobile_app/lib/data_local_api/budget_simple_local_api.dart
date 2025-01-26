import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_home/monthly/monthly_view.dart';
import 'package:mobile_app/ui_home/weekly/weekly_view.dart';

/// {@template simple_budget_local_api}
/// Simple local storage implementation for managing budgets using
/// Isar database. Is used for [MonthlyView] and [WeeklyView].
///
/// This API provides CRUD operations for:
/// - [MonthlyBudgetModel]
/// - [WeeklyBudgetModel]
///
/// Features:
/// - Data persistence with Isar
/// - Support for future model migrations
/// - Maintains data integrity during async operations
/// {@endtemplate}
class SimpleBudgetLocalApi with HasLocalApis {
  Future<MonthlyBudgetModel> getMonthlyBudget(final BudgetModelId id) =>
      localDb.getItem(
        key: id.value,
        defaultValue: MonthlyBudgetModel(id: id),
        fromJson: (final json) =>
            json.isEmpty ? null : MonthlyBudgetModel.fromJson(json),
      );

  Future<WeeklyBudgetModel> getWeeklyBudget(final BudgetModelId id) =>
      localDb.getItem(
        key: id.value,
        defaultValue: WeeklyBudgetModel(id: id),
        fromJson: (final json) =>
            json.isEmpty ? null : WeeklyBudgetModel.fromJson(json),
      );

  Future<void> upsertMonthlyBudget(
    final MonthlyBudgetModel model,
  ) =>
      localDb.setItem(
        key: model.id.value,
        value: model,
        toJson: (final instance) => instance.toJson(),
      );

  Future<void> upsertWeeklyBudget(final WeeklyBudgetModel model) =>
      localDb.setItem(
        key: model.id.value,
        value: model,
        toJson: (final instance) => instance.toJson(),
      );
}
