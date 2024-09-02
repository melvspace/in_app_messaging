// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:in_app_messaging_drift/src/data/schema/in_app_message_interactions.drift.dart'
    as i1;
import 'package:in_app_messaging_drift/src/data/schema/in_app_message_interactions.dart'
    as i2;
import 'package:in_app_messaging_drift/src/data/converters/converters.dart'
    as i3;

class $InAppMessageInteractionsTable extends i2.InAppMessageInteractions
    with
        i0
        .TableInfo<$InAppMessageInteractionsTable, i1.InAppMessageInteraction> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InAppMessageInteractionsTable(this.attachedDatabase, [this._alias]);
  static const i0.VerificationMeta _idMeta = const i0.VerificationMeta('id');
  @override
  late final i0.GeneratedColumn<int> id = i0.GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          i0.GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const i0.VerificationMeta _messageMeta =
      const i0.VerificationMeta('message');
  @override
  late final i0.GeneratedColumn<String> message = i0.GeneratedColumn<String>(
      'message', aliasedName, false,
      type: i0.DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: i0.GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const i0.VerificationMeta _interactionsMeta =
      const i0.VerificationMeta('interactions');
  @override
  late final i0.GeneratedColumnWithTypeConverter<Map<String, dynamic>, String>
      interactions = i0.GeneratedColumn<String>(
              'interactions', aliasedName, false,
              type: i0.DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Map<String, dynamic>>(
              i1.$InAppMessageInteractionsTable.$converterinteractions);
  @override
  List<i0.GeneratedColumn> get $columns => [id, message, interactions];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'in_app_message_interactions';
  @override
  i0.VerificationContext validateIntegrity(
      i0.Insertable<i1.InAppMessageInteraction> instance,
      {bool isInserting = false}) {
    final context = i0.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('message')) {
      context.handle(_messageMeta,
          message.isAcceptableOrUnknown(data['message']!, _messageMeta));
    } else if (isInserting) {
      context.missing(_messageMeta);
    }
    context.handle(_interactionsMeta, const i0.VerificationResult.success());
    return context;
  }

  @override
  Set<i0.GeneratedColumn> get $primaryKey => {id};
  @override
  i1.InAppMessageInteraction map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.InAppMessageInteraction(
      id: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}id'])!,
      message: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}message'])!,
      interactions: i1.$InAppMessageInteractionsTable.$converterinteractions
          .fromSql(attachedDatabase.typeMapping.read(
              i0.DriftSqlType.string, data['${effectivePrefix}interactions'])!),
    );
  }

  @override
  $InAppMessageInteractionsTable createAlias(String alias) {
    return $InAppMessageInteractionsTable(attachedDatabase, alias);
  }

  static i0.TypeConverter<Map<String, dynamic>, String> $converterinteractions =
      i3.DBC.json;
}

class InAppMessageInteraction extends i0.DataClass
    implements i0.Insertable<i1.InAppMessageInteraction> {
  final int id;
  final String message;
  final Map<String, dynamic> interactions;
  const InAppMessageInteraction(
      {required this.id, required this.message, required this.interactions});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['id'] = i0.Variable<int>(id);
    map['message'] = i0.Variable<String>(message);
    {
      map['interactions'] = i0.Variable<String>(i1
          .$InAppMessageInteractionsTable.$converterinteractions
          .toSql(interactions));
    }
    return map;
  }

  factory InAppMessageInteraction.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return InAppMessageInteraction(
      id: serializer.fromJson<int>(json['id']),
      message: serializer.fromJson<String>(json['message']),
      interactions:
          serializer.fromJson<Map<String, dynamic>>(json['interactions']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'message': serializer.toJson<String>(message),
      'interactions': serializer.toJson<Map<String, dynamic>>(interactions),
    };
  }

  i1.InAppMessageInteraction copyWith(
          {int? id, String? message, Map<String, dynamic>? interactions}) =>
      i1.InAppMessageInteraction(
        id: id ?? this.id,
        message: message ?? this.message,
        interactions: interactions ?? this.interactions,
      );
  @override
  String toString() {
    return (StringBuffer('InAppMessageInteraction(')
          ..write('id: $id, ')
          ..write('message: $message, ')
          ..write('interactions: $interactions')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, message, interactions);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.InAppMessageInteraction &&
          other.id == this.id &&
          other.message == this.message &&
          other.interactions == this.interactions);
}

class InAppMessageInteractionsCompanion
    extends i0.UpdateCompanion<i1.InAppMessageInteraction> {
  final i0.Value<int> id;
  final i0.Value<String> message;
  final i0.Value<Map<String, dynamic>> interactions;
  const InAppMessageInteractionsCompanion({
    this.id = const i0.Value.absent(),
    this.message = const i0.Value.absent(),
    this.interactions = const i0.Value.absent(),
  });
  InAppMessageInteractionsCompanion.insert({
    this.id = const i0.Value.absent(),
    required String message,
    required Map<String, dynamic> interactions,
  })  : message = i0.Value(message),
        interactions = i0.Value(interactions);
  static i0.Insertable<i1.InAppMessageInteraction> custom({
    i0.Expression<int>? id,
    i0.Expression<String>? message,
    i0.Expression<String>? interactions,
  }) {
    return i0.RawValuesInsertable({
      if (id != null) 'id': id,
      if (message != null) 'message': message,
      if (interactions != null) 'interactions': interactions,
    });
  }

  i1.InAppMessageInteractionsCompanion copyWith(
      {i0.Value<int>? id,
      i0.Value<String>? message,
      i0.Value<Map<String, dynamic>>? interactions}) {
    return i1.InAppMessageInteractionsCompanion(
      id: id ?? this.id,
      message: message ?? this.message,
      interactions: interactions ?? this.interactions,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (id.present) {
      map['id'] = i0.Variable<int>(id.value);
    }
    if (message.present) {
      map['message'] = i0.Variable<String>(message.value);
    }
    if (interactions.present) {
      map['interactions'] = i0.Variable<String>(i1
          .$InAppMessageInteractionsTable.$converterinteractions
          .toSql(interactions.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InAppMessageInteractionsCompanion(')
          ..write('id: $id, ')
          ..write('message: $message, ')
          ..write('interactions: $interactions')
          ..write(')'))
        .toString();
  }
}

typedef $$InAppMessageInteractionsTableInsertCompanionBuilder
    = i1.InAppMessageInteractionsCompanion Function({
  i0.Value<int> id,
  required String message,
  required Map<String, dynamic> interactions,
});
typedef $$InAppMessageInteractionsTableUpdateCompanionBuilder
    = i1.InAppMessageInteractionsCompanion Function({
  i0.Value<int> id,
  i0.Value<String> message,
  i0.Value<Map<String, dynamic>> interactions,
});

class $$InAppMessageInteractionsTableTableManager extends i0.RootTableManager<
    i0.GeneratedDatabase,
    i1.$InAppMessageInteractionsTable,
    i1.InAppMessageInteraction,
    i1.$$InAppMessageInteractionsTableFilterComposer,
    i1.$$InAppMessageInteractionsTableOrderingComposer,
    $$InAppMessageInteractionsTableProcessedTableManager,
    $$InAppMessageInteractionsTableInsertCompanionBuilder,
    $$InAppMessageInteractionsTableUpdateCompanionBuilder> {
  $$InAppMessageInteractionsTableTableManager(
      i0.GeneratedDatabase db, i1.$InAppMessageInteractionsTable table)
      : super(i0.TableManagerState(
          db: db,
          table: table,
          filteringComposer: i1.$$InAppMessageInteractionsTableFilterComposer(
              i0.ComposerState(db, table)),
          orderingComposer: i1.$$InAppMessageInteractionsTableOrderingComposer(
              i0.ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$InAppMessageInteractionsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            i0.Value<int> id = const i0.Value.absent(),
            i0.Value<String> message = const i0.Value.absent(),
            i0.Value<Map<String, dynamic>> interactions =
                const i0.Value.absent(),
          }) =>
              i1.InAppMessageInteractionsCompanion(
            id: id,
            message: message,
            interactions: interactions,
          ),
          getInsertCompanionBuilder: ({
            i0.Value<int> id = const i0.Value.absent(),
            required String message,
            required Map<String, dynamic> interactions,
          }) =>
              i1.InAppMessageInteractionsCompanion.insert(
            id: id,
            message: message,
            interactions: interactions,
          ),
        ));
}

class $$InAppMessageInteractionsTableProcessedTableManager
    extends i0.ProcessedTableManager<
        i0.GeneratedDatabase,
        i1.$InAppMessageInteractionsTable,
        i1.InAppMessageInteraction,
        i1.$$InAppMessageInteractionsTableFilterComposer,
        i1.$$InAppMessageInteractionsTableOrderingComposer,
        $$InAppMessageInteractionsTableProcessedTableManager,
        $$InAppMessageInteractionsTableInsertCompanionBuilder,
        $$InAppMessageInteractionsTableUpdateCompanionBuilder> {
  $$InAppMessageInteractionsTableProcessedTableManager(super.$state);
}

class $$InAppMessageInteractionsTableFilterComposer extends i0
    .FilterComposer<i0.GeneratedDatabase, i1.$InAppMessageInteractionsTable> {
  $$InAppMessageInteractionsTableFilterComposer(super.$state);
  i0.ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          i0.ColumnFilters(column, joinBuilders: joinBuilders));

  i0.ColumnFilters<String> get message => $state.composableBuilder(
      column: $state.table.message,
      builder: (column, joinBuilders) =>
          i0.ColumnFilters(column, joinBuilders: joinBuilders));

  i0.ColumnWithTypeConverterFilters<Map<String, dynamic>, Map<String, dynamic>,
          String>
      get interactions => $state.composableBuilder(
          column: $state.table.interactions,
          builder: (column, joinBuilders) => i0.ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));
}

class $$InAppMessageInteractionsTableOrderingComposer extends i0
    .OrderingComposer<i0.GeneratedDatabase, i1.$InAppMessageInteractionsTable> {
  $$InAppMessageInteractionsTableOrderingComposer(super.$state);
  i0.ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          i0.ColumnOrderings(column, joinBuilders: joinBuilders));

  i0.ColumnOrderings<String> get message => $state.composableBuilder(
      column: $state.table.message,
      builder: (column, joinBuilders) =>
          i0.ColumnOrderings(column, joinBuilders: joinBuilders));

  i0.ColumnOrderings<String> get interactions => $state.composableBuilder(
      column: $state.table.interactions,
      builder: (column, joinBuilders) =>
          i0.ColumnOrderings(column, joinBuilders: joinBuilders));
}
