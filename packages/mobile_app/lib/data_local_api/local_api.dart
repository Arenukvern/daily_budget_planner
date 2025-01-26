import 'package:isar/isar.dart';
import 'package:mobile_app/common_imports.dart';

/// Base class for all local API implementations
base class LocalApi with HasComplexLocalDb {
  /// The Isar database instance
  Isar get isar => isarDb.db;
}
