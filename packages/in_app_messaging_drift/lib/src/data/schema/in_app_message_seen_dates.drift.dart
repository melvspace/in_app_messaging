// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:in_app_messaging_drift/src/data/schema/in_app_message_seen_dates.drift.dart'
    as i1;
import 'package:in_app_messaging_drift/src/data/schema/in_app_message_seen_dates.dart'
    as i2;

class $InAppMessageSeenDatesTable extends i2.InAppMessageSeenDates
    with i0.TableInfo<$InAppMessageSeenDatesTable, i1.InAppMessageSeenDate> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InAppMessageSeenDatesTable(this.attachedDatabase, [this._alias]);
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
      type: i0.DriftSqlType.string, requiredDuringInsert: true);
  static const i0.VerificationMeta _seenMeta =
      const i0.VerificationMeta('seen');
  @override
  late final i0.GeneratedColumn<DateTime> seen = i0.GeneratedColumn<DateTime>(
      'seen', aliasedName, false,
      type: i0.DriftSqlType.dateTime, requiredDuringInsert: true);
  static const i0.VerificationMeta _triggerMeta =
      const i0.VerificationMeta('trigger');
  @override
  late final i0.GeneratedColumn<String> trigger = i0.GeneratedColumn<String>(
      'trigger', aliasedName, true,
      type: i0.DriftSqlType.string, requiredDuringInsert: false);
  static const i0.VerificationMeta _triggerPropertiesMeta =
      const i0.VerificationMeta('triggerProperties');
  @override
  late final i0.GeneratedColumn<String> triggerProperties =
      i0.GeneratedColumn<String>('trigger_properties', aliasedName, true,
          type: i0.DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<i0.GeneratedColumn> get $columns =>
      [id, message, seen, trigger, triggerProperties];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'in_app_message_seen_dates';
  @override
  i0.VerificationContext validateIntegrity(
      i0.Insertable<i1.InAppMessageSeenDate> instance,
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
    if (data.containsKey('seen')) {
      context.handle(
          _seenMeta, seen.isAcceptableOrUnknown(data['seen']!, _seenMeta));
    } else if (isInserting) {
      context.missing(_seenMeta);
    }
    if (data.containsKey('trigger')) {
      context.handle(_triggerMeta,
          trigger.isAcceptableOrUnknown(data['trigger']!, _triggerMeta));
    }
    if (data.containsKey('trigger_properties')) {
      context.handle(
          _triggerPropertiesMeta,
          triggerProperties.isAcceptableOrUnknown(
              data['trigger_properties']!, _triggerPropertiesMeta));
    }
    return context;
  }

  @override
  Set<i0.GeneratedColumn> get $primaryKey => {id};
  @override
  i1.InAppMessageSeenDate map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.InAppMessageSeenDate(
      id: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}id'])!,
      message: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}message'])!,
      seen: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.dateTime, data['${effectivePrefix}seen'])!,
      trigger: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}trigger']),
      triggerProperties: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string, data['${effectivePrefix}trigger_properties']),
    );
  }

  @override
  $InAppMessageSeenDatesTable createAlias(String alias) {
    return $InAppMessageSeenDatesTable(attachedDatabase, alias);
  }
}

class InAppMessageSeenDate extends i0.DataClass
    implements i0.Insertable<i1.InAppMessageSeenDate> {
  final int id;
  final String message;
  final DateTime seen;

  /// seen for trigger
  final String? trigger;
  final String? triggerProperties;
  const InAppMessageSeenDate(
      {required this.id,
      required this.message,
      required this.seen,
      this.trigger,
      this.triggerProperties});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['id'] = i0.Variable<int>(id);
    map['message'] = i0.Variable<String>(message);
    map['seen'] = i0.Variable<DateTime>(seen);
    if (!nullToAbsent || trigger != null) {
      map['trigger'] = i0.Variable<String>(trigger);
    }
    if (!nullToAbsent || triggerProperties != null) {
      map['trigger_properties'] = i0.Variable<String>(triggerProperties);
    }
    return map;
  }

  factory InAppMessageSeenDate.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return InAppMessageSeenDate(
      id: serializer.fromJson<int>(json['id']),
      message: serializer.fromJson<String>(json['message']),
      seen: serializer.fromJson<DateTime>(json['seen']),
      trigger: serializer.fromJson<String?>(json['trigger']),
      triggerProperties:
          serializer.fromJson<String?>(json['triggerProperties']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'message': serializer.toJson<String>(message),
      'seen': serializer.toJson<DateTime>(seen),
      'trigger': serializer.toJson<String?>(trigger),
      'triggerProperties': serializer.toJson<String?>(triggerProperties),
    };
  }

  i1.InAppMessageSeenDate copyWith(
          {int? id,
          String? message,
          DateTime? seen,
          i0.Value<String?> trigger = const i0.Value.absent(),
          i0.Value<String?> triggerProperties = const i0.Value.absent()}) =>
      i1.InAppMessageSeenDate(
        id: id ?? this.id,
        message: message ?? this.message,
        seen: seen ?? this.seen,
        trigger: trigger.present ? trigger.value : this.trigger,
        triggerProperties: triggerProperties.present
            ? triggerProperties.value
            : this.triggerProperties,
      );
  InAppMessageSeenDate copyWithCompanion(
      i1.InAppMessageSeenDatesCompanion data) {
    return InAppMessageSeenDate(
      id: data.id.present ? data.id.value : this.id,
      message: data.message.present ? data.message.value : this.message,
      seen: data.seen.present ? data.seen.value : this.seen,
      trigger: data.trigger.present ? data.trigger.value : this.trigger,
      triggerProperties: data.triggerProperties.present
          ? data.triggerProperties.value
          : this.triggerProperties,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InAppMessageSeenDate(')
          ..write('id: $id, ')
          ..write('message: $message, ')
          ..write('seen: $seen, ')
          ..write('trigger: $trigger, ')
          ..write('triggerProperties: $triggerProperties')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, message, seen, trigger, triggerProperties);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.InAppMessageSeenDate &&
          other.id == this.id &&
          other.message == this.message &&
          other.seen == this.seen &&
          other.trigger == this.trigger &&
          other.triggerProperties == this.triggerProperties);
}

class InAppMessageSeenDatesCompanion
    extends i0.UpdateCompanion<i1.InAppMessageSeenDate> {
  final i0.Value<int> id;
  final i0.Value<String> message;
  final i0.Value<DateTime> seen;
  final i0.Value<String?> trigger;
  final i0.Value<String?> triggerProperties;
  const InAppMessageSeenDatesCompanion({
    this.id = const i0.Value.absent(),
    this.message = const i0.Value.absent(),
    this.seen = const i0.Value.absent(),
    this.trigger = const i0.Value.absent(),
    this.triggerProperties = const i0.Value.absent(),
  });
  InAppMessageSeenDatesCompanion.insert({
    this.id = const i0.Value.absent(),
    required String message,
    required DateTime seen,
    this.trigger = const i0.Value.absent(),
    this.triggerProperties = const i0.Value.absent(),
  })  : message = i0.Value(message),
        seen = i0.Value(seen);
  static i0.Insertable<i1.InAppMessageSeenDate> custom({
    i0.Expression<int>? id,
    i0.Expression<String>? message,
    i0.Expression<DateTime>? seen,
    i0.Expression<String>? trigger,
    i0.Expression<String>? triggerProperties,
  }) {
    return i0.RawValuesInsertable({
      if (id != null) 'id': id,
      if (message != null) 'message': message,
      if (seen != null) 'seen': seen,
      if (trigger != null) 'trigger': trigger,
      if (triggerProperties != null) 'trigger_properties': triggerProperties,
    });
  }

  i1.InAppMessageSeenDatesCompanion copyWith(
      {i0.Value<int>? id,
      i0.Value<String>? message,
      i0.Value<DateTime>? seen,
      i0.Value<String?>? trigger,
      i0.Value<String?>? triggerProperties}) {
    return i1.InAppMessageSeenDatesCompanion(
      id: id ?? this.id,
      message: message ?? this.message,
      seen: seen ?? this.seen,
      trigger: trigger ?? this.trigger,
      triggerProperties: triggerProperties ?? this.triggerProperties,
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
    if (seen.present) {
      map['seen'] = i0.Variable<DateTime>(seen.value);
    }
    if (trigger.present) {
      map['trigger'] = i0.Variable<String>(trigger.value);
    }
    if (triggerProperties.present) {
      map['trigger_properties'] = i0.Variable<String>(triggerProperties.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InAppMessageSeenDatesCompanion(')
          ..write('id: $id, ')
          ..write('message: $message, ')
          ..write('seen: $seen, ')
          ..write('trigger: $trigger, ')
          ..write('triggerProperties: $triggerProperties')
          ..write(')'))
        .toString();
  }
}

typedef $$InAppMessageSeenDatesTableCreateCompanionBuilder
    = i1.InAppMessageSeenDatesCompanion Function({
  i0.Value<int> id,
  required String message,
  required DateTime seen,
  i0.Value<String?> trigger,
  i0.Value<String?> triggerProperties,
});
typedef $$InAppMessageSeenDatesTableUpdateCompanionBuilder
    = i1.InAppMessageSeenDatesCompanion Function({
  i0.Value<int> id,
  i0.Value<String> message,
  i0.Value<DateTime> seen,
  i0.Value<String?> trigger,
  i0.Value<String?> triggerProperties,
});

class $$InAppMessageSeenDatesTableTableManager extends i0.RootTableManager<
    i0.GeneratedDatabase,
    i1.$InAppMessageSeenDatesTable,
    i1.InAppMessageSeenDate,
    i1.$$InAppMessageSeenDatesTableFilterComposer,
    i1.$$InAppMessageSeenDatesTableOrderingComposer,
    $$InAppMessageSeenDatesTableCreateCompanionBuilder,
    $$InAppMessageSeenDatesTableUpdateCompanionBuilder> {
  $$InAppMessageSeenDatesTableTableManager(
      i0.GeneratedDatabase db, i1.$InAppMessageSeenDatesTable table)
      : super(i0.TableManagerState(
          db: db,
          table: table,
          filteringComposer: i1.$$InAppMessageSeenDatesTableFilterComposer(
              i0.ComposerState(db, table)),
          orderingComposer: i1.$$InAppMessageSeenDatesTableOrderingComposer(
              i0.ComposerState(db, table)),
          updateCompanionCallback: ({
            i0.Value<int> id = const i0.Value.absent(),
            i0.Value<String> message = const i0.Value.absent(),
            i0.Value<DateTime> seen = const i0.Value.absent(),
            i0.Value<String?> trigger = const i0.Value.absent(),
            i0.Value<String?> triggerProperties = const i0.Value.absent(),
          }) =>
              i1.InAppMessageSeenDatesCompanion(
            id: id,
            message: message,
            seen: seen,
            trigger: trigger,
            triggerProperties: triggerProperties,
          ),
          createCompanionCallback: ({
            i0.Value<int> id = const i0.Value.absent(),
            required String message,
            required DateTime seen,
            i0.Value<String?> trigger = const i0.Value.absent(),
            i0.Value<String?> triggerProperties = const i0.Value.absent(),
          }) =>
              i1.InAppMessageSeenDatesCompanion.insert(
            id: id,
            message: message,
            seen: seen,
            trigger: trigger,
            triggerProperties: triggerProperties,
          ),
        ));
}

class $$InAppMessageSeenDatesTableFilterComposer extends i0
    .FilterComposer<i0.GeneratedDatabase, i1.$InAppMessageSeenDatesTable> {
  $$InAppMessageSeenDatesTableFilterComposer(super.$state);
  i0.ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          i0.ColumnFilters(column, joinBuilders: joinBuilders));

  i0.ColumnFilters<String> get message => $state.composableBuilder(
      column: $state.table.message,
      builder: (column, joinBuilders) =>
          i0.ColumnFilters(column, joinBuilders: joinBuilders));

  i0.ColumnFilters<DateTime> get seen => $state.composableBuilder(
      column: $state.table.seen,
      builder: (column, joinBuilders) =>
          i0.ColumnFilters(column, joinBuilders: joinBuilders));

  i0.ColumnFilters<String> get trigger => $state.composableBuilder(
      column: $state.table.trigger,
      builder: (column, joinBuilders) =>
          i0.ColumnFilters(column, joinBuilders: joinBuilders));

  i0.ColumnFilters<String> get triggerProperties => $state.composableBuilder(
      column: $state.table.triggerProperties,
      builder: (column, joinBuilders) =>
          i0.ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$InAppMessageSeenDatesTableOrderingComposer extends i0
    .OrderingComposer<i0.GeneratedDatabase, i1.$InAppMessageSeenDatesTable> {
  $$InAppMessageSeenDatesTableOrderingComposer(super.$state);
  i0.ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          i0.ColumnOrderings(column, joinBuilders: joinBuilders));

  i0.ColumnOrderings<String> get message => $state.composableBuilder(
      column: $state.table.message,
      builder: (column, joinBuilders) =>
          i0.ColumnOrderings(column, joinBuilders: joinBuilders));

  i0.ColumnOrderings<DateTime> get seen => $state.composableBuilder(
      column: $state.table.seen,
      builder: (column, joinBuilders) =>
          i0.ColumnOrderings(column, joinBuilders: joinBuilders));

  i0.ColumnOrderings<String> get trigger => $state.composableBuilder(
      column: $state.table.trigger,
      builder: (column, joinBuilders) =>
          i0.ColumnOrderings(column, joinBuilders: joinBuilders));

  i0.ColumnOrderings<String> get triggerProperties => $state.composableBuilder(
      column: $state.table.triggerProperties,
      builder: (column, joinBuilders) =>
          i0.ColumnOrderings(column, joinBuilders: joinBuilders));
}
