export 'isar.dart';
export 'sembast_db.dart';

base class ComplexLocalDb {
  const ComplexLocalDb();
  Future<void> open() async {}
  Future<void> close() async {}
}

final class MockComplexLocalDb extends ComplexLocalDb {}
