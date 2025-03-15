import 'dart:convert';
import 'dart:io';

// import 'package:isar/isar.dart';
import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/data_local_api/db/db.dart';
import 'package:path_provider/path_provider.dart';

// part 'isar.g.dart';
part '../isar/budget_isar.dart';
part '../isar/scheduled_transaction_isar.dart';
part '../isar/task_isar.dart';
part '../isar/transaction_isar.dart';

const _isarDbVersion = 'isar_4';

final class IsarDb extends ComplexLocalDb {
  // Isar? _db;
  // Isar get db => _db == null
  //     ? throw ArgumentError.value('db is not initialzed. Call open first.')
  //     : _db!;
  @override
  Future<void> open() async {
    final dir =
        Platform.isIOS
            ? await getLibraryDirectory()
            : await getApplicationDocumentsDirectory();

    // _db ??= Isar.open(
    //   schemas: [
    //     BudgetIsarCollectionSchema,
    //     TransactionIsarCollectionSchema,
    //     ScheduledTransactionIsarCollectionSchema,
    //     TaskIsarCollectionSchema,
    //   ],
    //   name: _isarDbVersion,
    //   directory: dir.path,
    // );
    // if (kIsWeb) await Isar.initialize();
  }

  // IsarCollection<String, BudgetIsarCollection> get budgets =>
  //     db.budgetIsarCollections;

  // IsarCollection<String, TransactionIsarCollection> get transactions =>
  //     db.transactionIsarCollections;

  // IsarCollection<String, ScheduledTransactionIsarCollection>
  //     get scheduledTransactions => db.scheduledTransactionIsarCollections;

  // IsarCollection<String, TaskIsarCollection> get tasks =>
  //     db.taskIsarCollections;

  @override
  Future<void> close() async {
    // _db?.close(
    //     // deleteFromDisk: true
    //     );
    // _db = null;
  }
}

mixin IsarIdMixin {
  String id = '';
  // @Id()
  String get isarId => id;
  set isarId(final String value) => id = value;
}
