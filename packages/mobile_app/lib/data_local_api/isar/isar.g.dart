// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetBudgetIsarCollectionCollection on Isar {
  IsarCollection<String, BudgetIsarCollection> get budgetIsarCollections =>
      this.collection();
}

const BudgetIsarCollectionSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'BudgetIsarCollection',
    idName: 'isarId',
    embedded: false,
    properties: [
      IsarPropertySchema(
        name: 'id',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'isarId',
        type: IsarType.string,
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<String, BudgetIsarCollection>(
    serialize: serializeBudgetIsarCollection,
    deserialize: deserializeBudgetIsarCollection,
    deserializeProperty: deserializeBudgetIsarCollectionProp,
  ),
  embeddedSchemas: [],
);

@isarProtected
int serializeBudgetIsarCollection(
    IsarWriter writer, BudgetIsarCollection object) {
  IsarCore.writeString(writer, 1, object.id);
  IsarCore.writeString(writer, 2, object.isarId);
  return Isar.fastHash(object.isarId);
}

@isarProtected
BudgetIsarCollection deserializeBudgetIsarCollection(IsarReader reader) {
  final object = BudgetIsarCollection();
  object.id = IsarCore.readString(reader, 1) ?? '';
  object.isarId = IsarCore.readString(reader, 2) ?? '';
  return object;
}

@isarProtected
dynamic deserializeBudgetIsarCollectionProp(IsarReader reader, int property) {
  switch (property) {
    case 1:
      return IsarCore.readString(reader, 1) ?? '';
    case 2:
      return IsarCore.readString(reader, 2) ?? '';
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _BudgetIsarCollectionUpdate {
  bool call({
    required String isarId,
    String? id,
  });
}

class _BudgetIsarCollectionUpdateImpl implements _BudgetIsarCollectionUpdate {
  const _BudgetIsarCollectionUpdateImpl(this.collection);

  final IsarCollection<String, BudgetIsarCollection> collection;

  @override
  bool call({
    required String isarId,
    Object? id = ignore,
  }) {
    return collection.updateProperties([
          isarId
        ], {
          if (id != ignore) 1: id as String?,
        }) >
        0;
  }
}

sealed class _BudgetIsarCollectionUpdateAll {
  int call({
    required List<String> isarId,
    String? id,
  });
}

class _BudgetIsarCollectionUpdateAllImpl
    implements _BudgetIsarCollectionUpdateAll {
  const _BudgetIsarCollectionUpdateAllImpl(this.collection);

  final IsarCollection<String, BudgetIsarCollection> collection;

  @override
  int call({
    required List<String> isarId,
    Object? id = ignore,
  }) {
    return collection.updateProperties(isarId, {
      if (id != ignore) 1: id as String?,
    });
  }
}

extension BudgetIsarCollectionUpdate
    on IsarCollection<String, BudgetIsarCollection> {
  _BudgetIsarCollectionUpdate get update =>
      _BudgetIsarCollectionUpdateImpl(this);

  _BudgetIsarCollectionUpdateAll get updateAll =>
      _BudgetIsarCollectionUpdateAllImpl(this);
}

sealed class _BudgetIsarCollectionQueryUpdate {
  int call({
    String? id,
  });
}

class _BudgetIsarCollectionQueryUpdateImpl
    implements _BudgetIsarCollectionQueryUpdate {
  const _BudgetIsarCollectionQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<BudgetIsarCollection> query;
  final int? limit;

  @override
  int call({
    Object? id = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (id != ignore) 1: id as String?,
    });
  }
}

extension BudgetIsarCollectionQueryUpdate on IsarQuery<BudgetIsarCollection> {
  _BudgetIsarCollectionQueryUpdate get updateFirst =>
      _BudgetIsarCollectionQueryUpdateImpl(this, limit: 1);

  _BudgetIsarCollectionQueryUpdate get updateAll =>
      _BudgetIsarCollectionQueryUpdateImpl(this);
}

class _BudgetIsarCollectionQueryBuilderUpdateImpl
    implements _BudgetIsarCollectionQueryUpdate {
  const _BudgetIsarCollectionQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<BudgetIsarCollection, BudgetIsarCollection, QOperations>
      query;
  final int? limit;

  @override
  int call({
    Object? id = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (id != ignore) 1: id as String?,
      });
    } finally {
      q.close();
    }
  }
}

extension BudgetIsarCollectionQueryBuilderUpdate
    on QueryBuilder<BudgetIsarCollection, BudgetIsarCollection, QOperations> {
  _BudgetIsarCollectionQueryUpdate get updateFirst =>
      _BudgetIsarCollectionQueryBuilderUpdateImpl(this, limit: 1);

  _BudgetIsarCollectionQueryUpdate get updateAll =>
      _BudgetIsarCollectionQueryBuilderUpdateImpl(this);
}

extension BudgetIsarCollectionQueryFilter on QueryBuilder<BudgetIsarCollection,
    BudgetIsarCollection, QFilterCondition> {
  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection,
      QAfterFilterCondition> idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection,
      QAfterFilterCondition> idGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection,
      QAfterFilterCondition> idGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection,
      QAfterFilterCondition> idLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection,
      QAfterFilterCondition> idLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection,
      QAfterFilterCondition> idBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 1,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection,
      QAfterFilterCondition> idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection,
      QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection,
          QAfterFilterCondition>
      idContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection,
          QAfterFilterCondition>
      idMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 1,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection,
      QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection,
      QAfterFilterCondition> idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection,
      QAfterFilterCondition> isarIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection,
      QAfterFilterCondition> isarIdGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection,
      QAfterFilterCondition> isarIdGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection,
      QAfterFilterCondition> isarIdLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection,
      QAfterFilterCondition> isarIdLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection,
      QAfterFilterCondition> isarIdBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 2,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection,
      QAfterFilterCondition> isarIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection,
      QAfterFilterCondition> isarIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection,
          QAfterFilterCondition>
      isarIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection,
          QAfterFilterCondition>
      isarIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 2,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection,
      QAfterFilterCondition> isarIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection,
      QAfterFilterCondition> isarIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }
}

extension BudgetIsarCollectionQueryObject on QueryBuilder<BudgetIsarCollection,
    BudgetIsarCollection, QFilterCondition> {}

extension BudgetIsarCollectionQuerySortBy
    on QueryBuilder<BudgetIsarCollection, BudgetIsarCollection, QSortBy> {
  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection, QAfterSortBy>
      sortById({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection, QAfterSortBy>
      sortByIdDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection, QAfterSortBy>
      sortByIsarId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        2,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection, QAfterSortBy>
      sortByIsarIdDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        2,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }
}

extension BudgetIsarCollectionQuerySortThenBy
    on QueryBuilder<BudgetIsarCollection, BudgetIsarCollection, QSortThenBy> {
  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection, QAfterSortBy>
      thenById({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection, QAfterSortBy>
      thenByIdDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection, QAfterSortBy>
      thenByIsarId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection, QAfterSortBy>
      thenByIsarIdDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }
}

extension BudgetIsarCollectionQueryWhereDistinct
    on QueryBuilder<BudgetIsarCollection, BudgetIsarCollection, QDistinct> {
  QueryBuilder<BudgetIsarCollection, BudgetIsarCollection, QAfterDistinct>
      distinctById({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1, caseSensitive: caseSensitive);
    });
  }
}

extension BudgetIsarCollectionQueryProperty1
    on QueryBuilder<BudgetIsarCollection, BudgetIsarCollection, QProperty> {
  QueryBuilder<BudgetIsarCollection, String, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<BudgetIsarCollection, String, QAfterProperty> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }
}

extension BudgetIsarCollectionQueryProperty2<R>
    on QueryBuilder<BudgetIsarCollection, R, QAfterProperty> {
  QueryBuilder<BudgetIsarCollection, (R, String), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<BudgetIsarCollection, (R, String), QAfterProperty>
      isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }
}

extension BudgetIsarCollectionQueryProperty3<R1, R2>
    on QueryBuilder<BudgetIsarCollection, (R1, R2), QAfterProperty> {
  QueryBuilder<BudgetIsarCollection, (R1, R2, String), QOperations>
      idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<BudgetIsarCollection, (R1, R2, String), QOperations>
      isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetExpenseIsarCollectionCollection on Isar {
  IsarCollection<String, ExpenseIsarCollection> get expenseIsarCollections =>
      this.collection();
}

const ExpenseIsarCollectionSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'ExpenseIsarCollection',
    idName: 'isarId',
    embedded: false,
    properties: [
      IsarPropertySchema(
        name: 'id',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'isarId',
        type: IsarType.string,
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<String, ExpenseIsarCollection>(
    serialize: serializeExpenseIsarCollection,
    deserialize: deserializeExpenseIsarCollection,
    deserializeProperty: deserializeExpenseIsarCollectionProp,
  ),
  embeddedSchemas: [],
);

@isarProtected
int serializeExpenseIsarCollection(
    IsarWriter writer, ExpenseIsarCollection object) {
  IsarCore.writeString(writer, 1, object.id);
  IsarCore.writeString(writer, 2, object.isarId);
  return Isar.fastHash(object.isarId);
}

@isarProtected
ExpenseIsarCollection deserializeExpenseIsarCollection(IsarReader reader) {
  final object = ExpenseIsarCollection();
  object.id = IsarCore.readString(reader, 1) ?? '';
  object.isarId = IsarCore.readString(reader, 2) ?? '';
  return object;
}

@isarProtected
dynamic deserializeExpenseIsarCollectionProp(IsarReader reader, int property) {
  switch (property) {
    case 1:
      return IsarCore.readString(reader, 1) ?? '';
    case 2:
      return IsarCore.readString(reader, 2) ?? '';
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _ExpenseIsarCollectionUpdate {
  bool call({
    required String isarId,
    String? id,
  });
}

class _ExpenseIsarCollectionUpdateImpl implements _ExpenseIsarCollectionUpdate {
  const _ExpenseIsarCollectionUpdateImpl(this.collection);

  final IsarCollection<String, ExpenseIsarCollection> collection;

  @override
  bool call({
    required String isarId,
    Object? id = ignore,
  }) {
    return collection.updateProperties([
          isarId
        ], {
          if (id != ignore) 1: id as String?,
        }) >
        0;
  }
}

sealed class _ExpenseIsarCollectionUpdateAll {
  int call({
    required List<String> isarId,
    String? id,
  });
}

class _ExpenseIsarCollectionUpdateAllImpl
    implements _ExpenseIsarCollectionUpdateAll {
  const _ExpenseIsarCollectionUpdateAllImpl(this.collection);

  final IsarCollection<String, ExpenseIsarCollection> collection;

  @override
  int call({
    required List<String> isarId,
    Object? id = ignore,
  }) {
    return collection.updateProperties(isarId, {
      if (id != ignore) 1: id as String?,
    });
  }
}

extension ExpenseIsarCollectionUpdate
    on IsarCollection<String, ExpenseIsarCollection> {
  _ExpenseIsarCollectionUpdate get update =>
      _ExpenseIsarCollectionUpdateImpl(this);

  _ExpenseIsarCollectionUpdateAll get updateAll =>
      _ExpenseIsarCollectionUpdateAllImpl(this);
}

sealed class _ExpenseIsarCollectionQueryUpdate {
  int call({
    String? id,
  });
}

class _ExpenseIsarCollectionQueryUpdateImpl
    implements _ExpenseIsarCollectionQueryUpdate {
  const _ExpenseIsarCollectionQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<ExpenseIsarCollection> query;
  final int? limit;

  @override
  int call({
    Object? id = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (id != ignore) 1: id as String?,
    });
  }
}

extension ExpenseIsarCollectionQueryUpdate on IsarQuery<ExpenseIsarCollection> {
  _ExpenseIsarCollectionQueryUpdate get updateFirst =>
      _ExpenseIsarCollectionQueryUpdateImpl(this, limit: 1);

  _ExpenseIsarCollectionQueryUpdate get updateAll =>
      _ExpenseIsarCollectionQueryUpdateImpl(this);
}

class _ExpenseIsarCollectionQueryBuilderUpdateImpl
    implements _ExpenseIsarCollectionQueryUpdate {
  const _ExpenseIsarCollectionQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection, QOperations>
      query;
  final int? limit;

  @override
  int call({
    Object? id = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (id != ignore) 1: id as String?,
      });
    } finally {
      q.close();
    }
  }
}

extension ExpenseIsarCollectionQueryBuilderUpdate
    on QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection, QOperations> {
  _ExpenseIsarCollectionQueryUpdate get updateFirst =>
      _ExpenseIsarCollectionQueryBuilderUpdateImpl(this, limit: 1);

  _ExpenseIsarCollectionQueryUpdate get updateAll =>
      _ExpenseIsarCollectionQueryBuilderUpdateImpl(this);
}

extension ExpenseIsarCollectionQueryFilter on QueryBuilder<
    ExpenseIsarCollection, ExpenseIsarCollection, QFilterCondition> {
  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection,
      QAfterFilterCondition> idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection,
      QAfterFilterCondition> idGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection,
      QAfterFilterCondition> idGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection,
      QAfterFilterCondition> idLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection,
      QAfterFilterCondition> idLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection,
      QAfterFilterCondition> idBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 1,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection,
      QAfterFilterCondition> idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection,
      QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection,
          QAfterFilterCondition>
      idContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection,
          QAfterFilterCondition>
      idMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 1,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection,
      QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection,
      QAfterFilterCondition> idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection,
      QAfterFilterCondition> isarIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection,
      QAfterFilterCondition> isarIdGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection,
      QAfterFilterCondition> isarIdGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection,
      QAfterFilterCondition> isarIdLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection,
      QAfterFilterCondition> isarIdLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection,
      QAfterFilterCondition> isarIdBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 2,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection,
      QAfterFilterCondition> isarIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection,
      QAfterFilterCondition> isarIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection,
          QAfterFilterCondition>
      isarIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection,
          QAfterFilterCondition>
      isarIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 2,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection,
      QAfterFilterCondition> isarIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection,
      QAfterFilterCondition> isarIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }
}

extension ExpenseIsarCollectionQueryObject on QueryBuilder<
    ExpenseIsarCollection, ExpenseIsarCollection, QFilterCondition> {}

extension ExpenseIsarCollectionQuerySortBy
    on QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection, QSortBy> {
  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection, QAfterSortBy>
      sortById({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection, QAfterSortBy>
      sortByIdDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection, QAfterSortBy>
      sortByIsarId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        2,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection, QAfterSortBy>
      sortByIsarIdDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        2,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }
}

extension ExpenseIsarCollectionQuerySortThenBy
    on QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection, QSortThenBy> {
  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection, QAfterSortBy>
      thenById({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection, QAfterSortBy>
      thenByIdDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection, QAfterSortBy>
      thenByIsarId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection, QAfterSortBy>
      thenByIsarIdDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }
}

extension ExpenseIsarCollectionQueryWhereDistinct
    on QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection, QDistinct> {
  QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection, QAfterDistinct>
      distinctById({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1, caseSensitive: caseSensitive);
    });
  }
}

extension ExpenseIsarCollectionQueryProperty1
    on QueryBuilder<ExpenseIsarCollection, ExpenseIsarCollection, QProperty> {
  QueryBuilder<ExpenseIsarCollection, String, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<ExpenseIsarCollection, String, QAfterProperty> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }
}

extension ExpenseIsarCollectionQueryProperty2<R>
    on QueryBuilder<ExpenseIsarCollection, R, QAfterProperty> {
  QueryBuilder<ExpenseIsarCollection, (R, String), QAfterProperty>
      idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<ExpenseIsarCollection, (R, String), QAfterProperty>
      isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }
}

extension ExpenseIsarCollectionQueryProperty3<R1, R2>
    on QueryBuilder<ExpenseIsarCollection, (R1, R2), QAfterProperty> {
  QueryBuilder<ExpenseIsarCollection, (R1, R2, String), QOperations>
      idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<ExpenseIsarCollection, (R1, R2, String), QOperations>
      isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetScheduledTransactionIsarCollectionCollection on Isar {
  IsarCollection<String, ScheduledTransactionIsarCollection>
      get scheduledTransactionIsarCollections => this.collection();
}

const ScheduledTransactionIsarCollectionSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'ScheduledTransactionIsarCollection',
    idName: 'isarId',
    embedded: false,
    properties: [
      IsarPropertySchema(
        name: 'scheduledTransactionJson',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'taskId',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'startedAt',
        type: IsarType.dateTime,
      ),
      IsarPropertySchema(
        name: 'endedAt',
        type: IsarType.dateTime,
      ),
      IsarPropertySchema(
        name: 'id',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'isarId',
        type: IsarType.string,
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<String, ScheduledTransactionIsarCollection>(
    serialize: serializeScheduledTransactionIsarCollection,
    deserialize: deserializeScheduledTransactionIsarCollection,
    deserializeProperty: deserializeScheduledTransactionIsarCollectionProp,
  ),
  embeddedSchemas: [],
);

@isarProtected
int serializeScheduledTransactionIsarCollection(
    IsarWriter writer, ScheduledTransactionIsarCollection object) {
  IsarCore.writeString(writer, 1, object.scheduledTransactionJson);
  IsarCore.writeString(writer, 2, object.taskId);
  IsarCore.writeLong(writer, 3,
      object.startedAt?.toUtc().microsecondsSinceEpoch ?? -9223372036854775808);
  IsarCore.writeLong(writer, 4,
      object.endedAt?.toUtc().microsecondsSinceEpoch ?? -9223372036854775808);
  IsarCore.writeString(writer, 5, object.id);
  IsarCore.writeString(writer, 6, object.isarId);
  return Isar.fastHash(object.isarId);
}

@isarProtected
ScheduledTransactionIsarCollection
    deserializeScheduledTransactionIsarCollection(IsarReader reader) {
  final object = ScheduledTransactionIsarCollection();
  object.scheduledTransactionJson = IsarCore.readString(reader, 1) ?? '';
  object.taskId = IsarCore.readString(reader, 2) ?? '';
  {
    final value = IsarCore.readLong(reader, 3);
    if (value == -9223372036854775808) {
      object.startedAt = null;
    } else {
      object.startedAt =
          DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true).toLocal();
    }
  }
  {
    final value = IsarCore.readLong(reader, 4);
    if (value == -9223372036854775808) {
      object.endedAt = null;
    } else {
      object.endedAt =
          DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true).toLocal();
    }
  }
  object.id = IsarCore.readString(reader, 5) ?? '';
  object.isarId = IsarCore.readString(reader, 6) ?? '';
  return object;
}

@isarProtected
dynamic deserializeScheduledTransactionIsarCollectionProp(
    IsarReader reader, int property) {
  switch (property) {
    case 1:
      return IsarCore.readString(reader, 1) ?? '';
    case 2:
      return IsarCore.readString(reader, 2) ?? '';
    case 3:
      {
        final value = IsarCore.readLong(reader, 3);
        if (value == -9223372036854775808) {
          return null;
        } else {
          return DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true)
              .toLocal();
        }
      }
    case 4:
      {
        final value = IsarCore.readLong(reader, 4);
        if (value == -9223372036854775808) {
          return null;
        } else {
          return DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true)
              .toLocal();
        }
      }
    case 5:
      return IsarCore.readString(reader, 5) ?? '';
    case 6:
      return IsarCore.readString(reader, 6) ?? '';
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _ScheduledTransactionIsarCollectionUpdate {
  bool call({
    required String isarId,
    String? scheduledTransactionJson,
    String? taskId,
    DateTime? startedAt,
    DateTime? endedAt,
    String? id,
  });
}

class _ScheduledTransactionIsarCollectionUpdateImpl
    implements _ScheduledTransactionIsarCollectionUpdate {
  const _ScheduledTransactionIsarCollectionUpdateImpl(this.collection);

  final IsarCollection<String, ScheduledTransactionIsarCollection> collection;

  @override
  bool call({
    required String isarId,
    Object? scheduledTransactionJson = ignore,
    Object? taskId = ignore,
    Object? startedAt = ignore,
    Object? endedAt = ignore,
    Object? id = ignore,
  }) {
    return collection.updateProperties([
          isarId
        ], {
          if (scheduledTransactionJson != ignore)
            1: scheduledTransactionJson as String?,
          if (taskId != ignore) 2: taskId as String?,
          if (startedAt != ignore) 3: startedAt as DateTime?,
          if (endedAt != ignore) 4: endedAt as DateTime?,
          if (id != ignore) 5: id as String?,
        }) >
        0;
  }
}

sealed class _ScheduledTransactionIsarCollectionUpdateAll {
  int call({
    required List<String> isarId,
    String? scheduledTransactionJson,
    String? taskId,
    DateTime? startedAt,
    DateTime? endedAt,
    String? id,
  });
}

class _ScheduledTransactionIsarCollectionUpdateAllImpl
    implements _ScheduledTransactionIsarCollectionUpdateAll {
  const _ScheduledTransactionIsarCollectionUpdateAllImpl(this.collection);

  final IsarCollection<String, ScheduledTransactionIsarCollection> collection;

  @override
  int call({
    required List<String> isarId,
    Object? scheduledTransactionJson = ignore,
    Object? taskId = ignore,
    Object? startedAt = ignore,
    Object? endedAt = ignore,
    Object? id = ignore,
  }) {
    return collection.updateProperties(isarId, {
      if (scheduledTransactionJson != ignore)
        1: scheduledTransactionJson as String?,
      if (taskId != ignore) 2: taskId as String?,
      if (startedAt != ignore) 3: startedAt as DateTime?,
      if (endedAt != ignore) 4: endedAt as DateTime?,
      if (id != ignore) 5: id as String?,
    });
  }
}

extension ScheduledTransactionIsarCollectionUpdate
    on IsarCollection<String, ScheduledTransactionIsarCollection> {
  _ScheduledTransactionIsarCollectionUpdate get update =>
      _ScheduledTransactionIsarCollectionUpdateImpl(this);

  _ScheduledTransactionIsarCollectionUpdateAll get updateAll =>
      _ScheduledTransactionIsarCollectionUpdateAllImpl(this);
}

sealed class _ScheduledTransactionIsarCollectionQueryUpdate {
  int call({
    String? scheduledTransactionJson,
    String? taskId,
    DateTime? startedAt,
    DateTime? endedAt,
    String? id,
  });
}

class _ScheduledTransactionIsarCollectionQueryUpdateImpl
    implements _ScheduledTransactionIsarCollectionQueryUpdate {
  const _ScheduledTransactionIsarCollectionQueryUpdateImpl(this.query,
      {this.limit});

  final IsarQuery<ScheduledTransactionIsarCollection> query;
  final int? limit;

  @override
  int call({
    Object? scheduledTransactionJson = ignore,
    Object? taskId = ignore,
    Object? startedAt = ignore,
    Object? endedAt = ignore,
    Object? id = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (scheduledTransactionJson != ignore)
        1: scheduledTransactionJson as String?,
      if (taskId != ignore) 2: taskId as String?,
      if (startedAt != ignore) 3: startedAt as DateTime?,
      if (endedAt != ignore) 4: endedAt as DateTime?,
      if (id != ignore) 5: id as String?,
    });
  }
}

extension ScheduledTransactionIsarCollectionQueryUpdate
    on IsarQuery<ScheduledTransactionIsarCollection> {
  _ScheduledTransactionIsarCollectionQueryUpdate get updateFirst =>
      _ScheduledTransactionIsarCollectionQueryUpdateImpl(this, limit: 1);

  _ScheduledTransactionIsarCollectionQueryUpdate get updateAll =>
      _ScheduledTransactionIsarCollectionQueryUpdateImpl(this);
}

class _ScheduledTransactionIsarCollectionQueryBuilderUpdateImpl
    implements _ScheduledTransactionIsarCollectionQueryUpdate {
  const _ScheduledTransactionIsarCollectionQueryBuilderUpdateImpl(this.query,
      {this.limit});

  final QueryBuilder<ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection, QOperations> query;
  final int? limit;

  @override
  int call({
    Object? scheduledTransactionJson = ignore,
    Object? taskId = ignore,
    Object? startedAt = ignore,
    Object? endedAt = ignore,
    Object? id = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (scheduledTransactionJson != ignore)
          1: scheduledTransactionJson as String?,
        if (taskId != ignore) 2: taskId as String?,
        if (startedAt != ignore) 3: startedAt as DateTime?,
        if (endedAt != ignore) 4: endedAt as DateTime?,
        if (id != ignore) 5: id as String?,
      });
    } finally {
      q.close();
    }
  }
}

extension ScheduledTransactionIsarCollectionQueryBuilderUpdate on QueryBuilder<
    ScheduledTransactionIsarCollection,
    ScheduledTransactionIsarCollection,
    QOperations> {
  _ScheduledTransactionIsarCollectionQueryUpdate get updateFirst =>
      _ScheduledTransactionIsarCollectionQueryBuilderUpdateImpl(this, limit: 1);

  _ScheduledTransactionIsarCollectionQueryUpdate get updateAll =>
      _ScheduledTransactionIsarCollectionQueryBuilderUpdateImpl(this);
}

extension ScheduledTransactionIsarCollectionQueryFilter on QueryBuilder<
    ScheduledTransactionIsarCollection,
    ScheduledTransactionIsarCollection,
    QFilterCondition> {
  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterFilterCondition> scheduledTransactionJsonEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterFilterCondition> scheduledTransactionJsonGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterFilterCondition> scheduledTransactionJsonGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterFilterCondition> scheduledTransactionJsonLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterFilterCondition> scheduledTransactionJsonLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterFilterCondition> scheduledTransactionJsonBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 1,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterFilterCondition> scheduledTransactionJsonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterFilterCondition> scheduledTransactionJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ScheduledTransactionIsarCollection,
          ScheduledTransactionIsarCollection, QAfterFilterCondition>
      scheduledTransactionJsonContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ScheduledTransactionIsarCollection,
          ScheduledTransactionIsarCollection, QAfterFilterCondition>
      scheduledTransactionJsonMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 1,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterFilterCondition> scheduledTransactionJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterFilterCondition> scheduledTransactionJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection, QAfterFilterCondition> taskIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterFilterCondition> taskIdGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterFilterCondition> taskIdGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection, QAfterFilterCondition> taskIdLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterFilterCondition> taskIdLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection, QAfterFilterCondition> taskIdBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 2,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterFilterCondition> taskIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection, QAfterFilterCondition> taskIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ScheduledTransactionIsarCollection,
          ScheduledTransactionIsarCollection, QAfterFilterCondition>
      taskIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ScheduledTransactionIsarCollection,
          ScheduledTransactionIsarCollection, QAfterFilterCondition>
      taskIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 2,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterFilterCondition> taskIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterFilterCondition> taskIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterFilterCondition> startedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 3));
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterFilterCondition> startedAtIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 3));
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterFilterCondition> startedAtEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 3,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterFilterCondition> startedAtGreaterThan(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 3,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterFilterCondition> startedAtGreaterThanOrEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 3,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterFilterCondition> startedAtLessThan(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 3,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterFilterCondition> startedAtLessThanOrEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 3,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterFilterCondition> startedAtBetween(
    DateTime? lower,
    DateTime? upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 3,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterFilterCondition> endedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 4));
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterFilterCondition> endedAtIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 4));
    });
  }

  QueryBuilder<ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection, QAfterFilterCondition> endedAtEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 4,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterFilterCondition> endedAtGreaterThan(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 4,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterFilterCondition> endedAtGreaterThanOrEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 4,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterFilterCondition> endedAtLessThan(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 4,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterFilterCondition> endedAtLessThanOrEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 4,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection, QAfterFilterCondition> endedAtBetween(
    DateTime? lower,
    DateTime? upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 4,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection, QAfterFilterCondition> idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection, QAfterFilterCondition> idGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterFilterCondition> idGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection, QAfterFilterCondition> idLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterFilterCondition> idLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection, QAfterFilterCondition> idBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 5,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection, QAfterFilterCondition> idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection, QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ScheduledTransactionIsarCollection,
          ScheduledTransactionIsarCollection, QAfterFilterCondition>
      idContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ScheduledTransactionIsarCollection,
          ScheduledTransactionIsarCollection, QAfterFilterCondition>
      idMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 5,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection, QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 5,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterFilterCondition> idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 5,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection, QAfterFilterCondition> isarIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterFilterCondition> isarIdGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterFilterCondition> isarIdGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection, QAfterFilterCondition> isarIdLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterFilterCondition> isarIdLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection, QAfterFilterCondition> isarIdBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 6,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterFilterCondition> isarIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection, QAfterFilterCondition> isarIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ScheduledTransactionIsarCollection,
          ScheduledTransactionIsarCollection, QAfterFilterCondition>
      isarIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ScheduledTransactionIsarCollection,
          ScheduledTransactionIsarCollection, QAfterFilterCondition>
      isarIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 6,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterFilterCondition> isarIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 6,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterFilterCondition> isarIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 6,
          value: '',
        ),
      );
    });
  }
}

extension ScheduledTransactionIsarCollectionQueryObject on QueryBuilder<
    ScheduledTransactionIsarCollection,
    ScheduledTransactionIsarCollection,
    QFilterCondition> {}

extension ScheduledTransactionIsarCollectionQuerySortBy on QueryBuilder<
    ScheduledTransactionIsarCollection,
    ScheduledTransactionIsarCollection,
    QSortBy> {
  QueryBuilder<ScheduledTransactionIsarCollection,
          ScheduledTransactionIsarCollection, QAfterSortBy>
      sortByScheduledTransactionJson({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<ScheduledTransactionIsarCollection,
          ScheduledTransactionIsarCollection, QAfterSortBy>
      sortByScheduledTransactionJsonDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterSortBy> sortByTaskId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        2,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterSortBy> sortByTaskIdDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        2,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection, QAfterSortBy> sortByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3);
    });
  }

  QueryBuilder<ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection, QAfterSortBy> sortByStartedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc);
    });
  }

  QueryBuilder<ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection, QAfterSortBy> sortByEndedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4);
    });
  }

  QueryBuilder<ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection, QAfterSortBy> sortByEndedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, sort: Sort.desc);
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterSortBy> sortById({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        5,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterSortBy> sortByIdDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        5,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterSortBy> sortByIsarId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        6,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterSortBy> sortByIsarIdDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        6,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }
}

extension ScheduledTransactionIsarCollectionQuerySortThenBy on QueryBuilder<
    ScheduledTransactionIsarCollection,
    ScheduledTransactionIsarCollection,
    QSortThenBy> {
  QueryBuilder<ScheduledTransactionIsarCollection,
          ScheduledTransactionIsarCollection, QAfterSortBy>
      thenByScheduledTransactionJson({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ScheduledTransactionIsarCollection,
          ScheduledTransactionIsarCollection, QAfterSortBy>
      thenByScheduledTransactionJsonDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterSortBy> thenByTaskId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterSortBy> thenByTaskIdDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection, QAfterSortBy> thenByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3);
    });
  }

  QueryBuilder<ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection, QAfterSortBy> thenByStartedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc);
    });
  }

  QueryBuilder<ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection, QAfterSortBy> thenByEndedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4);
    });
  }

  QueryBuilder<ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection, QAfterSortBy> thenByEndedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, sort: Sort.desc);
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterSortBy> thenById({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterSortBy> thenByIdDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterSortBy> thenByIsarId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterSortBy> thenByIsarIdDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }
}

extension ScheduledTransactionIsarCollectionQueryWhereDistinct on QueryBuilder<
    ScheduledTransactionIsarCollection,
    ScheduledTransactionIsarCollection,
    QDistinct> {
  QueryBuilder<ScheduledTransactionIsarCollection,
          ScheduledTransactionIsarCollection, QAfterDistinct>
      distinctByScheduledTransactionJson({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterDistinct> distinctByTaskId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterDistinct> distinctByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(3);
    });
  }

  QueryBuilder<ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection, QAfterDistinct> distinctByEndedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(4);
    });
  }

  QueryBuilder<
      ScheduledTransactionIsarCollection,
      ScheduledTransactionIsarCollection,
      QAfterDistinct> distinctById({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(5, caseSensitive: caseSensitive);
    });
  }
}

extension ScheduledTransactionIsarCollectionQueryProperty1 on QueryBuilder<
    ScheduledTransactionIsarCollection,
    ScheduledTransactionIsarCollection,
    QProperty> {
  QueryBuilder<ScheduledTransactionIsarCollection, String, QAfterProperty>
      scheduledTransactionJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<ScheduledTransactionIsarCollection, String, QAfterProperty>
      taskIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<ScheduledTransactionIsarCollection, DateTime?, QAfterProperty>
      startedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<ScheduledTransactionIsarCollection, DateTime?, QAfterProperty>
      endedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<ScheduledTransactionIsarCollection, String, QAfterProperty>
      idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<ScheduledTransactionIsarCollection, String, QAfterProperty>
      isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }
}

extension ScheduledTransactionIsarCollectionQueryProperty2<R>
    on QueryBuilder<ScheduledTransactionIsarCollection, R, QAfterProperty> {
  QueryBuilder<ScheduledTransactionIsarCollection, (R, String), QAfterProperty>
      scheduledTransactionJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<ScheduledTransactionIsarCollection, (R, String), QAfterProperty>
      taskIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<ScheduledTransactionIsarCollection, (R, DateTime?),
      QAfterProperty> startedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<ScheduledTransactionIsarCollection, (R, DateTime?),
      QAfterProperty> endedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<ScheduledTransactionIsarCollection, (R, String), QAfterProperty>
      idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<ScheduledTransactionIsarCollection, (R, String), QAfterProperty>
      isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }
}

extension ScheduledTransactionIsarCollectionQueryProperty3<R1, R2>
    on QueryBuilder<ScheduledTransactionIsarCollection, (R1, R2),
        QAfterProperty> {
  QueryBuilder<ScheduledTransactionIsarCollection, (R1, R2, String),
      QOperations> scheduledTransactionJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<ScheduledTransactionIsarCollection, (R1, R2, String),
      QOperations> taskIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<ScheduledTransactionIsarCollection, (R1, R2, DateTime?),
      QOperations> startedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<ScheduledTransactionIsarCollection, (R1, R2, DateTime?),
      QOperations> endedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<ScheduledTransactionIsarCollection, (R1, R2, String),
      QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<ScheduledTransactionIsarCollection, (R1, R2, String),
      QOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetTaskIsarCollectionCollection on Isar {
  IsarCollection<String, TaskIsarCollection> get taskIsarCollections =>
      this.collection();
}

const TaskIsarCollectionSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'TaskIsarCollection',
    idName: 'isarId',
    embedded: false,
    properties: [
      IsarPropertySchema(
        name: 'taskJson',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'id',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'isarId',
        type: IsarType.string,
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<String, TaskIsarCollection>(
    serialize: serializeTaskIsarCollection,
    deserialize: deserializeTaskIsarCollection,
    deserializeProperty: deserializeTaskIsarCollectionProp,
  ),
  embeddedSchemas: [],
);

@isarProtected
int serializeTaskIsarCollection(IsarWriter writer, TaskIsarCollection object) {
  IsarCore.writeString(writer, 1, object.taskJson);
  IsarCore.writeString(writer, 2, object.id);
  IsarCore.writeString(writer, 3, object.isarId);
  return Isar.fastHash(object.isarId);
}

@isarProtected
TaskIsarCollection deserializeTaskIsarCollection(IsarReader reader) {
  final object = TaskIsarCollection();
  object.taskJson = IsarCore.readString(reader, 1) ?? '';
  object.id = IsarCore.readString(reader, 2) ?? '';
  object.isarId = IsarCore.readString(reader, 3) ?? '';
  return object;
}

@isarProtected
dynamic deserializeTaskIsarCollectionProp(IsarReader reader, int property) {
  switch (property) {
    case 1:
      return IsarCore.readString(reader, 1) ?? '';
    case 2:
      return IsarCore.readString(reader, 2) ?? '';
    case 3:
      return IsarCore.readString(reader, 3) ?? '';
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _TaskIsarCollectionUpdate {
  bool call({
    required String isarId,
    String? taskJson,
    String? id,
  });
}

class _TaskIsarCollectionUpdateImpl implements _TaskIsarCollectionUpdate {
  const _TaskIsarCollectionUpdateImpl(this.collection);

  final IsarCollection<String, TaskIsarCollection> collection;

  @override
  bool call({
    required String isarId,
    Object? taskJson = ignore,
    Object? id = ignore,
  }) {
    return collection.updateProperties([
          isarId
        ], {
          if (taskJson != ignore) 1: taskJson as String?,
          if (id != ignore) 2: id as String?,
        }) >
        0;
  }
}

sealed class _TaskIsarCollectionUpdateAll {
  int call({
    required List<String> isarId,
    String? taskJson,
    String? id,
  });
}

class _TaskIsarCollectionUpdateAllImpl implements _TaskIsarCollectionUpdateAll {
  const _TaskIsarCollectionUpdateAllImpl(this.collection);

  final IsarCollection<String, TaskIsarCollection> collection;

  @override
  int call({
    required List<String> isarId,
    Object? taskJson = ignore,
    Object? id = ignore,
  }) {
    return collection.updateProperties(isarId, {
      if (taskJson != ignore) 1: taskJson as String?,
      if (id != ignore) 2: id as String?,
    });
  }
}

extension TaskIsarCollectionUpdate
    on IsarCollection<String, TaskIsarCollection> {
  _TaskIsarCollectionUpdate get update => _TaskIsarCollectionUpdateImpl(this);

  _TaskIsarCollectionUpdateAll get updateAll =>
      _TaskIsarCollectionUpdateAllImpl(this);
}

sealed class _TaskIsarCollectionQueryUpdate {
  int call({
    String? taskJson,
    String? id,
  });
}

class _TaskIsarCollectionQueryUpdateImpl
    implements _TaskIsarCollectionQueryUpdate {
  const _TaskIsarCollectionQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<TaskIsarCollection> query;
  final int? limit;

  @override
  int call({
    Object? taskJson = ignore,
    Object? id = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (taskJson != ignore) 1: taskJson as String?,
      if (id != ignore) 2: id as String?,
    });
  }
}

extension TaskIsarCollectionQueryUpdate on IsarQuery<TaskIsarCollection> {
  _TaskIsarCollectionQueryUpdate get updateFirst =>
      _TaskIsarCollectionQueryUpdateImpl(this, limit: 1);

  _TaskIsarCollectionQueryUpdate get updateAll =>
      _TaskIsarCollectionQueryUpdateImpl(this);
}

class _TaskIsarCollectionQueryBuilderUpdateImpl
    implements _TaskIsarCollectionQueryUpdate {
  const _TaskIsarCollectionQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<TaskIsarCollection, TaskIsarCollection, QOperations> query;
  final int? limit;

  @override
  int call({
    Object? taskJson = ignore,
    Object? id = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (taskJson != ignore) 1: taskJson as String?,
        if (id != ignore) 2: id as String?,
      });
    } finally {
      q.close();
    }
  }
}

extension TaskIsarCollectionQueryBuilderUpdate
    on QueryBuilder<TaskIsarCollection, TaskIsarCollection, QOperations> {
  _TaskIsarCollectionQueryUpdate get updateFirst =>
      _TaskIsarCollectionQueryBuilderUpdateImpl(this, limit: 1);

  _TaskIsarCollectionQueryUpdate get updateAll =>
      _TaskIsarCollectionQueryBuilderUpdateImpl(this);
}

extension TaskIsarCollectionQueryFilter
    on QueryBuilder<TaskIsarCollection, TaskIsarCollection, QFilterCondition> {
  QueryBuilder<TaskIsarCollection, TaskIsarCollection, QAfterFilterCondition>
      taskJsonEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskIsarCollection, TaskIsarCollection, QAfterFilterCondition>
      taskJsonGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskIsarCollection, TaskIsarCollection, QAfterFilterCondition>
      taskJsonGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskIsarCollection, TaskIsarCollection, QAfterFilterCondition>
      taskJsonLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskIsarCollection, TaskIsarCollection, QAfterFilterCondition>
      taskJsonLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskIsarCollection, TaskIsarCollection, QAfterFilterCondition>
      taskJsonBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 1,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskIsarCollection, TaskIsarCollection, QAfterFilterCondition>
      taskJsonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskIsarCollection, TaskIsarCollection, QAfterFilterCondition>
      taskJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskIsarCollection, TaskIsarCollection, QAfterFilterCondition>
      taskJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskIsarCollection, TaskIsarCollection, QAfterFilterCondition>
      taskJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 1,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskIsarCollection, TaskIsarCollection, QAfterFilterCondition>
      taskJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<TaskIsarCollection, TaskIsarCollection, QAfterFilterCondition>
      taskJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<TaskIsarCollection, TaskIsarCollection, QAfterFilterCondition>
      idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskIsarCollection, TaskIsarCollection, QAfterFilterCondition>
      idGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskIsarCollection, TaskIsarCollection, QAfterFilterCondition>
      idGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskIsarCollection, TaskIsarCollection, QAfterFilterCondition>
      idLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskIsarCollection, TaskIsarCollection, QAfterFilterCondition>
      idLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskIsarCollection, TaskIsarCollection, QAfterFilterCondition>
      idBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 2,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskIsarCollection, TaskIsarCollection, QAfterFilterCondition>
      idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskIsarCollection, TaskIsarCollection, QAfterFilterCondition>
      idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskIsarCollection, TaskIsarCollection, QAfterFilterCondition>
      idContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskIsarCollection, TaskIsarCollection, QAfterFilterCondition>
      idMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 2,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskIsarCollection, TaskIsarCollection, QAfterFilterCondition>
      idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<TaskIsarCollection, TaskIsarCollection, QAfterFilterCondition>
      idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<TaskIsarCollection, TaskIsarCollection, QAfterFilterCondition>
      isarIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskIsarCollection, TaskIsarCollection, QAfterFilterCondition>
      isarIdGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskIsarCollection, TaskIsarCollection, QAfterFilterCondition>
      isarIdGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskIsarCollection, TaskIsarCollection, QAfterFilterCondition>
      isarIdLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskIsarCollection, TaskIsarCollection, QAfterFilterCondition>
      isarIdLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskIsarCollection, TaskIsarCollection, QAfterFilterCondition>
      isarIdBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 3,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskIsarCollection, TaskIsarCollection, QAfterFilterCondition>
      isarIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskIsarCollection, TaskIsarCollection, QAfterFilterCondition>
      isarIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskIsarCollection, TaskIsarCollection, QAfterFilterCondition>
      isarIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskIsarCollection, TaskIsarCollection, QAfterFilterCondition>
      isarIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 3,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TaskIsarCollection, TaskIsarCollection, QAfterFilterCondition>
      isarIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<TaskIsarCollection, TaskIsarCollection, QAfterFilterCondition>
      isarIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }
}

extension TaskIsarCollectionQueryObject
    on QueryBuilder<TaskIsarCollection, TaskIsarCollection, QFilterCondition> {}

extension TaskIsarCollectionQuerySortBy
    on QueryBuilder<TaskIsarCollection, TaskIsarCollection, QSortBy> {
  QueryBuilder<TaskIsarCollection, TaskIsarCollection, QAfterSortBy>
      sortByTaskJson({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<TaskIsarCollection, TaskIsarCollection, QAfterSortBy>
      sortByTaskJsonDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<TaskIsarCollection, TaskIsarCollection, QAfterSortBy> sortById(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        2,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<TaskIsarCollection, TaskIsarCollection, QAfterSortBy>
      sortByIdDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        2,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<TaskIsarCollection, TaskIsarCollection, QAfterSortBy>
      sortByIsarId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        3,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<TaskIsarCollection, TaskIsarCollection, QAfterSortBy>
      sortByIsarIdDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        3,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }
}

extension TaskIsarCollectionQuerySortThenBy
    on QueryBuilder<TaskIsarCollection, TaskIsarCollection, QSortThenBy> {
  QueryBuilder<TaskIsarCollection, TaskIsarCollection, QAfterSortBy>
      thenByTaskJson({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskIsarCollection, TaskIsarCollection, QAfterSortBy>
      thenByTaskJsonDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskIsarCollection, TaskIsarCollection, QAfterSortBy> thenById(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskIsarCollection, TaskIsarCollection, QAfterSortBy>
      thenByIdDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskIsarCollection, TaskIsarCollection, QAfterSortBy>
      thenByIsarId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskIsarCollection, TaskIsarCollection, QAfterSortBy>
      thenByIsarIdDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }
}

extension TaskIsarCollectionQueryWhereDistinct
    on QueryBuilder<TaskIsarCollection, TaskIsarCollection, QDistinct> {
  QueryBuilder<TaskIsarCollection, TaskIsarCollection, QAfterDistinct>
      distinctByTaskJson({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskIsarCollection, TaskIsarCollection, QAfterDistinct>
      distinctById({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2, caseSensitive: caseSensitive);
    });
  }
}

extension TaskIsarCollectionQueryProperty1
    on QueryBuilder<TaskIsarCollection, TaskIsarCollection, QProperty> {
  QueryBuilder<TaskIsarCollection, String, QAfterProperty> taskJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<TaskIsarCollection, String, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<TaskIsarCollection, String, QAfterProperty> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }
}

extension TaskIsarCollectionQueryProperty2<R>
    on QueryBuilder<TaskIsarCollection, R, QAfterProperty> {
  QueryBuilder<TaskIsarCollection, (R, String), QAfterProperty>
      taskJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<TaskIsarCollection, (R, String), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<TaskIsarCollection, (R, String), QAfterProperty>
      isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }
}

extension TaskIsarCollectionQueryProperty3<R1, R2>
    on QueryBuilder<TaskIsarCollection, (R1, R2), QAfterProperty> {
  QueryBuilder<TaskIsarCollection, (R1, R2, String), QOperations>
      taskJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<TaskIsarCollection, (R1, R2, String), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<TaskIsarCollection, (R1, R2, String), QOperations>
      isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetTransactionIsarCollectionCollection on Isar {
  IsarCollection<String, TransactionIsarCollection>
      get transactionIsarCollections => this.collection();
}

const TransactionIsarCollectionSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'TransactionIsarCollection',
    idName: 'isarId',
    embedded: false,
    properties: [
      IsarPropertySchema(
        name: 'transactionJson',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'transactionDate',
        type: IsarType.dateTime,
      ),
      IsarPropertySchema(
        name: 'taskId',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'type',
        type: IsarType.byte,
        enumMap: {"expense": 0, "income": 1, "transferIn": 2, "transferOut": 3},
      ),
      IsarPropertySchema(
        name: 'id',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'isarId',
        type: IsarType.string,
      ),
    ],
    indexes: [
      IsarIndexSchema(
        name: 'transactionDate',
        properties: [
          "transactionDate",
        ],
        unique: false,
        hash: false,
      ),
      IsarIndexSchema(
        name: 'taskId',
        properties: [
          "taskId",
        ],
        unique: false,
        hash: false,
      ),
    ],
  ),
  converter: IsarObjectConverter<String, TransactionIsarCollection>(
    serialize: serializeTransactionIsarCollection,
    deserialize: deserializeTransactionIsarCollection,
    deserializeProperty: deserializeTransactionIsarCollectionProp,
  ),
  embeddedSchemas: [],
);

@isarProtected
int serializeTransactionIsarCollection(
    IsarWriter writer, TransactionIsarCollection object) {
  IsarCore.writeString(writer, 1, object.transactionJson);
  IsarCore.writeLong(
      writer, 2, object.transactionDate.toUtc().microsecondsSinceEpoch);
  IsarCore.writeString(writer, 3, object.taskId);
  IsarCore.writeByte(writer, 4, object.type.index);
  IsarCore.writeString(writer, 5, object.id);
  IsarCore.writeString(writer, 6, object.isarId);
  return Isar.fastHash(object.isarId);
}

@isarProtected
TransactionIsarCollection deserializeTransactionIsarCollection(
    IsarReader reader) {
  final object = TransactionIsarCollection();
  object.transactionJson = IsarCore.readString(reader, 1) ?? '';
  {
    final value = IsarCore.readLong(reader, 2);
    if (value == -9223372036854775808) {
      object.transactionDate =
          DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).toLocal();
    } else {
      object.transactionDate =
          DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true).toLocal();
    }
  }
  object.taskId = IsarCore.readString(reader, 3) ?? '';
  {
    if (IsarCore.readNull(reader, 4)) {
      object.type = TransactionType.expense;
    } else {
      object.type =
          _transactionIsarCollectionType[IsarCore.readByte(reader, 4)] ??
              TransactionType.expense;
    }
  }
  object.id = IsarCore.readString(reader, 5) ?? '';
  object.isarId = IsarCore.readString(reader, 6) ?? '';
  return object;
}

@isarProtected
dynamic deserializeTransactionIsarCollectionProp(
    IsarReader reader, int property) {
  switch (property) {
    case 1:
      return IsarCore.readString(reader, 1) ?? '';
    case 2:
      {
        final value = IsarCore.readLong(reader, 2);
        if (value == -9223372036854775808) {
          return DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).toLocal();
        } else {
          return DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true)
              .toLocal();
        }
      }
    case 3:
      return IsarCore.readString(reader, 3) ?? '';
    case 4:
      {
        if (IsarCore.readNull(reader, 4)) {
          return TransactionType.expense;
        } else {
          return _transactionIsarCollectionType[IsarCore.readByte(reader, 4)] ??
              TransactionType.expense;
        }
      }
    case 5:
      return IsarCore.readString(reader, 5) ?? '';
    case 6:
      return IsarCore.readString(reader, 6) ?? '';
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _TransactionIsarCollectionUpdate {
  bool call({
    required String isarId,
    String? transactionJson,
    DateTime? transactionDate,
    String? taskId,
    TransactionType? type,
    String? id,
  });
}

class _TransactionIsarCollectionUpdateImpl
    implements _TransactionIsarCollectionUpdate {
  const _TransactionIsarCollectionUpdateImpl(this.collection);

  final IsarCollection<String, TransactionIsarCollection> collection;

  @override
  bool call({
    required String isarId,
    Object? transactionJson = ignore,
    Object? transactionDate = ignore,
    Object? taskId = ignore,
    Object? type = ignore,
    Object? id = ignore,
  }) {
    return collection.updateProperties([
          isarId
        ], {
          if (transactionJson != ignore) 1: transactionJson as String?,
          if (transactionDate != ignore) 2: transactionDate as DateTime?,
          if (taskId != ignore) 3: taskId as String?,
          if (type != ignore) 4: type as TransactionType?,
          if (id != ignore) 5: id as String?,
        }) >
        0;
  }
}

sealed class _TransactionIsarCollectionUpdateAll {
  int call({
    required List<String> isarId,
    String? transactionJson,
    DateTime? transactionDate,
    String? taskId,
    TransactionType? type,
    String? id,
  });
}

class _TransactionIsarCollectionUpdateAllImpl
    implements _TransactionIsarCollectionUpdateAll {
  const _TransactionIsarCollectionUpdateAllImpl(this.collection);

  final IsarCollection<String, TransactionIsarCollection> collection;

  @override
  int call({
    required List<String> isarId,
    Object? transactionJson = ignore,
    Object? transactionDate = ignore,
    Object? taskId = ignore,
    Object? type = ignore,
    Object? id = ignore,
  }) {
    return collection.updateProperties(isarId, {
      if (transactionJson != ignore) 1: transactionJson as String?,
      if (transactionDate != ignore) 2: transactionDate as DateTime?,
      if (taskId != ignore) 3: taskId as String?,
      if (type != ignore) 4: type as TransactionType?,
      if (id != ignore) 5: id as String?,
    });
  }
}

extension TransactionIsarCollectionUpdate
    on IsarCollection<String, TransactionIsarCollection> {
  _TransactionIsarCollectionUpdate get update =>
      _TransactionIsarCollectionUpdateImpl(this);

  _TransactionIsarCollectionUpdateAll get updateAll =>
      _TransactionIsarCollectionUpdateAllImpl(this);
}

sealed class _TransactionIsarCollectionQueryUpdate {
  int call({
    String? transactionJson,
    DateTime? transactionDate,
    String? taskId,
    TransactionType? type,
    String? id,
  });
}

class _TransactionIsarCollectionQueryUpdateImpl
    implements _TransactionIsarCollectionQueryUpdate {
  const _TransactionIsarCollectionQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<TransactionIsarCollection> query;
  final int? limit;

  @override
  int call({
    Object? transactionJson = ignore,
    Object? transactionDate = ignore,
    Object? taskId = ignore,
    Object? type = ignore,
    Object? id = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (transactionJson != ignore) 1: transactionJson as String?,
      if (transactionDate != ignore) 2: transactionDate as DateTime?,
      if (taskId != ignore) 3: taskId as String?,
      if (type != ignore) 4: type as TransactionType?,
      if (id != ignore) 5: id as String?,
    });
  }
}

extension TransactionIsarCollectionQueryUpdate
    on IsarQuery<TransactionIsarCollection> {
  _TransactionIsarCollectionQueryUpdate get updateFirst =>
      _TransactionIsarCollectionQueryUpdateImpl(this, limit: 1);

  _TransactionIsarCollectionQueryUpdate get updateAll =>
      _TransactionIsarCollectionQueryUpdateImpl(this);
}

class _TransactionIsarCollectionQueryBuilderUpdateImpl
    implements _TransactionIsarCollectionQueryUpdate {
  const _TransactionIsarCollectionQueryBuilderUpdateImpl(this.query,
      {this.limit});

  final QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QOperations> query;
  final int? limit;

  @override
  int call({
    Object? transactionJson = ignore,
    Object? transactionDate = ignore,
    Object? taskId = ignore,
    Object? type = ignore,
    Object? id = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (transactionJson != ignore) 1: transactionJson as String?,
        if (transactionDate != ignore) 2: transactionDate as DateTime?,
        if (taskId != ignore) 3: taskId as String?,
        if (type != ignore) 4: type as TransactionType?,
        if (id != ignore) 5: id as String?,
      });
    } finally {
      q.close();
    }
  }
}

extension TransactionIsarCollectionQueryBuilderUpdate on QueryBuilder<
    TransactionIsarCollection, TransactionIsarCollection, QOperations> {
  _TransactionIsarCollectionQueryUpdate get updateFirst =>
      _TransactionIsarCollectionQueryBuilderUpdateImpl(this, limit: 1);

  _TransactionIsarCollectionQueryUpdate get updateAll =>
      _TransactionIsarCollectionQueryBuilderUpdateImpl(this);
}

const _transactionIsarCollectionType = {
  0: TransactionType.expense,
  1: TransactionType.income,
  2: TransactionType.transferIn,
  3: TransactionType.transferOut,
};

extension TransactionIsarCollectionQueryFilter on QueryBuilder<
    TransactionIsarCollection, TransactionIsarCollection, QFilterCondition> {
  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterFilterCondition> transactionJsonEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterFilterCondition> transactionJsonGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterFilterCondition> transactionJsonGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterFilterCondition> transactionJsonLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterFilterCondition> transactionJsonLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterFilterCondition> transactionJsonBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 1,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterFilterCondition> transactionJsonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterFilterCondition> transactionJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
          QAfterFilterCondition>
      transactionJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
          QAfterFilterCondition>
      transactionJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 1,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterFilterCondition> transactionJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterFilterCondition> transactionJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterFilterCondition> transactionDateEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterFilterCondition> transactionDateGreaterThan(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterFilterCondition> transactionDateGreaterThanOrEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterFilterCondition> transactionDateLessThan(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterFilterCondition> transactionDateLessThanOrEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterFilterCondition> transactionDateBetween(
    DateTime lower,
    DateTime upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 2,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterFilterCondition> taskIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterFilterCondition> taskIdGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterFilterCondition> taskIdGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterFilterCondition> taskIdLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterFilterCondition> taskIdLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterFilterCondition> taskIdBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 3,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterFilterCondition> taskIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterFilterCondition> taskIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
          QAfterFilterCondition>
      taskIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
          QAfterFilterCondition>
      taskIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 3,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterFilterCondition> taskIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterFilterCondition> taskIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterFilterCondition> typeEqualTo(
    TransactionType value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 4,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterFilterCondition> typeGreaterThan(
    TransactionType value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 4,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterFilterCondition> typeGreaterThanOrEqualTo(
    TransactionType value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 4,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterFilterCondition> typeLessThan(
    TransactionType value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 4,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterFilterCondition> typeLessThanOrEqualTo(
    TransactionType value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 4,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterFilterCondition> typeBetween(
    TransactionType lower,
    TransactionType upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 4,
          lower: lower.index,
          upper: upper.index,
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterFilterCondition> idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterFilterCondition> idGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterFilterCondition> idGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterFilterCondition> idLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterFilterCondition> idLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterFilterCondition> idBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 5,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterFilterCondition> idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
          QAfterFilterCondition>
      idContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
          QAfterFilterCondition>
      idMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 5,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 5,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterFilterCondition> idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 5,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterFilterCondition> isarIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterFilterCondition> isarIdGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterFilterCondition> isarIdGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterFilterCondition> isarIdLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterFilterCondition> isarIdLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterFilterCondition> isarIdBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 6,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterFilterCondition> isarIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterFilterCondition> isarIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
          QAfterFilterCondition>
      isarIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
          QAfterFilterCondition>
      isarIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 6,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterFilterCondition> isarIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 6,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterFilterCondition> isarIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 6,
          value: '',
        ),
      );
    });
  }
}

extension TransactionIsarCollectionQueryObject on QueryBuilder<
    TransactionIsarCollection, TransactionIsarCollection, QFilterCondition> {}

extension TransactionIsarCollectionQuerySortBy on QueryBuilder<
    TransactionIsarCollection, TransactionIsarCollection, QSortBy> {
  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterSortBy> sortByTransactionJson({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterSortBy> sortByTransactionJsonDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterSortBy> sortByTransactionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterSortBy> sortByTransactionDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterSortBy> sortByTaskId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        3,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterSortBy> sortByTaskIdDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        3,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4);
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, sort: Sort.desc);
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterSortBy> sortById({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        5,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterSortBy> sortByIdDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        5,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterSortBy> sortByIsarId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        6,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterSortBy> sortByIsarIdDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        6,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }
}

extension TransactionIsarCollectionQuerySortThenBy on QueryBuilder<
    TransactionIsarCollection, TransactionIsarCollection, QSortThenBy> {
  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterSortBy> thenByTransactionJson({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterSortBy> thenByTransactionJsonDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterSortBy> thenByTransactionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterSortBy> thenByTransactionDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterSortBy> thenByTaskId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterSortBy> thenByTaskIdDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4);
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, sort: Sort.desc);
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterSortBy> thenById({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterSortBy> thenByIdDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterSortBy> thenByIsarId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterSortBy> thenByIsarIdDesc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }
}

extension TransactionIsarCollectionQueryWhereDistinct on QueryBuilder<
    TransactionIsarCollection, TransactionIsarCollection, QDistinct> {
  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterDistinct> distinctByTransactionJson({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterDistinct> distinctByTransactionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2);
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterDistinct> distinctByTaskId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(3, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterDistinct> distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(4);
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionIsarCollection,
      QAfterDistinct> distinctById({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(5, caseSensitive: caseSensitive);
    });
  }
}

extension TransactionIsarCollectionQueryProperty1 on QueryBuilder<
    TransactionIsarCollection, TransactionIsarCollection, QProperty> {
  QueryBuilder<TransactionIsarCollection, String, QAfterProperty>
      transactionJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<TransactionIsarCollection, DateTime, QAfterProperty>
      transactionDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<TransactionIsarCollection, String, QAfterProperty>
      taskIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<TransactionIsarCollection, TransactionType, QAfterProperty>
      typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<TransactionIsarCollection, String, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<TransactionIsarCollection, String, QAfterProperty>
      isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }
}

extension TransactionIsarCollectionQueryProperty2<R>
    on QueryBuilder<TransactionIsarCollection, R, QAfterProperty> {
  QueryBuilder<TransactionIsarCollection, (R, String), QAfterProperty>
      transactionJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<TransactionIsarCollection, (R, DateTime), QAfterProperty>
      transactionDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<TransactionIsarCollection, (R, String), QAfterProperty>
      taskIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<TransactionIsarCollection, (R, TransactionType), QAfterProperty>
      typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<TransactionIsarCollection, (R, String), QAfterProperty>
      idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<TransactionIsarCollection, (R, String), QAfterProperty>
      isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }
}

extension TransactionIsarCollectionQueryProperty3<R1, R2>
    on QueryBuilder<TransactionIsarCollection, (R1, R2), QAfterProperty> {
  QueryBuilder<TransactionIsarCollection, (R1, R2, String), QOperations>
      transactionJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<TransactionIsarCollection, (R1, R2, DateTime), QOperations>
      transactionDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<TransactionIsarCollection, (R1, R2, String), QOperations>
      taskIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<TransactionIsarCollection, (R1, R2, TransactionType),
      QOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<TransactionIsarCollection, (R1, R2, String), QOperations>
      idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<TransactionIsarCollection, (R1, R2, String), QOperations>
      isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }
}
