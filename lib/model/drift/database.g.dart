// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CoursesTable extends Courses with TableInfo<$CoursesTable, Course> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CoursesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumn<String> level = GeneratedColumn<String>(
      'level', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _languageMeta =
      const VerificationMeta('language');
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
      'language', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, level, language];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'courses';
  @override
  VerificationContext validateIntegrity(Insertable<Course> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('level')) {
      context.handle(
          _levelMeta, level.isAcceptableOrUnknown(data['level']!, _levelMeta));
    } else if (isInserting) {
      context.missing(_levelMeta);
    }
    if (data.containsKey('language')) {
      context.handle(_languageMeta,
          language.isAcceptableOrUnknown(data['language']!, _languageMeta));
    } else if (isInserting) {
      context.missing(_languageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Course map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Course(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      level: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}level'])!,
      language: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}language'])!,
    );
  }

  @override
  $CoursesTable createAlias(String alias) {
    return $CoursesTable(attachedDatabase, alias);
  }
}

class Course extends DataClass implements Insertable<Course> {
  final int id;
  final String name;
  final String level;
  final String language;
  const Course(
      {required this.id,
      required this.name,
      required this.level,
      required this.language});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['level'] = Variable<String>(level);
    map['language'] = Variable<String>(language);
    return map;
  }

  CoursesCompanion toCompanion(bool nullToAbsent) {
    return CoursesCompanion(
      id: Value(id),
      name: Value(name),
      level: Value(level),
      language: Value(language),
    );
  }

  factory Course.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Course(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      level: serializer.fromJson<String>(json['level']),
      language: serializer.fromJson<String>(json['language']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'level': serializer.toJson<String>(level),
      'language': serializer.toJson<String>(language),
    };
  }

  Course copyWith({int? id, String? name, String? level, String? language}) =>
      Course(
        id: id ?? this.id,
        name: name ?? this.name,
        level: level ?? this.level,
        language: language ?? this.language,
      );
  Course copyWithCompanion(CoursesCompanion data) {
    return Course(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      level: data.level.present ? data.level.value : this.level,
      language: data.language.present ? data.language.value : this.language,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Course(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('level: $level, ')
          ..write('language: $language')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, level, language);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Course &&
          other.id == this.id &&
          other.name == this.name &&
          other.level == this.level &&
          other.language == this.language);
}

class CoursesCompanion extends UpdateCompanion<Course> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> level;
  final Value<String> language;
  const CoursesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.level = const Value.absent(),
    this.language = const Value.absent(),
  });
  CoursesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String level,
    required String language,
  })  : name = Value(name),
        level = Value(level),
        language = Value(language);
  static Insertable<Course> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? level,
    Expression<String>? language,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (level != null) 'level': level,
      if (language != null) 'language': language,
    });
  }

  CoursesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? level,
      Value<String>? language}) {
    return CoursesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      level: level ?? this.level,
      language: language ?? this.language,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (level.present) {
      map['level'] = Variable<String>(level.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CoursesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('level: $level, ')
          ..write('language: $language')
          ..write(')'))
        .toString();
  }
}

class $SectionsTable extends Sections with TableInfo<$SectionsTable, Section> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SectionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<int> number = GeneratedColumn<int>(
      'number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, number];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sections';
  @override
  VerificationContext validateIntegrity(Insertable<Section> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('number')) {
      context.handle(_numberMeta,
          number.isAcceptableOrUnknown(data['number']!, _numberMeta));
    } else if (isInserting) {
      context.missing(_numberMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Section map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Section(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      number: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}number'])!,
    );
  }

  @override
  $SectionsTable createAlias(String alias) {
    return $SectionsTable(attachedDatabase, alias);
  }
}

class Section extends DataClass implements Insertable<Section> {
  final int id;
  final String name;
  final int number;
  const Section({required this.id, required this.name, required this.number});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['number'] = Variable<int>(number);
    return map;
  }

  SectionsCompanion toCompanion(bool nullToAbsent) {
    return SectionsCompanion(
      id: Value(id),
      name: Value(name),
      number: Value(number),
    );
  }

  factory Section.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Section(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      number: serializer.fromJson<int>(json['number']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'number': serializer.toJson<int>(number),
    };
  }

  Section copyWith({int? id, String? name, int? number}) => Section(
        id: id ?? this.id,
        name: name ?? this.name,
        number: number ?? this.number,
      );
  Section copyWithCompanion(SectionsCompanion data) {
    return Section(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      number: data.number.present ? data.number.value : this.number,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Section(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('number: $number')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, number);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Section &&
          other.id == this.id &&
          other.name == this.name &&
          other.number == this.number);
}

class SectionsCompanion extends UpdateCompanion<Section> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> number;
  const SectionsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.number = const Value.absent(),
  });
  SectionsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int number,
  })  : name = Value(name),
        number = Value(number);
  static Insertable<Section> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? number,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (number != null) 'number': number,
    });
  }

  SectionsCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<int>? number}) {
    return SectionsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      number: number ?? this.number,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (number.present) {
      map['number'] = Variable<int>(number.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SectionsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('number: $number')
          ..write(')'))
        .toString();
  }
}

class $WordTypesTable extends WordTypes
    with TableInfo<$WordTypesTable, WordType> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WordTypesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'word_types';
  @override
  VerificationContext validateIntegrity(Insertable<WordType> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WordType map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WordType(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $WordTypesTable createAlias(String alias) {
    return $WordTypesTable(attachedDatabase, alias);
  }
}

class WordType extends DataClass implements Insertable<WordType> {
  final int id;
  final String name;
  const WordType({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  WordTypesCompanion toCompanion(bool nullToAbsent) {
    return WordTypesCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory WordType.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WordType(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  WordType copyWith({int? id, String? name}) => WordType(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  WordType copyWithCompanion(WordTypesCompanion data) {
    return WordType(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WordType(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WordType && other.id == this.id && other.name == this.name);
}

class WordTypesCompanion extends UpdateCompanion<WordType> {
  final Value<int> id;
  final Value<String> name;
  const WordTypesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  WordTypesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<WordType> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  WordTypesCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return WordTypesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WordTypesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $TranslationsTable extends Translations
    with TableInfo<$TranslationsTable, Translation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TranslationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _sectionMeta =
      const VerificationMeta('section');
  @override
  late final GeneratedColumn<int> section = GeneratedColumn<int>(
      'section', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES sections (id)'));
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<int> type = GeneratedColumn<int>(
      'type', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES word_types (id)'));
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
      'value', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _specifierMeta =
      const VerificationMeta('specifier');
  @override
  late final GeneratedColumn<String> specifier = GeneratedColumn<String>(
      'specifier', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _lastCorrectMeta =
      const VerificationMeta('lastCorrect');
  @override
  late final GeneratedColumn<DateTime> lastCorrect = GeneratedColumn<DateTime>(
      'last_correct', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _lastWrongMeta =
      const VerificationMeta('lastWrong');
  @override
  late final GeneratedColumn<DateTime> lastWrong = GeneratedColumn<DateTime>(
      'last_wrong', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _correctCountMeta =
      const VerificationMeta('correctCount');
  @override
  late final GeneratedColumn<int> correctCount = GeneratedColumn<int>(
      'correct_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _wrongCountMeta =
      const VerificationMeta('wrongCount');
  @override
  late final GeneratedColumn<int> wrongCount = GeneratedColumn<int>(
      'wrong_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        section,
        type,
        value,
        specifier,
        createdAt,
        lastCorrect,
        lastWrong,
        correctCount,
        wrongCount
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'translations';
  @override
  VerificationContext validateIntegrity(Insertable<Translation> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('section')) {
      context.handle(_sectionMeta,
          section.isAcceptableOrUnknown(data['section']!, _sectionMeta));
    } else if (isInserting) {
      context.missing(_sectionMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('specifier')) {
      context.handle(_specifierMeta,
          specifier.isAcceptableOrUnknown(data['specifier']!, _specifierMeta));
    } else if (isInserting) {
      context.missing(_specifierMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('last_correct')) {
      context.handle(
          _lastCorrectMeta,
          lastCorrect.isAcceptableOrUnknown(
              data['last_correct']!, _lastCorrectMeta));
    }
    if (data.containsKey('last_wrong')) {
      context.handle(_lastWrongMeta,
          lastWrong.isAcceptableOrUnknown(data['last_wrong']!, _lastWrongMeta));
    }
    if (data.containsKey('correct_count')) {
      context.handle(
          _correctCountMeta,
          correctCount.isAcceptableOrUnknown(
              data['correct_count']!, _correctCountMeta));
    }
    if (data.containsKey('wrong_count')) {
      context.handle(
          _wrongCountMeta,
          wrongCount.isAcceptableOrUnknown(
              data['wrong_count']!, _wrongCountMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Translation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Translation(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      section: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}section'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value'])!,
      specifier: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}specifier'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      lastCorrect: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_correct']),
      lastWrong: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_wrong']),
      correctCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}correct_count'])!,
      wrongCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}wrong_count'])!,
    );
  }

  @override
  $TranslationsTable createAlias(String alias) {
    return $TranslationsTable(attachedDatabase, alias);
  }
}

class Translation extends DataClass implements Insertable<Translation> {
  final int id;
  final int section;
  final int type;
  final String value;
  final String specifier;
  final DateTime createdAt;
  final DateTime? lastCorrect;
  final DateTime? lastWrong;
  final int correctCount;
  final int wrongCount;
  const Translation(
      {required this.id,
      required this.section,
      required this.type,
      required this.value,
      required this.specifier,
      required this.createdAt,
      this.lastCorrect,
      this.lastWrong,
      required this.correctCount,
      required this.wrongCount});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['section'] = Variable<int>(section);
    map['type'] = Variable<int>(type);
    map['value'] = Variable<String>(value);
    map['specifier'] = Variable<String>(specifier);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || lastCorrect != null) {
      map['last_correct'] = Variable<DateTime>(lastCorrect);
    }
    if (!nullToAbsent || lastWrong != null) {
      map['last_wrong'] = Variable<DateTime>(lastWrong);
    }
    map['correct_count'] = Variable<int>(correctCount);
    map['wrong_count'] = Variable<int>(wrongCount);
    return map;
  }

  TranslationsCompanion toCompanion(bool nullToAbsent) {
    return TranslationsCompanion(
      id: Value(id),
      section: Value(section),
      type: Value(type),
      value: Value(value),
      specifier: Value(specifier),
      createdAt: Value(createdAt),
      lastCorrect: lastCorrect == null && nullToAbsent
          ? const Value.absent()
          : Value(lastCorrect),
      lastWrong: lastWrong == null && nullToAbsent
          ? const Value.absent()
          : Value(lastWrong),
      correctCount: Value(correctCount),
      wrongCount: Value(wrongCount),
    );
  }

  factory Translation.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Translation(
      id: serializer.fromJson<int>(json['id']),
      section: serializer.fromJson<int>(json['section']),
      type: serializer.fromJson<int>(json['type']),
      value: serializer.fromJson<String>(json['value']),
      specifier: serializer.fromJson<String>(json['specifier']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      lastCorrect: serializer.fromJson<DateTime?>(json['lastCorrect']),
      lastWrong: serializer.fromJson<DateTime?>(json['lastWrong']),
      correctCount: serializer.fromJson<int>(json['correctCount']),
      wrongCount: serializer.fromJson<int>(json['wrongCount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'section': serializer.toJson<int>(section),
      'type': serializer.toJson<int>(type),
      'value': serializer.toJson<String>(value),
      'specifier': serializer.toJson<String>(specifier),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'lastCorrect': serializer.toJson<DateTime?>(lastCorrect),
      'lastWrong': serializer.toJson<DateTime?>(lastWrong),
      'correctCount': serializer.toJson<int>(correctCount),
      'wrongCount': serializer.toJson<int>(wrongCount),
    };
  }

  Translation copyWith(
          {int? id,
          int? section,
          int? type,
          String? value,
          String? specifier,
          DateTime? createdAt,
          Value<DateTime?> lastCorrect = const Value.absent(),
          Value<DateTime?> lastWrong = const Value.absent(),
          int? correctCount,
          int? wrongCount}) =>
      Translation(
        id: id ?? this.id,
        section: section ?? this.section,
        type: type ?? this.type,
        value: value ?? this.value,
        specifier: specifier ?? this.specifier,
        createdAt: createdAt ?? this.createdAt,
        lastCorrect: lastCorrect.present ? lastCorrect.value : this.lastCorrect,
        lastWrong: lastWrong.present ? lastWrong.value : this.lastWrong,
        correctCount: correctCount ?? this.correctCount,
        wrongCount: wrongCount ?? this.wrongCount,
      );
  Translation copyWithCompanion(TranslationsCompanion data) {
    return Translation(
      id: data.id.present ? data.id.value : this.id,
      section: data.section.present ? data.section.value : this.section,
      type: data.type.present ? data.type.value : this.type,
      value: data.value.present ? data.value.value : this.value,
      specifier: data.specifier.present ? data.specifier.value : this.specifier,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      lastCorrect:
          data.lastCorrect.present ? data.lastCorrect.value : this.lastCorrect,
      lastWrong: data.lastWrong.present ? data.lastWrong.value : this.lastWrong,
      correctCount: data.correctCount.present
          ? data.correctCount.value
          : this.correctCount,
      wrongCount:
          data.wrongCount.present ? data.wrongCount.value : this.wrongCount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Translation(')
          ..write('id: $id, ')
          ..write('section: $section, ')
          ..write('type: $type, ')
          ..write('value: $value, ')
          ..write('specifier: $specifier, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastCorrect: $lastCorrect, ')
          ..write('lastWrong: $lastWrong, ')
          ..write('correctCount: $correctCount, ')
          ..write('wrongCount: $wrongCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, section, type, value, specifier,
      createdAt, lastCorrect, lastWrong, correctCount, wrongCount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Translation &&
          other.id == this.id &&
          other.section == this.section &&
          other.type == this.type &&
          other.value == this.value &&
          other.specifier == this.specifier &&
          other.createdAt == this.createdAt &&
          other.lastCorrect == this.lastCorrect &&
          other.lastWrong == this.lastWrong &&
          other.correctCount == this.correctCount &&
          other.wrongCount == this.wrongCount);
}

class TranslationsCompanion extends UpdateCompanion<Translation> {
  final Value<int> id;
  final Value<int> section;
  final Value<int> type;
  final Value<String> value;
  final Value<String> specifier;
  final Value<DateTime> createdAt;
  final Value<DateTime?> lastCorrect;
  final Value<DateTime?> lastWrong;
  final Value<int> correctCount;
  final Value<int> wrongCount;
  const TranslationsCompanion({
    this.id = const Value.absent(),
    this.section = const Value.absent(),
    this.type = const Value.absent(),
    this.value = const Value.absent(),
    this.specifier = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastCorrect = const Value.absent(),
    this.lastWrong = const Value.absent(),
    this.correctCount = const Value.absent(),
    this.wrongCount = const Value.absent(),
  });
  TranslationsCompanion.insert({
    this.id = const Value.absent(),
    required int section,
    required int type,
    required String value,
    required String specifier,
    required DateTime createdAt,
    this.lastCorrect = const Value.absent(),
    this.lastWrong = const Value.absent(),
    this.correctCount = const Value.absent(),
    this.wrongCount = const Value.absent(),
  })  : section = Value(section),
        type = Value(type),
        value = Value(value),
        specifier = Value(specifier),
        createdAt = Value(createdAt);
  static Insertable<Translation> custom({
    Expression<int>? id,
    Expression<int>? section,
    Expression<int>? type,
    Expression<String>? value,
    Expression<String>? specifier,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? lastCorrect,
    Expression<DateTime>? lastWrong,
    Expression<int>? correctCount,
    Expression<int>? wrongCount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (section != null) 'section': section,
      if (type != null) 'type': type,
      if (value != null) 'value': value,
      if (specifier != null) 'specifier': specifier,
      if (createdAt != null) 'created_at': createdAt,
      if (lastCorrect != null) 'last_correct': lastCorrect,
      if (lastWrong != null) 'last_wrong': lastWrong,
      if (correctCount != null) 'correct_count': correctCount,
      if (wrongCount != null) 'wrong_count': wrongCount,
    });
  }

  TranslationsCompanion copyWith(
      {Value<int>? id,
      Value<int>? section,
      Value<int>? type,
      Value<String>? value,
      Value<String>? specifier,
      Value<DateTime>? createdAt,
      Value<DateTime?>? lastCorrect,
      Value<DateTime?>? lastWrong,
      Value<int>? correctCount,
      Value<int>? wrongCount}) {
    return TranslationsCompanion(
      id: id ?? this.id,
      section: section ?? this.section,
      type: type ?? this.type,
      value: value ?? this.value,
      specifier: specifier ?? this.specifier,
      createdAt: createdAt ?? this.createdAt,
      lastCorrect: lastCorrect ?? this.lastCorrect,
      lastWrong: lastWrong ?? this.lastWrong,
      correctCount: correctCount ?? this.correctCount,
      wrongCount: wrongCount ?? this.wrongCount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (section.present) {
      map['section'] = Variable<int>(section.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(type.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (specifier.present) {
      map['specifier'] = Variable<String>(specifier.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (lastCorrect.present) {
      map['last_correct'] = Variable<DateTime>(lastCorrect.value);
    }
    if (lastWrong.present) {
      map['last_wrong'] = Variable<DateTime>(lastWrong.value);
    }
    if (correctCount.present) {
      map['correct_count'] = Variable<int>(correctCount.value);
    }
    if (wrongCount.present) {
      map['wrong_count'] = Variable<int>(wrongCount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TranslationsCompanion(')
          ..write('id: $id, ')
          ..write('section: $section, ')
          ..write('type: $type, ')
          ..write('value: $value, ')
          ..write('specifier: $specifier, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastCorrect: $lastCorrect, ')
          ..write('lastWrong: $lastWrong, ')
          ..write('correctCount: $correctCount, ')
          ..write('wrongCount: $wrongCount')
          ..write(')'))
        .toString();
  }
}

class $WordsTable extends Words with TableInfo<$WordsTable, Word> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _translationMeta =
      const VerificationMeta('translation');
  @override
  late final GeneratedColumn<int> translation = GeneratedColumn<int>(
      'translation', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES translations (id)'));
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
      'value', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, translation, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'words';
  @override
  VerificationContext validateIntegrity(Insertable<Word> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('translation')) {
      context.handle(
          _translationMeta,
          translation.isAcceptableOrUnknown(
              data['translation']!, _translationMeta));
    } else if (isInserting) {
      context.missing(_translationMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Word map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Word(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      translation: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}translation'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value'])!,
    );
  }

  @override
  $WordsTable createAlias(String alias) {
    return $WordsTable(attachedDatabase, alias);
  }
}

class Word extends DataClass implements Insertable<Word> {
  final int id;
  final int translation;
  final String value;
  const Word(
      {required this.id, required this.translation, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['translation'] = Variable<int>(translation);
    map['value'] = Variable<String>(value);
    return map;
  }

  WordsCompanion toCompanion(bool nullToAbsent) {
    return WordsCompanion(
      id: Value(id),
      translation: Value(translation),
      value: Value(value),
    );
  }

  factory Word.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Word(
      id: serializer.fromJson<int>(json['id']),
      translation: serializer.fromJson<int>(json['translation']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'translation': serializer.toJson<int>(translation),
      'value': serializer.toJson<String>(value),
    };
  }

  Word copyWith({int? id, int? translation, String? value}) => Word(
        id: id ?? this.id,
        translation: translation ?? this.translation,
        value: value ?? this.value,
      );
  Word copyWithCompanion(WordsCompanion data) {
    return Word(
      id: data.id.present ? data.id.value : this.id,
      translation:
          data.translation.present ? data.translation.value : this.translation,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Word(')
          ..write('id: $id, ')
          ..write('translation: $translation, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, translation, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Word &&
          other.id == this.id &&
          other.translation == this.translation &&
          other.value == this.value);
}

class WordsCompanion extends UpdateCompanion<Word> {
  final Value<int> id;
  final Value<int> translation;
  final Value<String> value;
  const WordsCompanion({
    this.id = const Value.absent(),
    this.translation = const Value.absent(),
    this.value = const Value.absent(),
  });
  WordsCompanion.insert({
    this.id = const Value.absent(),
    required int translation,
    required String value,
  })  : translation = Value(translation),
        value = Value(value);
  static Insertable<Word> custom({
    Expression<int>? id,
    Expression<int>? translation,
    Expression<String>? value,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (translation != null) 'translation': translation,
      if (value != null) 'value': value,
    });
  }

  WordsCompanion copyWith(
      {Value<int>? id, Value<int>? translation, Value<String>? value}) {
    return WordsCompanion(
      id: id ?? this.id,
      translation: translation ?? this.translation,
      value: value ?? this.value,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (translation.present) {
      map['translation'] = Variable<int>(translation.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WordsCompanion(')
          ..write('id: $id, ')
          ..write('translation: $translation, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }
}

class $PronounsTable extends Pronouns with TableInfo<$PronounsTable, Pronoun> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PronounsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
      'value', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pronouns';
  @override
  VerificationContext validateIntegrity(Insertable<Pronoun> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Pronoun map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Pronoun(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value'])!,
    );
  }

  @override
  $PronounsTable createAlias(String alias) {
    return $PronounsTable(attachedDatabase, alias);
  }
}

class Pronoun extends DataClass implements Insertable<Pronoun> {
  final int id;
  final String value;
  const Pronoun({required this.id, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['value'] = Variable<String>(value);
    return map;
  }

  PronounsCompanion toCompanion(bool nullToAbsent) {
    return PronounsCompanion(
      id: Value(id),
      value: Value(value),
    );
  }

  factory Pronoun.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Pronoun(
      id: serializer.fromJson<int>(json['id']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'value': serializer.toJson<String>(value),
    };
  }

  Pronoun copyWith({int? id, String? value}) => Pronoun(
        id: id ?? this.id,
        value: value ?? this.value,
      );
  Pronoun copyWithCompanion(PronounsCompanion data) {
    return Pronoun(
      id: data.id.present ? data.id.value : this.id,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Pronoun(')
          ..write('id: $id, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Pronoun && other.id == this.id && other.value == this.value);
}

class PronounsCompanion extends UpdateCompanion<Pronoun> {
  final Value<int> id;
  final Value<String> value;
  const PronounsCompanion({
    this.id = const Value.absent(),
    this.value = const Value.absent(),
  });
  PronounsCompanion.insert({
    this.id = const Value.absent(),
    required String value,
  }) : value = Value(value);
  static Insertable<Pronoun> custom({
    Expression<int>? id,
    Expression<String>? value,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (value != null) 'value': value,
    });
  }

  PronounsCompanion copyWith({Value<int>? id, Value<String>? value}) {
    return PronounsCompanion(
      id: id ?? this.id,
      value: value ?? this.value,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PronounsCompanion(')
          ..write('id: $id, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }
}

class $VerbsTable extends Verbs with TableInfo<$VerbsTable, Verb> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VerbsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _translationMeta =
      const VerificationMeta('translation');
  @override
  late final GeneratedColumn<int> translation = GeneratedColumn<int>(
      'translation', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES translations (id)'));
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
      'value', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _positionMeta =
      const VerificationMeta('position');
  @override
  late final GeneratedColumn<int> position = GeneratedColumn<int>(
      'position', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _pronounMeta =
      const VerificationMeta('pronoun');
  @override
  late final GeneratedColumn<int> pronoun = GeneratedColumn<int>(
      'pronoun', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES pronouns (id)'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, translation, value, position, pronoun];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'verbs';
  @override
  VerificationContext validateIntegrity(Insertable<Verb> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('translation')) {
      context.handle(
          _translationMeta,
          translation.isAcceptableOrUnknown(
              data['translation']!, _translationMeta));
    } else if (isInserting) {
      context.missing(_translationMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('position')) {
      context.handle(_positionMeta,
          position.isAcceptableOrUnknown(data['position']!, _positionMeta));
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    if (data.containsKey('pronoun')) {
      context.handle(_pronounMeta,
          pronoun.isAcceptableOrUnknown(data['pronoun']!, _pronounMeta));
    } else if (isInserting) {
      context.missing(_pronounMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Verb map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Verb(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      translation: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}translation'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value'])!,
      position: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}position'])!,
      pronoun: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}pronoun'])!,
    );
  }

  @override
  $VerbsTable createAlias(String alias) {
    return $VerbsTable(attachedDatabase, alias);
  }
}

class Verb extends DataClass implements Insertable<Verb> {
  final int id;
  final int translation;
  final String value;
  final int position;
  final int pronoun;
  const Verb(
      {required this.id,
      required this.translation,
      required this.value,
      required this.position,
      required this.pronoun});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['translation'] = Variable<int>(translation);
    map['value'] = Variable<String>(value);
    map['position'] = Variable<int>(position);
    map['pronoun'] = Variable<int>(pronoun);
    return map;
  }

  VerbsCompanion toCompanion(bool nullToAbsent) {
    return VerbsCompanion(
      id: Value(id),
      translation: Value(translation),
      value: Value(value),
      position: Value(position),
      pronoun: Value(pronoun),
    );
  }

  factory Verb.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Verb(
      id: serializer.fromJson<int>(json['id']),
      translation: serializer.fromJson<int>(json['translation']),
      value: serializer.fromJson<String>(json['value']),
      position: serializer.fromJson<int>(json['position']),
      pronoun: serializer.fromJson<int>(json['pronoun']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'translation': serializer.toJson<int>(translation),
      'value': serializer.toJson<String>(value),
      'position': serializer.toJson<int>(position),
      'pronoun': serializer.toJson<int>(pronoun),
    };
  }

  Verb copyWith(
          {int? id,
          int? translation,
          String? value,
          int? position,
          int? pronoun}) =>
      Verb(
        id: id ?? this.id,
        translation: translation ?? this.translation,
        value: value ?? this.value,
        position: position ?? this.position,
        pronoun: pronoun ?? this.pronoun,
      );
  Verb copyWithCompanion(VerbsCompanion data) {
    return Verb(
      id: data.id.present ? data.id.value : this.id,
      translation:
          data.translation.present ? data.translation.value : this.translation,
      value: data.value.present ? data.value.value : this.value,
      position: data.position.present ? data.position.value : this.position,
      pronoun: data.pronoun.present ? data.pronoun.value : this.pronoun,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Verb(')
          ..write('id: $id, ')
          ..write('translation: $translation, ')
          ..write('value: $value, ')
          ..write('position: $position, ')
          ..write('pronoun: $pronoun')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, translation, value, position, pronoun);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Verb &&
          other.id == this.id &&
          other.translation == this.translation &&
          other.value == this.value &&
          other.position == this.position &&
          other.pronoun == this.pronoun);
}

class VerbsCompanion extends UpdateCompanion<Verb> {
  final Value<int> id;
  final Value<int> translation;
  final Value<String> value;
  final Value<int> position;
  final Value<int> pronoun;
  const VerbsCompanion({
    this.id = const Value.absent(),
    this.translation = const Value.absent(),
    this.value = const Value.absent(),
    this.position = const Value.absent(),
    this.pronoun = const Value.absent(),
  });
  VerbsCompanion.insert({
    this.id = const Value.absent(),
    required int translation,
    required String value,
    required int position,
    required int pronoun,
  })  : translation = Value(translation),
        value = Value(value),
        position = Value(position),
        pronoun = Value(pronoun);
  static Insertable<Verb> custom({
    Expression<int>? id,
    Expression<int>? translation,
    Expression<String>? value,
    Expression<int>? position,
    Expression<int>? pronoun,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (translation != null) 'translation': translation,
      if (value != null) 'value': value,
      if (position != null) 'position': position,
      if (pronoun != null) 'pronoun': pronoun,
    });
  }

  VerbsCompanion copyWith(
      {Value<int>? id,
      Value<int>? translation,
      Value<String>? value,
      Value<int>? position,
      Value<int>? pronoun}) {
    return VerbsCompanion(
      id: id ?? this.id,
      translation: translation ?? this.translation,
      value: value ?? this.value,
      position: position ?? this.position,
      pronoun: pronoun ?? this.pronoun,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (translation.present) {
      map['translation'] = Variable<int>(translation.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (pronoun.present) {
      map['pronoun'] = Variable<int>(pronoun.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VerbsCompanion(')
          ..write('id: $id, ')
          ..write('translation: $translation, ')
          ..write('value: $value, ')
          ..write('position: $position, ')
          ..write('pronoun: $pronoun')
          ..write(')'))
        .toString();
  }
}

class $GenderTable extends Gender with TableInfo<$GenderTable, GenderData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GenderTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
      'value', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'gender';
  @override
  VerificationContext validateIntegrity(Insertable<GenderData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GenderData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GenderData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value'])!,
    );
  }

  @override
  $GenderTable createAlias(String alias) {
    return $GenderTable(attachedDatabase, alias);
  }
}

class GenderData extends DataClass implements Insertable<GenderData> {
  final int id;
  final String value;
  const GenderData({required this.id, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['value'] = Variable<String>(value);
    return map;
  }

  GenderCompanion toCompanion(bool nullToAbsent) {
    return GenderCompanion(
      id: Value(id),
      value: Value(value),
    );
  }

  factory GenderData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GenderData(
      id: serializer.fromJson<int>(json['id']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'value': serializer.toJson<String>(value),
    };
  }

  GenderData copyWith({int? id, String? value}) => GenderData(
        id: id ?? this.id,
        value: value ?? this.value,
      );
  GenderData copyWithCompanion(GenderCompanion data) {
    return GenderData(
      id: data.id.present ? data.id.value : this.id,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GenderData(')
          ..write('id: $id, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GenderData && other.id == this.id && other.value == this.value);
}

class GenderCompanion extends UpdateCompanion<GenderData> {
  final Value<int> id;
  final Value<String> value;
  const GenderCompanion({
    this.id = const Value.absent(),
    this.value = const Value.absent(),
  });
  GenderCompanion.insert({
    this.id = const Value.absent(),
    required String value,
  }) : value = Value(value);
  static Insertable<GenderData> custom({
    Expression<int>? id,
    Expression<String>? value,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (value != null) 'value': value,
    });
  }

  GenderCompanion copyWith({Value<int>? id, Value<String>? value}) {
    return GenderCompanion(
      id: id ?? this.id,
      value: value ?? this.value,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GenderCompanion(')
          ..write('id: $id, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }
}

class $NounsTable extends Nouns with TableInfo<$NounsTable, Noun> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NounsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _translationMeta =
      const VerificationMeta('translation');
  @override
  late final GeneratedColumn<int> translation = GeneratedColumn<int>(
      'translation', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES translations (id)'));
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
      'value', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<int> gender = GeneratedColumn<int>(
      'gender', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES translations (id)'));
  static const VerificationMeta _pluralMeta = const VerificationMeta('plural');
  @override
  late final GeneratedColumn<String> plural = GeneratedColumn<String>(
      'plural', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, translation, value, gender, plural];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'nouns';
  @override
  VerificationContext validateIntegrity(Insertable<Noun> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('translation')) {
      context.handle(
          _translationMeta,
          translation.isAcceptableOrUnknown(
              data['translation']!, _translationMeta));
    } else if (isInserting) {
      context.missing(_translationMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
    } else if (isInserting) {
      context.missing(_genderMeta);
    }
    if (data.containsKey('plural')) {
      context.handle(_pluralMeta,
          plural.isAcceptableOrUnknown(data['plural']!, _pluralMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Noun map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Noun(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      translation: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}translation'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value'])!,
      gender: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}gender'])!,
      plural: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}plural']),
    );
  }

  @override
  $NounsTable createAlias(String alias) {
    return $NounsTable(attachedDatabase, alias);
  }
}

class Noun extends DataClass implements Insertable<Noun> {
  final int id;
  final int translation;
  final String value;
  final int gender;
  final String? plural;
  const Noun(
      {required this.id,
      required this.translation,
      required this.value,
      required this.gender,
      this.plural});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['translation'] = Variable<int>(translation);
    map['value'] = Variable<String>(value);
    map['gender'] = Variable<int>(gender);
    if (!nullToAbsent || plural != null) {
      map['plural'] = Variable<String>(plural);
    }
    return map;
  }

  NounsCompanion toCompanion(bool nullToAbsent) {
    return NounsCompanion(
      id: Value(id),
      translation: Value(translation),
      value: Value(value),
      gender: Value(gender),
      plural:
          plural == null && nullToAbsent ? const Value.absent() : Value(plural),
    );
  }

  factory Noun.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Noun(
      id: serializer.fromJson<int>(json['id']),
      translation: serializer.fromJson<int>(json['translation']),
      value: serializer.fromJson<String>(json['value']),
      gender: serializer.fromJson<int>(json['gender']),
      plural: serializer.fromJson<String?>(json['plural']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'translation': serializer.toJson<int>(translation),
      'value': serializer.toJson<String>(value),
      'gender': serializer.toJson<int>(gender),
      'plural': serializer.toJson<String?>(plural),
    };
  }

  Noun copyWith(
          {int? id,
          int? translation,
          String? value,
          int? gender,
          Value<String?> plural = const Value.absent()}) =>
      Noun(
        id: id ?? this.id,
        translation: translation ?? this.translation,
        value: value ?? this.value,
        gender: gender ?? this.gender,
        plural: plural.present ? plural.value : this.plural,
      );
  Noun copyWithCompanion(NounsCompanion data) {
    return Noun(
      id: data.id.present ? data.id.value : this.id,
      translation:
          data.translation.present ? data.translation.value : this.translation,
      value: data.value.present ? data.value.value : this.value,
      gender: data.gender.present ? data.gender.value : this.gender,
      plural: data.plural.present ? data.plural.value : this.plural,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Noun(')
          ..write('id: $id, ')
          ..write('translation: $translation, ')
          ..write('value: $value, ')
          ..write('gender: $gender, ')
          ..write('plural: $plural')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, translation, value, gender, plural);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Noun &&
          other.id == this.id &&
          other.translation == this.translation &&
          other.value == this.value &&
          other.gender == this.gender &&
          other.plural == this.plural);
}

class NounsCompanion extends UpdateCompanion<Noun> {
  final Value<int> id;
  final Value<int> translation;
  final Value<String> value;
  final Value<int> gender;
  final Value<String?> plural;
  const NounsCompanion({
    this.id = const Value.absent(),
    this.translation = const Value.absent(),
    this.value = const Value.absent(),
    this.gender = const Value.absent(),
    this.plural = const Value.absent(),
  });
  NounsCompanion.insert({
    this.id = const Value.absent(),
    required int translation,
    required String value,
    required int gender,
    this.plural = const Value.absent(),
  })  : translation = Value(translation),
        value = Value(value),
        gender = Value(gender);
  static Insertable<Noun> custom({
    Expression<int>? id,
    Expression<int>? translation,
    Expression<String>? value,
    Expression<int>? gender,
    Expression<String>? plural,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (translation != null) 'translation': translation,
      if (value != null) 'value': value,
      if (gender != null) 'gender': gender,
      if (plural != null) 'plural': plural,
    });
  }

  NounsCompanion copyWith(
      {Value<int>? id,
      Value<int>? translation,
      Value<String>? value,
      Value<int>? gender,
      Value<String?>? plural}) {
    return NounsCompanion(
      id: id ?? this.id,
      translation: translation ?? this.translation,
      value: value ?? this.value,
      gender: gender ?? this.gender,
      plural: plural ?? this.plural,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (translation.present) {
      map['translation'] = Variable<int>(translation.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (gender.present) {
      map['gender'] = Variable<int>(gender.value);
    }
    if (plural.present) {
      map['plural'] = Variable<String>(plural.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NounsCompanion(')
          ..write('id: $id, ')
          ..write('translation: $translation, ')
          ..write('value: $value, ')
          ..write('gender: $gender, ')
          ..write('plural: $plural')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CoursesTable courses = $CoursesTable(this);
  late final $SectionsTable sections = $SectionsTable(this);
  late final $WordTypesTable wordTypes = $WordTypesTable(this);
  late final $TranslationsTable translations = $TranslationsTable(this);
  late final $WordsTable words = $WordsTable(this);
  late final $PronounsTable pronouns = $PronounsTable(this);
  late final $VerbsTable verbs = $VerbsTable(this);
  late final $GenderTable gender = $GenderTable(this);
  late final $NounsTable nouns = $NounsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        courses,
        sections,
        wordTypes,
        translations,
        words,
        pronouns,
        verbs,
        gender,
        nouns
      ];
}

typedef $$CoursesTableCreateCompanionBuilder = CoursesCompanion Function({
  Value<int> id,
  required String name,
  required String level,
  required String language,
});
typedef $$CoursesTableUpdateCompanionBuilder = CoursesCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> level,
  Value<String> language,
});

class $$CoursesTableFilterComposer
    extends Composer<_$AppDatabase, $CoursesTable> {
  $$CoursesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get level => $composableBuilder(
      column: $table.level, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get language => $composableBuilder(
      column: $table.language, builder: (column) => ColumnFilters(column));
}

class $$CoursesTableOrderingComposer
    extends Composer<_$AppDatabase, $CoursesTable> {
  $$CoursesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get level => $composableBuilder(
      column: $table.level, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get language => $composableBuilder(
      column: $table.language, builder: (column) => ColumnOrderings(column));
}

class $$CoursesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CoursesTable> {
  $$CoursesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get level =>
      $composableBuilder(column: $table.level, builder: (column) => column);

  GeneratedColumn<String> get language =>
      $composableBuilder(column: $table.language, builder: (column) => column);
}

class $$CoursesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CoursesTable,
    Course,
    $$CoursesTableFilterComposer,
    $$CoursesTableOrderingComposer,
    $$CoursesTableAnnotationComposer,
    $$CoursesTableCreateCompanionBuilder,
    $$CoursesTableUpdateCompanionBuilder,
    (Course, BaseReferences<_$AppDatabase, $CoursesTable, Course>),
    Course,
    PrefetchHooks Function()> {
  $$CoursesTableTableManager(_$AppDatabase db, $CoursesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CoursesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CoursesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CoursesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> level = const Value.absent(),
            Value<String> language = const Value.absent(),
          }) =>
              CoursesCompanion(
            id: id,
            name: name,
            level: level,
            language: language,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String level,
            required String language,
          }) =>
              CoursesCompanion.insert(
            id: id,
            name: name,
            level: level,
            language: language,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CoursesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CoursesTable,
    Course,
    $$CoursesTableFilterComposer,
    $$CoursesTableOrderingComposer,
    $$CoursesTableAnnotationComposer,
    $$CoursesTableCreateCompanionBuilder,
    $$CoursesTableUpdateCompanionBuilder,
    (Course, BaseReferences<_$AppDatabase, $CoursesTable, Course>),
    Course,
    PrefetchHooks Function()>;
typedef $$SectionsTableCreateCompanionBuilder = SectionsCompanion Function({
  Value<int> id,
  required String name,
  required int number,
});
typedef $$SectionsTableUpdateCompanionBuilder = SectionsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<int> number,
});

final class $$SectionsTableReferences
    extends BaseReferences<_$AppDatabase, $SectionsTable, Section> {
  $$SectionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TranslationsTable, List<Translation>>
      _translationsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.translations,
          aliasName:
              $_aliasNameGenerator(db.sections.id, db.translations.section));

  $$TranslationsTableProcessedTableManager get translationsRefs {
    final manager = $$TranslationsTableTableManager($_db, $_db.translations)
        .filter((f) => f.section.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_translationsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$SectionsTableFilterComposer
    extends Composer<_$AppDatabase, $SectionsTable> {
  $$SectionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get number => $composableBuilder(
      column: $table.number, builder: (column) => ColumnFilters(column));

  Expression<bool> translationsRefs(
      Expression<bool> Function($$TranslationsTableFilterComposer f) f) {
    final $$TranslationsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.translations,
        getReferencedColumn: (t) => t.section,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TranslationsTableFilterComposer(
              $db: $db,
              $table: $db.translations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$SectionsTableOrderingComposer
    extends Composer<_$AppDatabase, $SectionsTable> {
  $$SectionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get number => $composableBuilder(
      column: $table.number, builder: (column) => ColumnOrderings(column));
}

class $$SectionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SectionsTable> {
  $$SectionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get number =>
      $composableBuilder(column: $table.number, builder: (column) => column);

  Expression<T> translationsRefs<T extends Object>(
      Expression<T> Function($$TranslationsTableAnnotationComposer a) f) {
    final $$TranslationsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.translations,
        getReferencedColumn: (t) => t.section,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TranslationsTableAnnotationComposer(
              $db: $db,
              $table: $db.translations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$SectionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SectionsTable,
    Section,
    $$SectionsTableFilterComposer,
    $$SectionsTableOrderingComposer,
    $$SectionsTableAnnotationComposer,
    $$SectionsTableCreateCompanionBuilder,
    $$SectionsTableUpdateCompanionBuilder,
    (Section, $$SectionsTableReferences),
    Section,
    PrefetchHooks Function({bool translationsRefs})> {
  $$SectionsTableTableManager(_$AppDatabase db, $SectionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SectionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SectionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SectionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> number = const Value.absent(),
          }) =>
              SectionsCompanion(
            id: id,
            name: name,
            number: number,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required int number,
          }) =>
              SectionsCompanion.insert(
            id: id,
            name: name,
            number: number,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$SectionsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({translationsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (translationsRefs) db.translations],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (translationsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$SectionsTableReferences
                            ._translationsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$SectionsTableReferences(db, table, p0)
                                .translationsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.section == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$SectionsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SectionsTable,
    Section,
    $$SectionsTableFilterComposer,
    $$SectionsTableOrderingComposer,
    $$SectionsTableAnnotationComposer,
    $$SectionsTableCreateCompanionBuilder,
    $$SectionsTableUpdateCompanionBuilder,
    (Section, $$SectionsTableReferences),
    Section,
    PrefetchHooks Function({bool translationsRefs})>;
typedef $$WordTypesTableCreateCompanionBuilder = WordTypesCompanion Function({
  Value<int> id,
  required String name,
});
typedef $$WordTypesTableUpdateCompanionBuilder = WordTypesCompanion Function({
  Value<int> id,
  Value<String> name,
});

final class $$WordTypesTableReferences
    extends BaseReferences<_$AppDatabase, $WordTypesTable, WordType> {
  $$WordTypesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TranslationsTable, List<Translation>>
      _translationsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.translations,
              aliasName:
                  $_aliasNameGenerator(db.wordTypes.id, db.translations.type));

  $$TranslationsTableProcessedTableManager get translationsRefs {
    final manager = $$TranslationsTableTableManager($_db, $_db.translations)
        .filter((f) => f.type.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_translationsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$WordTypesTableFilterComposer
    extends Composer<_$AppDatabase, $WordTypesTable> {
  $$WordTypesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  Expression<bool> translationsRefs(
      Expression<bool> Function($$TranslationsTableFilterComposer f) f) {
    final $$TranslationsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.translations,
        getReferencedColumn: (t) => t.type,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TranslationsTableFilterComposer(
              $db: $db,
              $table: $db.translations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$WordTypesTableOrderingComposer
    extends Composer<_$AppDatabase, $WordTypesTable> {
  $$WordTypesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));
}

class $$WordTypesTableAnnotationComposer
    extends Composer<_$AppDatabase, $WordTypesTable> {
  $$WordTypesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> translationsRefs<T extends Object>(
      Expression<T> Function($$TranslationsTableAnnotationComposer a) f) {
    final $$TranslationsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.translations,
        getReferencedColumn: (t) => t.type,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TranslationsTableAnnotationComposer(
              $db: $db,
              $table: $db.translations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$WordTypesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WordTypesTable,
    WordType,
    $$WordTypesTableFilterComposer,
    $$WordTypesTableOrderingComposer,
    $$WordTypesTableAnnotationComposer,
    $$WordTypesTableCreateCompanionBuilder,
    $$WordTypesTableUpdateCompanionBuilder,
    (WordType, $$WordTypesTableReferences),
    WordType,
    PrefetchHooks Function({bool translationsRefs})> {
  $$WordTypesTableTableManager(_$AppDatabase db, $WordTypesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WordTypesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WordTypesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WordTypesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
          }) =>
              WordTypesCompanion(
            id: id,
            name: name,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
          }) =>
              WordTypesCompanion.insert(
            id: id,
            name: name,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$WordTypesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({translationsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (translationsRefs) db.translations],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (translationsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$WordTypesTableReferences
                            ._translationsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$WordTypesTableReferences(db, table, p0)
                                .translationsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) =>
                                referencedItems.where((e) => e.type == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$WordTypesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $WordTypesTable,
    WordType,
    $$WordTypesTableFilterComposer,
    $$WordTypesTableOrderingComposer,
    $$WordTypesTableAnnotationComposer,
    $$WordTypesTableCreateCompanionBuilder,
    $$WordTypesTableUpdateCompanionBuilder,
    (WordType, $$WordTypesTableReferences),
    WordType,
    PrefetchHooks Function({bool translationsRefs})>;
typedef $$TranslationsTableCreateCompanionBuilder = TranslationsCompanion
    Function({
  Value<int> id,
  required int section,
  required int type,
  required String value,
  required String specifier,
  required DateTime createdAt,
  Value<DateTime?> lastCorrect,
  Value<DateTime?> lastWrong,
  Value<int> correctCount,
  Value<int> wrongCount,
});
typedef $$TranslationsTableUpdateCompanionBuilder = TranslationsCompanion
    Function({
  Value<int> id,
  Value<int> section,
  Value<int> type,
  Value<String> value,
  Value<String> specifier,
  Value<DateTime> createdAt,
  Value<DateTime?> lastCorrect,
  Value<DateTime?> lastWrong,
  Value<int> correctCount,
  Value<int> wrongCount,
});

final class $$TranslationsTableReferences
    extends BaseReferences<_$AppDatabase, $TranslationsTable, Translation> {
  $$TranslationsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SectionsTable _sectionTable(_$AppDatabase db) =>
      db.sections.createAlias(
          $_aliasNameGenerator(db.translations.section, db.sections.id));

  $$SectionsTableProcessedTableManager get section {
    final manager = $$SectionsTableTableManager($_db, $_db.sections)
        .filter((f) => f.id($_item.section!));
    final item = $_typedResult.readTableOrNull(_sectionTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $WordTypesTable _typeTable(_$AppDatabase db) => db.wordTypes
      .createAlias($_aliasNameGenerator(db.translations.type, db.wordTypes.id));

  $$WordTypesTableProcessedTableManager get type {
    final manager = $$WordTypesTableTableManager($_db, $_db.wordTypes)
        .filter((f) => f.id($_item.type!));
    final item = $_typedResult.readTableOrNull(_typeTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$WordsTable, List<Word>> _wordsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.words,
          aliasName:
              $_aliasNameGenerator(db.translations.id, db.words.translation));

  $$WordsTableProcessedTableManager get wordsRefs {
    final manager = $$WordsTableTableManager($_db, $_db.words)
        .filter((f) => f.translation.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_wordsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$VerbsTable, List<Verb>> _verbsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.verbs,
          aliasName:
              $_aliasNameGenerator(db.translations.id, db.verbs.translation));

  $$VerbsTableProcessedTableManager get verbsRefs {
    final manager = $$VerbsTableTableManager($_db, $_db.verbs)
        .filter((f) => f.translation.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_verbsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$TranslationsTableFilterComposer
    extends Composer<_$AppDatabase, $TranslationsTable> {
  $$TranslationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get specifier => $composableBuilder(
      column: $table.specifier, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastCorrect => $composableBuilder(
      column: $table.lastCorrect, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastWrong => $composableBuilder(
      column: $table.lastWrong, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get correctCount => $composableBuilder(
      column: $table.correctCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get wrongCount => $composableBuilder(
      column: $table.wrongCount, builder: (column) => ColumnFilters(column));

  $$SectionsTableFilterComposer get section {
    final $$SectionsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.section,
        referencedTable: $db.sections,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SectionsTableFilterComposer(
              $db: $db,
              $table: $db.sections,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$WordTypesTableFilterComposer get type {
    final $$WordTypesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.type,
        referencedTable: $db.wordTypes,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WordTypesTableFilterComposer(
              $db: $db,
              $table: $db.wordTypes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> wordsRefs(
      Expression<bool> Function($$WordsTableFilterComposer f) f) {
    final $$WordsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.words,
        getReferencedColumn: (t) => t.translation,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WordsTableFilterComposer(
              $db: $db,
              $table: $db.words,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> verbsRefs(
      Expression<bool> Function($$VerbsTableFilterComposer f) f) {
    final $$VerbsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.verbs,
        getReferencedColumn: (t) => t.translation,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VerbsTableFilterComposer(
              $db: $db,
              $table: $db.verbs,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TranslationsTableOrderingComposer
    extends Composer<_$AppDatabase, $TranslationsTable> {
  $$TranslationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get specifier => $composableBuilder(
      column: $table.specifier, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastCorrect => $composableBuilder(
      column: $table.lastCorrect, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastWrong => $composableBuilder(
      column: $table.lastWrong, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get correctCount => $composableBuilder(
      column: $table.correctCount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get wrongCount => $composableBuilder(
      column: $table.wrongCount, builder: (column) => ColumnOrderings(column));

  $$SectionsTableOrderingComposer get section {
    final $$SectionsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.section,
        referencedTable: $db.sections,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SectionsTableOrderingComposer(
              $db: $db,
              $table: $db.sections,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$WordTypesTableOrderingComposer get type {
    final $$WordTypesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.type,
        referencedTable: $db.wordTypes,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WordTypesTableOrderingComposer(
              $db: $db,
              $table: $db.wordTypes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TranslationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TranslationsTable> {
  $$TranslationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<String> get specifier =>
      $composableBuilder(column: $table.specifier, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastCorrect => $composableBuilder(
      column: $table.lastCorrect, builder: (column) => column);

  GeneratedColumn<DateTime> get lastWrong =>
      $composableBuilder(column: $table.lastWrong, builder: (column) => column);

  GeneratedColumn<int> get correctCount => $composableBuilder(
      column: $table.correctCount, builder: (column) => column);

  GeneratedColumn<int> get wrongCount => $composableBuilder(
      column: $table.wrongCount, builder: (column) => column);

  $$SectionsTableAnnotationComposer get section {
    final $$SectionsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.section,
        referencedTable: $db.sections,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SectionsTableAnnotationComposer(
              $db: $db,
              $table: $db.sections,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$WordTypesTableAnnotationComposer get type {
    final $$WordTypesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.type,
        referencedTable: $db.wordTypes,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WordTypesTableAnnotationComposer(
              $db: $db,
              $table: $db.wordTypes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> wordsRefs<T extends Object>(
      Expression<T> Function($$WordsTableAnnotationComposer a) f) {
    final $$WordsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.words,
        getReferencedColumn: (t) => t.translation,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WordsTableAnnotationComposer(
              $db: $db,
              $table: $db.words,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> verbsRefs<T extends Object>(
      Expression<T> Function($$VerbsTableAnnotationComposer a) f) {
    final $$VerbsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.verbs,
        getReferencedColumn: (t) => t.translation,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VerbsTableAnnotationComposer(
              $db: $db,
              $table: $db.verbs,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TranslationsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TranslationsTable,
    Translation,
    $$TranslationsTableFilterComposer,
    $$TranslationsTableOrderingComposer,
    $$TranslationsTableAnnotationComposer,
    $$TranslationsTableCreateCompanionBuilder,
    $$TranslationsTableUpdateCompanionBuilder,
    (Translation, $$TranslationsTableReferences),
    Translation,
    PrefetchHooks Function(
        {bool section, bool type, bool wordsRefs, bool verbsRefs})> {
  $$TranslationsTableTableManager(_$AppDatabase db, $TranslationsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TranslationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TranslationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TranslationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> section = const Value.absent(),
            Value<int> type = const Value.absent(),
            Value<String> value = const Value.absent(),
            Value<String> specifier = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> lastCorrect = const Value.absent(),
            Value<DateTime?> lastWrong = const Value.absent(),
            Value<int> correctCount = const Value.absent(),
            Value<int> wrongCount = const Value.absent(),
          }) =>
              TranslationsCompanion(
            id: id,
            section: section,
            type: type,
            value: value,
            specifier: specifier,
            createdAt: createdAt,
            lastCorrect: lastCorrect,
            lastWrong: lastWrong,
            correctCount: correctCount,
            wrongCount: wrongCount,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int section,
            required int type,
            required String value,
            required String specifier,
            required DateTime createdAt,
            Value<DateTime?> lastCorrect = const Value.absent(),
            Value<DateTime?> lastWrong = const Value.absent(),
            Value<int> correctCount = const Value.absent(),
            Value<int> wrongCount = const Value.absent(),
          }) =>
              TranslationsCompanion.insert(
            id: id,
            section: section,
            type: type,
            value: value,
            specifier: specifier,
            createdAt: createdAt,
            lastCorrect: lastCorrect,
            lastWrong: lastWrong,
            correctCount: correctCount,
            wrongCount: wrongCount,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TranslationsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {section = false,
              type = false,
              wordsRefs = false,
              verbsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (wordsRefs) db.words,
                if (verbsRefs) db.verbs
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (section) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.section,
                    referencedTable:
                        $$TranslationsTableReferences._sectionTable(db),
                    referencedColumn:
                        $$TranslationsTableReferences._sectionTable(db).id,
                  ) as T;
                }
                if (type) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.type,
                    referencedTable:
                        $$TranslationsTableReferences._typeTable(db),
                    referencedColumn:
                        $$TranslationsTableReferences._typeTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (wordsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$TranslationsTableReferences._wordsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TranslationsTableReferences(db, table, p0)
                                .wordsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.translation == item.id),
                        typedResults: items),
                  if (verbsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$TranslationsTableReferences._verbsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TranslationsTableReferences(db, table, p0)
                                .verbsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.translation == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$TranslationsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TranslationsTable,
    Translation,
    $$TranslationsTableFilterComposer,
    $$TranslationsTableOrderingComposer,
    $$TranslationsTableAnnotationComposer,
    $$TranslationsTableCreateCompanionBuilder,
    $$TranslationsTableUpdateCompanionBuilder,
    (Translation, $$TranslationsTableReferences),
    Translation,
    PrefetchHooks Function(
        {bool section, bool type, bool wordsRefs, bool verbsRefs})>;
typedef $$WordsTableCreateCompanionBuilder = WordsCompanion Function({
  Value<int> id,
  required int translation,
  required String value,
});
typedef $$WordsTableUpdateCompanionBuilder = WordsCompanion Function({
  Value<int> id,
  Value<int> translation,
  Value<String> value,
});

final class $$WordsTableReferences
    extends BaseReferences<_$AppDatabase, $WordsTable, Word> {
  $$WordsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TranslationsTable _translationTable(_$AppDatabase db) =>
      db.translations.createAlias(
          $_aliasNameGenerator(db.words.translation, db.translations.id));

  $$TranslationsTableProcessedTableManager get translation {
    final manager = $$TranslationsTableTableManager($_db, $_db.translations)
        .filter((f) => f.id($_item.translation!));
    final item = $_typedResult.readTableOrNull(_translationTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$WordsTableFilterComposer extends Composer<_$AppDatabase, $WordsTable> {
  $$WordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnFilters(column));

  $$TranslationsTableFilterComposer get translation {
    final $$TranslationsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.translation,
        referencedTable: $db.translations,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TranslationsTableFilterComposer(
              $db: $db,
              $table: $db.translations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$WordsTableOrderingComposer
    extends Composer<_$AppDatabase, $WordsTable> {
  $$WordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnOrderings(column));

  $$TranslationsTableOrderingComposer get translation {
    final $$TranslationsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.translation,
        referencedTable: $db.translations,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TranslationsTableOrderingComposer(
              $db: $db,
              $table: $db.translations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$WordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WordsTable> {
  $$WordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  $$TranslationsTableAnnotationComposer get translation {
    final $$TranslationsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.translation,
        referencedTable: $db.translations,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TranslationsTableAnnotationComposer(
              $db: $db,
              $table: $db.translations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$WordsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WordsTable,
    Word,
    $$WordsTableFilterComposer,
    $$WordsTableOrderingComposer,
    $$WordsTableAnnotationComposer,
    $$WordsTableCreateCompanionBuilder,
    $$WordsTableUpdateCompanionBuilder,
    (Word, $$WordsTableReferences),
    Word,
    PrefetchHooks Function({bool translation})> {
  $$WordsTableTableManager(_$AppDatabase db, $WordsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> translation = const Value.absent(),
            Value<String> value = const Value.absent(),
          }) =>
              WordsCompanion(
            id: id,
            translation: translation,
            value: value,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int translation,
            required String value,
          }) =>
              WordsCompanion.insert(
            id: id,
            translation: translation,
            value: value,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$WordsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({translation = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (translation) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.translation,
                    referencedTable:
                        $$WordsTableReferences._translationTable(db),
                    referencedColumn:
                        $$WordsTableReferences._translationTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$WordsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $WordsTable,
    Word,
    $$WordsTableFilterComposer,
    $$WordsTableOrderingComposer,
    $$WordsTableAnnotationComposer,
    $$WordsTableCreateCompanionBuilder,
    $$WordsTableUpdateCompanionBuilder,
    (Word, $$WordsTableReferences),
    Word,
    PrefetchHooks Function({bool translation})>;
typedef $$PronounsTableCreateCompanionBuilder = PronounsCompanion Function({
  Value<int> id,
  required String value,
});
typedef $$PronounsTableUpdateCompanionBuilder = PronounsCompanion Function({
  Value<int> id,
  Value<String> value,
});

final class $$PronounsTableReferences
    extends BaseReferences<_$AppDatabase, $PronounsTable, Pronoun> {
  $$PronounsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$VerbsTable, List<Verb>> _verbsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.verbs,
          aliasName: $_aliasNameGenerator(db.pronouns.id, db.verbs.pronoun));

  $$VerbsTableProcessedTableManager get verbsRefs {
    final manager = $$VerbsTableTableManager($_db, $_db.verbs)
        .filter((f) => f.pronoun.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_verbsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$PronounsTableFilterComposer
    extends Composer<_$AppDatabase, $PronounsTable> {
  $$PronounsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnFilters(column));

  Expression<bool> verbsRefs(
      Expression<bool> Function($$VerbsTableFilterComposer f) f) {
    final $$VerbsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.verbs,
        getReferencedColumn: (t) => t.pronoun,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VerbsTableFilterComposer(
              $db: $db,
              $table: $db.verbs,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$PronounsTableOrderingComposer
    extends Composer<_$AppDatabase, $PronounsTable> {
  $$PronounsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnOrderings(column));
}

class $$PronounsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PronounsTable> {
  $$PronounsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  Expression<T> verbsRefs<T extends Object>(
      Expression<T> Function($$VerbsTableAnnotationComposer a) f) {
    final $$VerbsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.verbs,
        getReferencedColumn: (t) => t.pronoun,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VerbsTableAnnotationComposer(
              $db: $db,
              $table: $db.verbs,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$PronounsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PronounsTable,
    Pronoun,
    $$PronounsTableFilterComposer,
    $$PronounsTableOrderingComposer,
    $$PronounsTableAnnotationComposer,
    $$PronounsTableCreateCompanionBuilder,
    $$PronounsTableUpdateCompanionBuilder,
    (Pronoun, $$PronounsTableReferences),
    Pronoun,
    PrefetchHooks Function({bool verbsRefs})> {
  $$PronounsTableTableManager(_$AppDatabase db, $PronounsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PronounsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PronounsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PronounsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> value = const Value.absent(),
          }) =>
              PronounsCompanion(
            id: id,
            value: value,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String value,
          }) =>
              PronounsCompanion.insert(
            id: id,
            value: value,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$PronounsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({verbsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (verbsRefs) db.verbs],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (verbsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$PronounsTableReferences._verbsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PronounsTableReferences(db, table, p0).verbsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.pronoun == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$PronounsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PronounsTable,
    Pronoun,
    $$PronounsTableFilterComposer,
    $$PronounsTableOrderingComposer,
    $$PronounsTableAnnotationComposer,
    $$PronounsTableCreateCompanionBuilder,
    $$PronounsTableUpdateCompanionBuilder,
    (Pronoun, $$PronounsTableReferences),
    Pronoun,
    PrefetchHooks Function({bool verbsRefs})>;
typedef $$VerbsTableCreateCompanionBuilder = VerbsCompanion Function({
  Value<int> id,
  required int translation,
  required String value,
  required int position,
  required int pronoun,
});
typedef $$VerbsTableUpdateCompanionBuilder = VerbsCompanion Function({
  Value<int> id,
  Value<int> translation,
  Value<String> value,
  Value<int> position,
  Value<int> pronoun,
});

final class $$VerbsTableReferences
    extends BaseReferences<_$AppDatabase, $VerbsTable, Verb> {
  $$VerbsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TranslationsTable _translationTable(_$AppDatabase db) =>
      db.translations.createAlias(
          $_aliasNameGenerator(db.verbs.translation, db.translations.id));

  $$TranslationsTableProcessedTableManager get translation {
    final manager = $$TranslationsTableTableManager($_db, $_db.translations)
        .filter((f) => f.id($_item.translation!));
    final item = $_typedResult.readTableOrNull(_translationTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $PronounsTable _pronounTable(_$AppDatabase db) => db.pronouns
      .createAlias($_aliasNameGenerator(db.verbs.pronoun, db.pronouns.id));

  $$PronounsTableProcessedTableManager get pronoun {
    final manager = $$PronounsTableTableManager($_db, $_db.pronouns)
        .filter((f) => f.id($_item.pronoun!));
    final item = $_typedResult.readTableOrNull(_pronounTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$VerbsTableFilterComposer extends Composer<_$AppDatabase, $VerbsTable> {
  $$VerbsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get position => $composableBuilder(
      column: $table.position, builder: (column) => ColumnFilters(column));

  $$TranslationsTableFilterComposer get translation {
    final $$TranslationsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.translation,
        referencedTable: $db.translations,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TranslationsTableFilterComposer(
              $db: $db,
              $table: $db.translations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PronounsTableFilterComposer get pronoun {
    final $$PronounsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.pronoun,
        referencedTable: $db.pronouns,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PronounsTableFilterComposer(
              $db: $db,
              $table: $db.pronouns,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$VerbsTableOrderingComposer
    extends Composer<_$AppDatabase, $VerbsTable> {
  $$VerbsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get position => $composableBuilder(
      column: $table.position, builder: (column) => ColumnOrderings(column));

  $$TranslationsTableOrderingComposer get translation {
    final $$TranslationsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.translation,
        referencedTable: $db.translations,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TranslationsTableOrderingComposer(
              $db: $db,
              $table: $db.translations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PronounsTableOrderingComposer get pronoun {
    final $$PronounsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.pronoun,
        referencedTable: $db.pronouns,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PronounsTableOrderingComposer(
              $db: $db,
              $table: $db.pronouns,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$VerbsTableAnnotationComposer
    extends Composer<_$AppDatabase, $VerbsTable> {
  $$VerbsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<int> get position =>
      $composableBuilder(column: $table.position, builder: (column) => column);

  $$TranslationsTableAnnotationComposer get translation {
    final $$TranslationsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.translation,
        referencedTable: $db.translations,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TranslationsTableAnnotationComposer(
              $db: $db,
              $table: $db.translations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PronounsTableAnnotationComposer get pronoun {
    final $$PronounsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.pronoun,
        referencedTable: $db.pronouns,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PronounsTableAnnotationComposer(
              $db: $db,
              $table: $db.pronouns,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$VerbsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $VerbsTable,
    Verb,
    $$VerbsTableFilterComposer,
    $$VerbsTableOrderingComposer,
    $$VerbsTableAnnotationComposer,
    $$VerbsTableCreateCompanionBuilder,
    $$VerbsTableUpdateCompanionBuilder,
    (Verb, $$VerbsTableReferences),
    Verb,
    PrefetchHooks Function({bool translation, bool pronoun})> {
  $$VerbsTableTableManager(_$AppDatabase db, $VerbsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VerbsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VerbsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VerbsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> translation = const Value.absent(),
            Value<String> value = const Value.absent(),
            Value<int> position = const Value.absent(),
            Value<int> pronoun = const Value.absent(),
          }) =>
              VerbsCompanion(
            id: id,
            translation: translation,
            value: value,
            position: position,
            pronoun: pronoun,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int translation,
            required String value,
            required int position,
            required int pronoun,
          }) =>
              VerbsCompanion.insert(
            id: id,
            translation: translation,
            value: value,
            position: position,
            pronoun: pronoun,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$VerbsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({translation = false, pronoun = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (translation) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.translation,
                    referencedTable:
                        $$VerbsTableReferences._translationTable(db),
                    referencedColumn:
                        $$VerbsTableReferences._translationTable(db).id,
                  ) as T;
                }
                if (pronoun) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.pronoun,
                    referencedTable: $$VerbsTableReferences._pronounTable(db),
                    referencedColumn:
                        $$VerbsTableReferences._pronounTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$VerbsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $VerbsTable,
    Verb,
    $$VerbsTableFilterComposer,
    $$VerbsTableOrderingComposer,
    $$VerbsTableAnnotationComposer,
    $$VerbsTableCreateCompanionBuilder,
    $$VerbsTableUpdateCompanionBuilder,
    (Verb, $$VerbsTableReferences),
    Verb,
    PrefetchHooks Function({bool translation, bool pronoun})>;
typedef $$GenderTableCreateCompanionBuilder = GenderCompanion Function({
  Value<int> id,
  required String value,
});
typedef $$GenderTableUpdateCompanionBuilder = GenderCompanion Function({
  Value<int> id,
  Value<String> value,
});

class $$GenderTableFilterComposer
    extends Composer<_$AppDatabase, $GenderTable> {
  $$GenderTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnFilters(column));
}

class $$GenderTableOrderingComposer
    extends Composer<_$AppDatabase, $GenderTable> {
  $$GenderTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnOrderings(column));
}

class $$GenderTableAnnotationComposer
    extends Composer<_$AppDatabase, $GenderTable> {
  $$GenderTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$GenderTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GenderTable,
    GenderData,
    $$GenderTableFilterComposer,
    $$GenderTableOrderingComposer,
    $$GenderTableAnnotationComposer,
    $$GenderTableCreateCompanionBuilder,
    $$GenderTableUpdateCompanionBuilder,
    (GenderData, BaseReferences<_$AppDatabase, $GenderTable, GenderData>),
    GenderData,
    PrefetchHooks Function()> {
  $$GenderTableTableManager(_$AppDatabase db, $GenderTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GenderTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GenderTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GenderTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> value = const Value.absent(),
          }) =>
              GenderCompanion(
            id: id,
            value: value,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String value,
          }) =>
              GenderCompanion.insert(
            id: id,
            value: value,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$GenderTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $GenderTable,
    GenderData,
    $$GenderTableFilterComposer,
    $$GenderTableOrderingComposer,
    $$GenderTableAnnotationComposer,
    $$GenderTableCreateCompanionBuilder,
    $$GenderTableUpdateCompanionBuilder,
    (GenderData, BaseReferences<_$AppDatabase, $GenderTable, GenderData>),
    GenderData,
    PrefetchHooks Function()>;
typedef $$NounsTableCreateCompanionBuilder = NounsCompanion Function({
  Value<int> id,
  required int translation,
  required String value,
  required int gender,
  Value<String?> plural,
});
typedef $$NounsTableUpdateCompanionBuilder = NounsCompanion Function({
  Value<int> id,
  Value<int> translation,
  Value<String> value,
  Value<int> gender,
  Value<String?> plural,
});

final class $$NounsTableReferences
    extends BaseReferences<_$AppDatabase, $NounsTable, Noun> {
  $$NounsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TranslationsTable _translationTable(_$AppDatabase db) =>
      db.translations.createAlias(
          $_aliasNameGenerator(db.nouns.translation, db.translations.id));

  $$TranslationsTableProcessedTableManager get translation {
    final manager = $$TranslationsTableTableManager($_db, $_db.translations)
        .filter((f) => f.id($_item.translation!));
    final item = $_typedResult.readTableOrNull(_translationTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $TranslationsTable _genderTable(_$AppDatabase db) => db.translations
      .createAlias($_aliasNameGenerator(db.nouns.gender, db.translations.id));

  $$TranslationsTableProcessedTableManager get gender {
    final manager = $$TranslationsTableTableManager($_db, $_db.translations)
        .filter((f) => f.id($_item.gender!));
    final item = $_typedResult.readTableOrNull(_genderTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$NounsTableFilterComposer extends Composer<_$AppDatabase, $NounsTable> {
  $$NounsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get plural => $composableBuilder(
      column: $table.plural, builder: (column) => ColumnFilters(column));

  $$TranslationsTableFilterComposer get translation {
    final $$TranslationsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.translation,
        referencedTable: $db.translations,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TranslationsTableFilterComposer(
              $db: $db,
              $table: $db.translations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TranslationsTableFilterComposer get gender {
    final $$TranslationsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.gender,
        referencedTable: $db.translations,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TranslationsTableFilterComposer(
              $db: $db,
              $table: $db.translations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$NounsTableOrderingComposer
    extends Composer<_$AppDatabase, $NounsTable> {
  $$NounsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get plural => $composableBuilder(
      column: $table.plural, builder: (column) => ColumnOrderings(column));

  $$TranslationsTableOrderingComposer get translation {
    final $$TranslationsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.translation,
        referencedTable: $db.translations,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TranslationsTableOrderingComposer(
              $db: $db,
              $table: $db.translations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TranslationsTableOrderingComposer get gender {
    final $$TranslationsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.gender,
        referencedTable: $db.translations,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TranslationsTableOrderingComposer(
              $db: $db,
              $table: $db.translations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$NounsTableAnnotationComposer
    extends Composer<_$AppDatabase, $NounsTable> {
  $$NounsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<String> get plural =>
      $composableBuilder(column: $table.plural, builder: (column) => column);

  $$TranslationsTableAnnotationComposer get translation {
    final $$TranslationsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.translation,
        referencedTable: $db.translations,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TranslationsTableAnnotationComposer(
              $db: $db,
              $table: $db.translations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TranslationsTableAnnotationComposer get gender {
    final $$TranslationsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.gender,
        referencedTable: $db.translations,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TranslationsTableAnnotationComposer(
              $db: $db,
              $table: $db.translations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$NounsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $NounsTable,
    Noun,
    $$NounsTableFilterComposer,
    $$NounsTableOrderingComposer,
    $$NounsTableAnnotationComposer,
    $$NounsTableCreateCompanionBuilder,
    $$NounsTableUpdateCompanionBuilder,
    (Noun, $$NounsTableReferences),
    Noun,
    PrefetchHooks Function({bool translation, bool gender})> {
  $$NounsTableTableManager(_$AppDatabase db, $NounsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NounsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NounsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NounsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> translation = const Value.absent(),
            Value<String> value = const Value.absent(),
            Value<int> gender = const Value.absent(),
            Value<String?> plural = const Value.absent(),
          }) =>
              NounsCompanion(
            id: id,
            translation: translation,
            value: value,
            gender: gender,
            plural: plural,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int translation,
            required String value,
            required int gender,
            Value<String?> plural = const Value.absent(),
          }) =>
              NounsCompanion.insert(
            id: id,
            translation: translation,
            value: value,
            gender: gender,
            plural: plural,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$NounsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({translation = false, gender = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (translation) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.translation,
                    referencedTable:
                        $$NounsTableReferences._translationTable(db),
                    referencedColumn:
                        $$NounsTableReferences._translationTable(db).id,
                  ) as T;
                }
                if (gender) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.gender,
                    referencedTable: $$NounsTableReferences._genderTable(db),
                    referencedColumn:
                        $$NounsTableReferences._genderTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$NounsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $NounsTable,
    Noun,
    $$NounsTableFilterComposer,
    $$NounsTableOrderingComposer,
    $$NounsTableAnnotationComposer,
    $$NounsTableCreateCompanionBuilder,
    $$NounsTableUpdateCompanionBuilder,
    (Noun, $$NounsTableReferences),
    Noun,
    PrefetchHooks Function({bool translation, bool gender})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CoursesTableTableManager get courses =>
      $$CoursesTableTableManager(_db, _db.courses);
  $$SectionsTableTableManager get sections =>
      $$SectionsTableTableManager(_db, _db.sections);
  $$WordTypesTableTableManager get wordTypes =>
      $$WordTypesTableTableManager(_db, _db.wordTypes);
  $$TranslationsTableTableManager get translations =>
      $$TranslationsTableTableManager(_db, _db.translations);
  $$WordsTableTableManager get words =>
      $$WordsTableTableManager(_db, _db.words);
  $$PronounsTableTableManager get pronouns =>
      $$PronounsTableTableManager(_db, _db.pronouns);
  $$VerbsTableTableManager get verbs =>
      $$VerbsTableTableManager(_db, _db.verbs);
  $$GenderTableTableManager get gender =>
      $$GenderTableTableManager(_db, _db.gender);
  $$NounsTableTableManager get nouns =>
      $$NounsTableTableManager(_db, _db.nouns);
}
