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
  static const VerificationMeta _courseMeta = const VerificationMeta('course');
  @override
  late final GeneratedColumn<int> course = GeneratedColumn<int>(
      'course', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES courses (id)'));
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
  List<GeneratedColumn> get $columns => [id, course, name, number];
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
    if (data.containsKey('course')) {
      context.handle(_courseMeta,
          course.isAcceptableOrUnknown(data['course']!, _courseMeta));
    } else if (isInserting) {
      context.missing(_courseMeta);
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
      course: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}course'])!,
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
  final int course;
  final String name;
  final int number;
  const Section(
      {required this.id,
      required this.course,
      required this.name,
      required this.number});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['course'] = Variable<int>(course);
    map['name'] = Variable<String>(name);
    map['number'] = Variable<int>(number);
    return map;
  }

  SectionsCompanion toCompanion(bool nullToAbsent) {
    return SectionsCompanion(
      id: Value(id),
      course: Value(course),
      name: Value(name),
      number: Value(number),
    );
  }

  factory Section.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Section(
      id: serializer.fromJson<int>(json['id']),
      course: serializer.fromJson<int>(json['course']),
      name: serializer.fromJson<String>(json['name']),
      number: serializer.fromJson<int>(json['number']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'course': serializer.toJson<int>(course),
      'name': serializer.toJson<String>(name),
      'number': serializer.toJson<int>(number),
    };
  }

  Section copyWith({int? id, int? course, String? name, int? number}) =>
      Section(
        id: id ?? this.id,
        course: course ?? this.course,
        name: name ?? this.name,
        number: number ?? this.number,
      );
  Section copyWithCompanion(SectionsCompanion data) {
    return Section(
      id: data.id.present ? data.id.value : this.id,
      course: data.course.present ? data.course.value : this.course,
      name: data.name.present ? data.name.value : this.name,
      number: data.number.present ? data.number.value : this.number,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Section(')
          ..write('id: $id, ')
          ..write('course: $course, ')
          ..write('name: $name, ')
          ..write('number: $number')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, course, name, number);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Section &&
          other.id == this.id &&
          other.course == this.course &&
          other.name == this.name &&
          other.number == this.number);
}

class SectionsCompanion extends UpdateCompanion<Section> {
  final Value<int> id;
  final Value<int> course;
  final Value<String> name;
  final Value<int> number;
  const SectionsCompanion({
    this.id = const Value.absent(),
    this.course = const Value.absent(),
    this.name = const Value.absent(),
    this.number = const Value.absent(),
  });
  SectionsCompanion.insert({
    this.id = const Value.absent(),
    required int course,
    required String name,
    required int number,
  })  : course = Value(course),
        name = Value(name),
        number = Value(number);
  static Insertable<Section> custom({
    Expression<int>? id,
    Expression<int>? course,
    Expression<String>? name,
    Expression<int>? number,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (course != null) 'course': course,
      if (name != null) 'name': name,
      if (number != null) 'number': number,
    });
  }

  SectionsCompanion copyWith(
      {Value<int>? id,
      Value<int>? course,
      Value<String>? name,
      Value<int>? number}) {
    return SectionsCompanion(
      id: id ?? this.id,
      course: course ?? this.course,
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
    if (course.present) {
      map['course'] = Variable<int>(course.value);
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
          ..write('course: $course, ')
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
  static const VerificationMeta _translationMeta =
      const VerificationMeta('translation');
  @override
  late final GeneratedColumn<String> translation = GeneratedColumn<String>(
      'translation', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
      'value', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _specifierMeta =
      const VerificationMeta('specifier');
  @override
  late final GeneratedColumn<String> specifier = GeneratedColumn<String>(
      'specifier', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
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
        translation,
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
  static const String $name = 'words';
  @override
  VerificationContext validateIntegrity(Insertable<Word> instance,
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
    if (data.containsKey('specifier')) {
      context.handle(_specifierMeta,
          specifier.isAcceptableOrUnknown(data['specifier']!, _specifierMeta));
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
  Word map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Word(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      section: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}section'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!,
      translation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}translation'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value'])!,
      specifier: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}specifier']),
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
  $WordsTable createAlias(String alias) {
    return $WordsTable(attachedDatabase, alias);
  }
}

class Word extends DataClass implements Insertable<Word> {
  final int id;
  final int section;
  final int type;
  final String translation;
  final String value;
  final String? specifier;
  final DateTime createdAt;
  final DateTime? lastCorrect;
  final DateTime? lastWrong;
  final int correctCount;
  final int wrongCount;
  const Word(
      {required this.id,
      required this.section,
      required this.type,
      required this.translation,
      required this.value,
      this.specifier,
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
    map['translation'] = Variable<String>(translation);
    map['value'] = Variable<String>(value);
    if (!nullToAbsent || specifier != null) {
      map['specifier'] = Variable<String>(specifier);
    }
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

  WordsCompanion toCompanion(bool nullToAbsent) {
    return WordsCompanion(
      id: Value(id),
      section: Value(section),
      type: Value(type),
      translation: Value(translation),
      value: Value(value),
      specifier: specifier == null && nullToAbsent
          ? const Value.absent()
          : Value(specifier),
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

  factory Word.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Word(
      id: serializer.fromJson<int>(json['id']),
      section: serializer.fromJson<int>(json['section']),
      type: serializer.fromJson<int>(json['type']),
      translation: serializer.fromJson<String>(json['translation']),
      value: serializer.fromJson<String>(json['value']),
      specifier: serializer.fromJson<String?>(json['specifier']),
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
      'translation': serializer.toJson<String>(translation),
      'value': serializer.toJson<String>(value),
      'specifier': serializer.toJson<String?>(specifier),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'lastCorrect': serializer.toJson<DateTime?>(lastCorrect),
      'lastWrong': serializer.toJson<DateTime?>(lastWrong),
      'correctCount': serializer.toJson<int>(correctCount),
      'wrongCount': serializer.toJson<int>(wrongCount),
    };
  }

  Word copyWith(
          {int? id,
          int? section,
          int? type,
          String? translation,
          String? value,
          Value<String?> specifier = const Value.absent(),
          DateTime? createdAt,
          Value<DateTime?> lastCorrect = const Value.absent(),
          Value<DateTime?> lastWrong = const Value.absent(),
          int? correctCount,
          int? wrongCount}) =>
      Word(
        id: id ?? this.id,
        section: section ?? this.section,
        type: type ?? this.type,
        translation: translation ?? this.translation,
        value: value ?? this.value,
        specifier: specifier.present ? specifier.value : this.specifier,
        createdAt: createdAt ?? this.createdAt,
        lastCorrect: lastCorrect.present ? lastCorrect.value : this.lastCorrect,
        lastWrong: lastWrong.present ? lastWrong.value : this.lastWrong,
        correctCount: correctCount ?? this.correctCount,
        wrongCount: wrongCount ?? this.wrongCount,
      );
  Word copyWithCompanion(WordsCompanion data) {
    return Word(
      id: data.id.present ? data.id.value : this.id,
      section: data.section.present ? data.section.value : this.section,
      type: data.type.present ? data.type.value : this.type,
      translation:
          data.translation.present ? data.translation.value : this.translation,
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
    return (StringBuffer('Word(')
          ..write('id: $id, ')
          ..write('section: $section, ')
          ..write('type: $type, ')
          ..write('translation: $translation, ')
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
  int get hashCode => Object.hash(id, section, type, translation, value,
      specifier, createdAt, lastCorrect, lastWrong, correctCount, wrongCount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Word &&
          other.id == this.id &&
          other.section == this.section &&
          other.type == this.type &&
          other.translation == this.translation &&
          other.value == this.value &&
          other.specifier == this.specifier &&
          other.createdAt == this.createdAt &&
          other.lastCorrect == this.lastCorrect &&
          other.lastWrong == this.lastWrong &&
          other.correctCount == this.correctCount &&
          other.wrongCount == this.wrongCount);
}

class WordsCompanion extends UpdateCompanion<Word> {
  final Value<int> id;
  final Value<int> section;
  final Value<int> type;
  final Value<String> translation;
  final Value<String> value;
  final Value<String?> specifier;
  final Value<DateTime> createdAt;
  final Value<DateTime?> lastCorrect;
  final Value<DateTime?> lastWrong;
  final Value<int> correctCount;
  final Value<int> wrongCount;
  const WordsCompanion({
    this.id = const Value.absent(),
    this.section = const Value.absent(),
    this.type = const Value.absent(),
    this.translation = const Value.absent(),
    this.value = const Value.absent(),
    this.specifier = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastCorrect = const Value.absent(),
    this.lastWrong = const Value.absent(),
    this.correctCount = const Value.absent(),
    this.wrongCount = const Value.absent(),
  });
  WordsCompanion.insert({
    this.id = const Value.absent(),
    required int section,
    required int type,
    required String translation,
    required String value,
    this.specifier = const Value.absent(),
    required DateTime createdAt,
    this.lastCorrect = const Value.absent(),
    this.lastWrong = const Value.absent(),
    this.correctCount = const Value.absent(),
    this.wrongCount = const Value.absent(),
  })  : section = Value(section),
        type = Value(type),
        translation = Value(translation),
        value = Value(value),
        createdAt = Value(createdAt);
  static Insertable<Word> custom({
    Expression<int>? id,
    Expression<int>? section,
    Expression<int>? type,
    Expression<String>? translation,
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
      if (translation != null) 'translation': translation,
      if (value != null) 'value': value,
      if (specifier != null) 'specifier': specifier,
      if (createdAt != null) 'created_at': createdAt,
      if (lastCorrect != null) 'last_correct': lastCorrect,
      if (lastWrong != null) 'last_wrong': lastWrong,
      if (correctCount != null) 'correct_count': correctCount,
      if (wrongCount != null) 'wrong_count': wrongCount,
    });
  }

  WordsCompanion copyWith(
      {Value<int>? id,
      Value<int>? section,
      Value<int>? type,
      Value<String>? translation,
      Value<String>? value,
      Value<String?>? specifier,
      Value<DateTime>? createdAt,
      Value<DateTime?>? lastCorrect,
      Value<DateTime?>? lastWrong,
      Value<int>? correctCount,
      Value<int>? wrongCount}) {
    return WordsCompanion(
      id: id ?? this.id,
      section: section ?? this.section,
      type: type ?? this.type,
      translation: translation ?? this.translation,
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
    if (translation.present) {
      map['translation'] = Variable<String>(translation.value);
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
    return (StringBuffer('WordsCompanion(')
          ..write('id: $id, ')
          ..write('section: $section, ')
          ..write('type: $type, ')
          ..write('translation: $translation, ')
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

class $VerbExtrasTable extends VerbExtras
    with TableInfo<$VerbExtrasTable, VerbExtra> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VerbExtrasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _wordMeta = const VerificationMeta('word');
  @override
  late final GeneratedColumn<int> word = GeneratedColumn<int>(
      'word', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES words (id)'));
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
  List<GeneratedColumn> get $columns => [id, word, value, position, pronoun];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'verb_extras';
  @override
  VerificationContext validateIntegrity(Insertable<VerbExtra> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('word')) {
      context.handle(
          _wordMeta, word.isAcceptableOrUnknown(data['word']!, _wordMeta));
    } else if (isInserting) {
      context.missing(_wordMeta);
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
  VerbExtra map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VerbExtra(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      word: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}word'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value'])!,
      position: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}position'])!,
      pronoun: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}pronoun'])!,
    );
  }

  @override
  $VerbExtrasTable createAlias(String alias) {
    return $VerbExtrasTable(attachedDatabase, alias);
  }
}

class VerbExtra extends DataClass implements Insertable<VerbExtra> {
  final int id;
  final int word;
  final String value;
  final int position;
  final int pronoun;
  const VerbExtra(
      {required this.id,
      required this.word,
      required this.value,
      required this.position,
      required this.pronoun});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['word'] = Variable<int>(word);
    map['value'] = Variable<String>(value);
    map['position'] = Variable<int>(position);
    map['pronoun'] = Variable<int>(pronoun);
    return map;
  }

  VerbExtrasCompanion toCompanion(bool nullToAbsent) {
    return VerbExtrasCompanion(
      id: Value(id),
      word: Value(word),
      value: Value(value),
      position: Value(position),
      pronoun: Value(pronoun),
    );
  }

  factory VerbExtra.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VerbExtra(
      id: serializer.fromJson<int>(json['id']),
      word: serializer.fromJson<int>(json['word']),
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
      'word': serializer.toJson<int>(word),
      'value': serializer.toJson<String>(value),
      'position': serializer.toJson<int>(position),
      'pronoun': serializer.toJson<int>(pronoun),
    };
  }

  VerbExtra copyWith(
          {int? id, int? word, String? value, int? position, int? pronoun}) =>
      VerbExtra(
        id: id ?? this.id,
        word: word ?? this.word,
        value: value ?? this.value,
        position: position ?? this.position,
        pronoun: pronoun ?? this.pronoun,
      );
  VerbExtra copyWithCompanion(VerbExtrasCompanion data) {
    return VerbExtra(
      id: data.id.present ? data.id.value : this.id,
      word: data.word.present ? data.word.value : this.word,
      value: data.value.present ? data.value.value : this.value,
      position: data.position.present ? data.position.value : this.position,
      pronoun: data.pronoun.present ? data.pronoun.value : this.pronoun,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VerbExtra(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('value: $value, ')
          ..write('position: $position, ')
          ..write('pronoun: $pronoun')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, word, value, position, pronoun);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VerbExtra &&
          other.id == this.id &&
          other.word == this.word &&
          other.value == this.value &&
          other.position == this.position &&
          other.pronoun == this.pronoun);
}

class VerbExtrasCompanion extends UpdateCompanion<VerbExtra> {
  final Value<int> id;
  final Value<int> word;
  final Value<String> value;
  final Value<int> position;
  final Value<int> pronoun;
  const VerbExtrasCompanion({
    this.id = const Value.absent(),
    this.word = const Value.absent(),
    this.value = const Value.absent(),
    this.position = const Value.absent(),
    this.pronoun = const Value.absent(),
  });
  VerbExtrasCompanion.insert({
    this.id = const Value.absent(),
    required int word,
    required String value,
    required int position,
    required int pronoun,
  })  : word = Value(word),
        value = Value(value),
        position = Value(position),
        pronoun = Value(pronoun);
  static Insertable<VerbExtra> custom({
    Expression<int>? id,
    Expression<int>? word,
    Expression<String>? value,
    Expression<int>? position,
    Expression<int>? pronoun,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (word != null) 'word': word,
      if (value != null) 'value': value,
      if (position != null) 'position': position,
      if (pronoun != null) 'pronoun': pronoun,
    });
  }

  VerbExtrasCompanion copyWith(
      {Value<int>? id,
      Value<int>? word,
      Value<String>? value,
      Value<int>? position,
      Value<int>? pronoun}) {
    return VerbExtrasCompanion(
      id: id ?? this.id,
      word: word ?? this.word,
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
    if (word.present) {
      map['word'] = Variable<int>(word.value);
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
    return (StringBuffer('VerbExtrasCompanion(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('value: $value, ')
          ..write('position: $position, ')
          ..write('pronoun: $pronoun')
          ..write(')'))
        .toString();
  }
}

class $GendersTable extends Genders with TableInfo<$GendersTable, Gender> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GendersTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _shortMeta = const VerificationMeta('short');
  @override
  late final GeneratedColumn<String> short = GeneratedColumn<String>(
      'short', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, short];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'genders';
  @override
  VerificationContext validateIntegrity(Insertable<Gender> instance,
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
    if (data.containsKey('short')) {
      context.handle(
          _shortMeta, short.isAcceptableOrUnknown(data['short']!, _shortMeta));
    } else if (isInserting) {
      context.missing(_shortMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Gender map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Gender(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      short: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}short'])!,
    );
  }

  @override
  $GendersTable createAlias(String alias) {
    return $GendersTable(attachedDatabase, alias);
  }
}

class Gender extends DataClass implements Insertable<Gender> {
  final int id;
  final String name;
  final String short;
  const Gender({required this.id, required this.name, required this.short});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['short'] = Variable<String>(short);
    return map;
  }

  GendersCompanion toCompanion(bool nullToAbsent) {
    return GendersCompanion(
      id: Value(id),
      name: Value(name),
      short: Value(short),
    );
  }

  factory Gender.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Gender(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      short: serializer.fromJson<String>(json['short']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'short': serializer.toJson<String>(short),
    };
  }

  Gender copyWith({int? id, String? name, String? short}) => Gender(
        id: id ?? this.id,
        name: name ?? this.name,
        short: short ?? this.short,
      );
  Gender copyWithCompanion(GendersCompanion data) {
    return Gender(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      short: data.short.present ? data.short.value : this.short,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Gender(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('short: $short')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, short);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Gender &&
          other.id == this.id &&
          other.name == this.name &&
          other.short == this.short);
}

class GendersCompanion extends UpdateCompanion<Gender> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> short;
  const GendersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.short = const Value.absent(),
  });
  GendersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String short,
  })  : name = Value(name),
        short = Value(short);
  static Insertable<Gender> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? short,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (short != null) 'short': short,
    });
  }

  GendersCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<String>? short}) {
    return GendersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      short: short ?? this.short,
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
    if (short.present) {
      map['short'] = Variable<String>(short.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GendersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('short: $short')
          ..write(')'))
        .toString();
  }
}

class $NounExtrasTable extends NounExtras
    with TableInfo<$NounExtrasTable, NounExtra> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NounExtrasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _wordMeta = const VerificationMeta('word');
  @override
  late final GeneratedColumn<int> word = GeneratedColumn<int>(
      'word', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES words (id)'));
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<int> gender = GeneratedColumn<int>(
      'gender', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES genders (id)'));
  static const VerificationMeta _pluralMeta = const VerificationMeta('plural');
  @override
  late final GeneratedColumn<String> plural = GeneratedColumn<String>(
      'plural', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, word, gender, plural];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'noun_extras';
  @override
  VerificationContext validateIntegrity(Insertable<NounExtra> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('word')) {
      context.handle(
          _wordMeta, word.isAcceptableOrUnknown(data['word']!, _wordMeta));
    } else if (isInserting) {
      context.missing(_wordMeta);
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
  NounExtra map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NounExtra(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      word: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}word'])!,
      gender: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}gender'])!,
      plural: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}plural']),
    );
  }

  @override
  $NounExtrasTable createAlias(String alias) {
    return $NounExtrasTable(attachedDatabase, alias);
  }
}

class NounExtra extends DataClass implements Insertable<NounExtra> {
  final int id;
  final int word;
  final int gender;
  final String? plural;
  const NounExtra(
      {required this.id,
      required this.word,
      required this.gender,
      this.plural});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['word'] = Variable<int>(word);
    map['gender'] = Variable<int>(gender);
    if (!nullToAbsent || plural != null) {
      map['plural'] = Variable<String>(plural);
    }
    return map;
  }

  NounExtrasCompanion toCompanion(bool nullToAbsent) {
    return NounExtrasCompanion(
      id: Value(id),
      word: Value(word),
      gender: Value(gender),
      plural:
          plural == null && nullToAbsent ? const Value.absent() : Value(plural),
    );
  }

  factory NounExtra.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NounExtra(
      id: serializer.fromJson<int>(json['id']),
      word: serializer.fromJson<int>(json['word']),
      gender: serializer.fromJson<int>(json['gender']),
      plural: serializer.fromJson<String?>(json['plural']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'word': serializer.toJson<int>(word),
      'gender': serializer.toJson<int>(gender),
      'plural': serializer.toJson<String?>(plural),
    };
  }

  NounExtra copyWith(
          {int? id,
          int? word,
          int? gender,
          Value<String?> plural = const Value.absent()}) =>
      NounExtra(
        id: id ?? this.id,
        word: word ?? this.word,
        gender: gender ?? this.gender,
        plural: plural.present ? plural.value : this.plural,
      );
  NounExtra copyWithCompanion(NounExtrasCompanion data) {
    return NounExtra(
      id: data.id.present ? data.id.value : this.id,
      word: data.word.present ? data.word.value : this.word,
      gender: data.gender.present ? data.gender.value : this.gender,
      plural: data.plural.present ? data.plural.value : this.plural,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NounExtra(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('gender: $gender, ')
          ..write('plural: $plural')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, word, gender, plural);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NounExtra &&
          other.id == this.id &&
          other.word == this.word &&
          other.gender == this.gender &&
          other.plural == this.plural);
}

class NounExtrasCompanion extends UpdateCompanion<NounExtra> {
  final Value<int> id;
  final Value<int> word;
  final Value<int> gender;
  final Value<String?> plural;
  const NounExtrasCompanion({
    this.id = const Value.absent(),
    this.word = const Value.absent(),
    this.gender = const Value.absent(),
    this.plural = const Value.absent(),
  });
  NounExtrasCompanion.insert({
    this.id = const Value.absent(),
    required int word,
    required int gender,
    this.plural = const Value.absent(),
  })  : word = Value(word),
        gender = Value(gender);
  static Insertable<NounExtra> custom({
    Expression<int>? id,
    Expression<int>? word,
    Expression<int>? gender,
    Expression<String>? plural,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (word != null) 'word': word,
      if (gender != null) 'gender': gender,
      if (plural != null) 'plural': plural,
    });
  }

  NounExtrasCompanion copyWith(
      {Value<int>? id,
      Value<int>? word,
      Value<int>? gender,
      Value<String?>? plural}) {
    return NounExtrasCompanion(
      id: id ?? this.id,
      word: word ?? this.word,
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
    if (word.present) {
      map['word'] = Variable<int>(word.value);
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
    return (StringBuffer('NounExtrasCompanion(')
          ..write('id: $id, ')
          ..write('word: $word, ')
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
  late final $WordsTable words = $WordsTable(this);
  late final $PronounsTable pronouns = $PronounsTable(this);
  late final $VerbExtrasTable verbExtras = $VerbExtrasTable(this);
  late final $GendersTable genders = $GendersTable(this);
  late final $NounExtrasTable nounExtras = $NounExtrasTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        courses,
        sections,
        wordTypes,
        words,
        pronouns,
        verbExtras,
        genders,
        nounExtras
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

final class $$CoursesTableReferences
    extends BaseReferences<_$AppDatabase, $CoursesTable, Course> {
  $$CoursesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$SectionsTable, List<Section>> _sectionsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.sections,
          aliasName: $_aliasNameGenerator(db.courses.id, db.sections.course));

  $$SectionsTableProcessedTableManager get sectionsRefs {
    final manager = $$SectionsTableTableManager($_db, $_db.sections)
        .filter((f) => f.course.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_sectionsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

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

  Expression<bool> sectionsRefs(
      Expression<bool> Function($$SectionsTableFilterComposer f) f) {
    final $$SectionsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.sections,
        getReferencedColumn: (t) => t.course,
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
    return f(composer);
  }
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

  Expression<T> sectionsRefs<T extends Object>(
      Expression<T> Function($$SectionsTableAnnotationComposer a) f) {
    final $$SectionsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.sections,
        getReferencedColumn: (t) => t.course,
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
    return f(composer);
  }
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
    (Course, $$CoursesTableReferences),
    Course,
    PrefetchHooks Function({bool sectionsRefs})> {
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
              .map((e) =>
                  (e.readTable(table), $$CoursesTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({sectionsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (sectionsRefs) db.sections],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (sectionsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$CoursesTableReferences._sectionsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CoursesTableReferences(db, table, p0)
                                .sectionsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.course == item.id),
                        typedResults: items)
                ];
              },
            );
          },
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
    (Course, $$CoursesTableReferences),
    Course,
    PrefetchHooks Function({bool sectionsRefs})>;
typedef $$SectionsTableCreateCompanionBuilder = SectionsCompanion Function({
  Value<int> id,
  required int course,
  required String name,
  required int number,
});
typedef $$SectionsTableUpdateCompanionBuilder = SectionsCompanion Function({
  Value<int> id,
  Value<int> course,
  Value<String> name,
  Value<int> number,
});

final class $$SectionsTableReferences
    extends BaseReferences<_$AppDatabase, $SectionsTable, Section> {
  $$SectionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CoursesTable _courseTable(_$AppDatabase db) => db.courses
      .createAlias($_aliasNameGenerator(db.sections.course, db.courses.id));

  $$CoursesTableProcessedTableManager get course {
    final $_column = $_itemColumn<int>('course')!;

    final manager = $$CoursesTableTableManager($_db, $_db.courses)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_courseTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$WordsTable, List<Word>> _wordsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.words,
          aliasName: $_aliasNameGenerator(db.sections.id, db.words.section));

  $$WordsTableProcessedTableManager get wordsRefs {
    final manager = $$WordsTableTableManager($_db, $_db.words)
        .filter((f) => f.section.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_wordsRefsTable($_db));
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

  $$CoursesTableFilterComposer get course {
    final $$CoursesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.course,
        referencedTable: $db.courses,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CoursesTableFilterComposer(
              $db: $db,
              $table: $db.courses,
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
        getReferencedColumn: (t) => t.section,
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

  $$CoursesTableOrderingComposer get course {
    final $$CoursesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.course,
        referencedTable: $db.courses,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CoursesTableOrderingComposer(
              $db: $db,
              $table: $db.courses,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
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

  $$CoursesTableAnnotationComposer get course {
    final $$CoursesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.course,
        referencedTable: $db.courses,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CoursesTableAnnotationComposer(
              $db: $db,
              $table: $db.courses,
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
        getReferencedColumn: (t) => t.section,
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
    PrefetchHooks Function({bool course, bool wordsRefs})> {
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
            Value<int> course = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> number = const Value.absent(),
          }) =>
              SectionsCompanion(
            id: id,
            course: course,
            name: name,
            number: number,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int course,
            required String name,
            required int number,
          }) =>
              SectionsCompanion.insert(
            id: id,
            course: course,
            name: name,
            number: number,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$SectionsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({course = false, wordsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (wordsRefs) db.words],
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
                if (course) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.course,
                    referencedTable: $$SectionsTableReferences._courseTable(db),
                    referencedColumn:
                        $$SectionsTableReferences._courseTable(db).id,
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
                            $$SectionsTableReferences._wordsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$SectionsTableReferences(db, table, p0).wordsRefs,
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
    PrefetchHooks Function({bool course, bool wordsRefs})>;
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

  static MultiTypedResultKey<$WordsTable, List<Word>> _wordsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.words,
          aliasName: $_aliasNameGenerator(db.wordTypes.id, db.words.type));

  $$WordsTableProcessedTableManager get wordsRefs {
    final manager = $$WordsTableTableManager($_db, $_db.words)
        .filter((f) => f.type.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_wordsRefsTable($_db));
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

  Expression<bool> wordsRefs(
      Expression<bool> Function($$WordsTableFilterComposer f) f) {
    final $$WordsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.words,
        getReferencedColumn: (t) => t.type,
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

  Expression<T> wordsRefs<T extends Object>(
      Expression<T> Function($$WordsTableAnnotationComposer a) f) {
    final $$WordsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.words,
        getReferencedColumn: (t) => t.type,
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
    PrefetchHooks Function({bool wordsRefs})> {
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
          prefetchHooksCallback: ({wordsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (wordsRefs) db.words],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (wordsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$WordTypesTableReferences._wordsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$WordTypesTableReferences(db, table, p0).wordsRefs,
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
    PrefetchHooks Function({bool wordsRefs})>;
typedef $$WordsTableCreateCompanionBuilder = WordsCompanion Function({
  Value<int> id,
  required int section,
  required int type,
  required String translation,
  required String value,
  Value<String?> specifier,
  required DateTime createdAt,
  Value<DateTime?> lastCorrect,
  Value<DateTime?> lastWrong,
  Value<int> correctCount,
  Value<int> wrongCount,
});
typedef $$WordsTableUpdateCompanionBuilder = WordsCompanion Function({
  Value<int> id,
  Value<int> section,
  Value<int> type,
  Value<String> translation,
  Value<String> value,
  Value<String?> specifier,
  Value<DateTime> createdAt,
  Value<DateTime?> lastCorrect,
  Value<DateTime?> lastWrong,
  Value<int> correctCount,
  Value<int> wrongCount,
});

final class $$WordsTableReferences
    extends BaseReferences<_$AppDatabase, $WordsTable, Word> {
  $$WordsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SectionsTable _sectionTable(_$AppDatabase db) => db.sections
      .createAlias($_aliasNameGenerator(db.words.section, db.sections.id));

  $$SectionsTableProcessedTableManager get section {
    final $_column = $_itemColumn<int>('section')!;

    final manager = $$SectionsTableTableManager($_db, $_db.sections)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sectionTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $WordTypesTable _typeTable(_$AppDatabase db) => db.wordTypes
      .createAlias($_aliasNameGenerator(db.words.type, db.wordTypes.id));

  $$WordTypesTableProcessedTableManager get type {
    final $_column = $_itemColumn<int>('type')!;

    final manager = $$WordTypesTableTableManager($_db, $_db.wordTypes)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_typeTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$VerbExtrasTable, List<VerbExtra>>
      _verbExtrasRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.verbExtras,
              aliasName: $_aliasNameGenerator(db.words.id, db.verbExtras.word));

  $$VerbExtrasTableProcessedTableManager get verbExtrasRefs {
    final manager = $$VerbExtrasTableTableManager($_db, $_db.verbExtras)
        .filter((f) => f.word.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_verbExtrasRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$NounExtrasTable, List<NounExtra>>
      _nounExtrasRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.nounExtras,
              aliasName: $_aliasNameGenerator(db.words.id, db.nounExtras.word));

  $$NounExtrasTableProcessedTableManager get nounExtrasRefs {
    final manager = $$NounExtrasTableTableManager($_db, $_db.nounExtras)
        .filter((f) => f.word.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_nounExtrasRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
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

  ColumnFilters<String> get translation => $composableBuilder(
      column: $table.translation, builder: (column) => ColumnFilters(column));

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

  Expression<bool> verbExtrasRefs(
      Expression<bool> Function($$VerbExtrasTableFilterComposer f) f) {
    final $$VerbExtrasTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.verbExtras,
        getReferencedColumn: (t) => t.word,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VerbExtrasTableFilterComposer(
              $db: $db,
              $table: $db.verbExtras,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> nounExtrasRefs(
      Expression<bool> Function($$NounExtrasTableFilterComposer f) f) {
    final $$NounExtrasTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.nounExtras,
        getReferencedColumn: (t) => t.word,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$NounExtrasTableFilterComposer(
              $db: $db,
              $table: $db.nounExtras,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
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

  ColumnOrderings<String> get translation => $composableBuilder(
      column: $table.translation, builder: (column) => ColumnOrderings(column));

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

  GeneratedColumn<String> get translation => $composableBuilder(
      column: $table.translation, builder: (column) => column);

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

  Expression<T> verbExtrasRefs<T extends Object>(
      Expression<T> Function($$VerbExtrasTableAnnotationComposer a) f) {
    final $$VerbExtrasTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.verbExtras,
        getReferencedColumn: (t) => t.word,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VerbExtrasTableAnnotationComposer(
              $db: $db,
              $table: $db.verbExtras,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> nounExtrasRefs<T extends Object>(
      Expression<T> Function($$NounExtrasTableAnnotationComposer a) f) {
    final $$NounExtrasTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.nounExtras,
        getReferencedColumn: (t) => t.word,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$NounExtrasTableAnnotationComposer(
              $db: $db,
              $table: $db.nounExtras,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
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
    PrefetchHooks Function(
        {bool section, bool type, bool verbExtrasRefs, bool nounExtrasRefs})> {
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
            Value<int> section = const Value.absent(),
            Value<int> type = const Value.absent(),
            Value<String> translation = const Value.absent(),
            Value<String> value = const Value.absent(),
            Value<String?> specifier = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> lastCorrect = const Value.absent(),
            Value<DateTime?> lastWrong = const Value.absent(),
            Value<int> correctCount = const Value.absent(),
            Value<int> wrongCount = const Value.absent(),
          }) =>
              WordsCompanion(
            id: id,
            section: section,
            type: type,
            translation: translation,
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
            required String translation,
            required String value,
            Value<String?> specifier = const Value.absent(),
            required DateTime createdAt,
            Value<DateTime?> lastCorrect = const Value.absent(),
            Value<DateTime?> lastWrong = const Value.absent(),
            Value<int> correctCount = const Value.absent(),
            Value<int> wrongCount = const Value.absent(),
          }) =>
              WordsCompanion.insert(
            id: id,
            section: section,
            type: type,
            translation: translation,
            value: value,
            specifier: specifier,
            createdAt: createdAt,
            lastCorrect: lastCorrect,
            lastWrong: lastWrong,
            correctCount: correctCount,
            wrongCount: wrongCount,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$WordsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {section = false,
              type = false,
              verbExtrasRefs = false,
              nounExtrasRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (verbExtrasRefs) db.verbExtras,
                if (nounExtrasRefs) db.nounExtras
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
                    referencedTable: $$WordsTableReferences._sectionTable(db),
                    referencedColumn:
                        $$WordsTableReferences._sectionTable(db).id,
                  ) as T;
                }
                if (type) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.type,
                    referencedTable: $$WordsTableReferences._typeTable(db),
                    referencedColumn: $$WordsTableReferences._typeTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (verbExtrasRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$WordsTableReferences._verbExtrasRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$WordsTableReferences(db, table, p0)
                                .verbExtrasRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) =>
                                referencedItems.where((e) => e.word == item.id),
                        typedResults: items),
                  if (nounExtrasRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$WordsTableReferences._nounExtrasRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$WordsTableReferences(db, table, p0)
                                .nounExtrasRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) =>
                                referencedItems.where((e) => e.word == item.id),
                        typedResults: items)
                ];
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
    PrefetchHooks Function(
        {bool section, bool type, bool verbExtrasRefs, bool nounExtrasRefs})>;
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

  static MultiTypedResultKey<$VerbExtrasTable, List<VerbExtra>>
      _verbExtrasRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.verbExtras,
              aliasName:
                  $_aliasNameGenerator(db.pronouns.id, db.verbExtras.pronoun));

  $$VerbExtrasTableProcessedTableManager get verbExtrasRefs {
    final manager = $$VerbExtrasTableTableManager($_db, $_db.verbExtras)
        .filter((f) => f.pronoun.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_verbExtrasRefsTable($_db));
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

  Expression<bool> verbExtrasRefs(
      Expression<bool> Function($$VerbExtrasTableFilterComposer f) f) {
    final $$VerbExtrasTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.verbExtras,
        getReferencedColumn: (t) => t.pronoun,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VerbExtrasTableFilterComposer(
              $db: $db,
              $table: $db.verbExtras,
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

  Expression<T> verbExtrasRefs<T extends Object>(
      Expression<T> Function($$VerbExtrasTableAnnotationComposer a) f) {
    final $$VerbExtrasTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.verbExtras,
        getReferencedColumn: (t) => t.pronoun,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VerbExtrasTableAnnotationComposer(
              $db: $db,
              $table: $db.verbExtras,
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
    PrefetchHooks Function({bool verbExtrasRefs})> {
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
          prefetchHooksCallback: ({verbExtrasRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (verbExtrasRefs) db.verbExtras],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (verbExtrasRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$PronounsTableReferences._verbExtrasRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PronounsTableReferences(db, table, p0)
                                .verbExtrasRefs,
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
    PrefetchHooks Function({bool verbExtrasRefs})>;
typedef $$VerbExtrasTableCreateCompanionBuilder = VerbExtrasCompanion Function({
  Value<int> id,
  required int word,
  required String value,
  required int position,
  required int pronoun,
});
typedef $$VerbExtrasTableUpdateCompanionBuilder = VerbExtrasCompanion Function({
  Value<int> id,
  Value<int> word,
  Value<String> value,
  Value<int> position,
  Value<int> pronoun,
});

final class $$VerbExtrasTableReferences
    extends BaseReferences<_$AppDatabase, $VerbExtrasTable, VerbExtra> {
  $$VerbExtrasTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $WordsTable _wordTable(_$AppDatabase db) => db.words
      .createAlias($_aliasNameGenerator(db.verbExtras.word, db.words.id));

  $$WordsTableProcessedTableManager get word {
    final $_column = $_itemColumn<int>('word')!;

    final manager = $$WordsTableTableManager($_db, $_db.words)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_wordTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $PronounsTable _pronounTable(_$AppDatabase db) => db.pronouns
      .createAlias($_aliasNameGenerator(db.verbExtras.pronoun, db.pronouns.id));

  $$PronounsTableProcessedTableManager get pronoun {
    final $_column = $_itemColumn<int>('pronoun')!;

    final manager = $$PronounsTableTableManager($_db, $_db.pronouns)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_pronounTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$VerbExtrasTableFilterComposer
    extends Composer<_$AppDatabase, $VerbExtrasTable> {
  $$VerbExtrasTableFilterComposer({
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

  $$WordsTableFilterComposer get word {
    final $$WordsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.word,
        referencedTable: $db.words,
        getReferencedColumn: (t) => t.id,
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

class $$VerbExtrasTableOrderingComposer
    extends Composer<_$AppDatabase, $VerbExtrasTable> {
  $$VerbExtrasTableOrderingComposer({
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

  $$WordsTableOrderingComposer get word {
    final $$WordsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.word,
        referencedTable: $db.words,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WordsTableOrderingComposer(
              $db: $db,
              $table: $db.words,
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

class $$VerbExtrasTableAnnotationComposer
    extends Composer<_$AppDatabase, $VerbExtrasTable> {
  $$VerbExtrasTableAnnotationComposer({
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

  $$WordsTableAnnotationComposer get word {
    final $$WordsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.word,
        referencedTable: $db.words,
        getReferencedColumn: (t) => t.id,
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

class $$VerbExtrasTableTableManager extends RootTableManager<
    _$AppDatabase,
    $VerbExtrasTable,
    VerbExtra,
    $$VerbExtrasTableFilterComposer,
    $$VerbExtrasTableOrderingComposer,
    $$VerbExtrasTableAnnotationComposer,
    $$VerbExtrasTableCreateCompanionBuilder,
    $$VerbExtrasTableUpdateCompanionBuilder,
    (VerbExtra, $$VerbExtrasTableReferences),
    VerbExtra,
    PrefetchHooks Function({bool word, bool pronoun})> {
  $$VerbExtrasTableTableManager(_$AppDatabase db, $VerbExtrasTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VerbExtrasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VerbExtrasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VerbExtrasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> word = const Value.absent(),
            Value<String> value = const Value.absent(),
            Value<int> position = const Value.absent(),
            Value<int> pronoun = const Value.absent(),
          }) =>
              VerbExtrasCompanion(
            id: id,
            word: word,
            value: value,
            position: position,
            pronoun: pronoun,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int word,
            required String value,
            required int position,
            required int pronoun,
          }) =>
              VerbExtrasCompanion.insert(
            id: id,
            word: word,
            value: value,
            position: position,
            pronoun: pronoun,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$VerbExtrasTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({word = false, pronoun = false}) {
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
                if (word) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.word,
                    referencedTable: $$VerbExtrasTableReferences._wordTable(db),
                    referencedColumn:
                        $$VerbExtrasTableReferences._wordTable(db).id,
                  ) as T;
                }
                if (pronoun) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.pronoun,
                    referencedTable:
                        $$VerbExtrasTableReferences._pronounTable(db),
                    referencedColumn:
                        $$VerbExtrasTableReferences._pronounTable(db).id,
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

typedef $$VerbExtrasTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $VerbExtrasTable,
    VerbExtra,
    $$VerbExtrasTableFilterComposer,
    $$VerbExtrasTableOrderingComposer,
    $$VerbExtrasTableAnnotationComposer,
    $$VerbExtrasTableCreateCompanionBuilder,
    $$VerbExtrasTableUpdateCompanionBuilder,
    (VerbExtra, $$VerbExtrasTableReferences),
    VerbExtra,
    PrefetchHooks Function({bool word, bool pronoun})>;
typedef $$GendersTableCreateCompanionBuilder = GendersCompanion Function({
  Value<int> id,
  required String name,
  required String short,
});
typedef $$GendersTableUpdateCompanionBuilder = GendersCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> short,
});

final class $$GendersTableReferences
    extends BaseReferences<_$AppDatabase, $GendersTable, Gender> {
  $$GendersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$NounExtrasTable, List<NounExtra>>
      _nounExtrasRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.nounExtras,
          aliasName: $_aliasNameGenerator(db.genders.id, db.nounExtras.gender));

  $$NounExtrasTableProcessedTableManager get nounExtrasRefs {
    final manager = $$NounExtrasTableTableManager($_db, $_db.nounExtras)
        .filter((f) => f.gender.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_nounExtrasRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$GendersTableFilterComposer
    extends Composer<_$AppDatabase, $GendersTable> {
  $$GendersTableFilterComposer({
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

  ColumnFilters<String> get short => $composableBuilder(
      column: $table.short, builder: (column) => ColumnFilters(column));

  Expression<bool> nounExtrasRefs(
      Expression<bool> Function($$NounExtrasTableFilterComposer f) f) {
    final $$NounExtrasTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.nounExtras,
        getReferencedColumn: (t) => t.gender,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$NounExtrasTableFilterComposer(
              $db: $db,
              $table: $db.nounExtras,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$GendersTableOrderingComposer
    extends Composer<_$AppDatabase, $GendersTable> {
  $$GendersTableOrderingComposer({
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

  ColumnOrderings<String> get short => $composableBuilder(
      column: $table.short, builder: (column) => ColumnOrderings(column));
}

class $$GendersTableAnnotationComposer
    extends Composer<_$AppDatabase, $GendersTable> {
  $$GendersTableAnnotationComposer({
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

  GeneratedColumn<String> get short =>
      $composableBuilder(column: $table.short, builder: (column) => column);

  Expression<T> nounExtrasRefs<T extends Object>(
      Expression<T> Function($$NounExtrasTableAnnotationComposer a) f) {
    final $$NounExtrasTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.nounExtras,
        getReferencedColumn: (t) => t.gender,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$NounExtrasTableAnnotationComposer(
              $db: $db,
              $table: $db.nounExtras,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$GendersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GendersTable,
    Gender,
    $$GendersTableFilterComposer,
    $$GendersTableOrderingComposer,
    $$GendersTableAnnotationComposer,
    $$GendersTableCreateCompanionBuilder,
    $$GendersTableUpdateCompanionBuilder,
    (Gender, $$GendersTableReferences),
    Gender,
    PrefetchHooks Function({bool nounExtrasRefs})> {
  $$GendersTableTableManager(_$AppDatabase db, $GendersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GendersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GendersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GendersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> short = const Value.absent(),
          }) =>
              GendersCompanion(
            id: id,
            name: name,
            short: short,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String short,
          }) =>
              GendersCompanion.insert(
            id: id,
            name: name,
            short: short,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$GendersTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({nounExtrasRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (nounExtrasRefs) db.nounExtras],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (nounExtrasRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$GendersTableReferences._nounExtrasRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$GendersTableReferences(db, table, p0)
                                .nounExtrasRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.gender == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$GendersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $GendersTable,
    Gender,
    $$GendersTableFilterComposer,
    $$GendersTableOrderingComposer,
    $$GendersTableAnnotationComposer,
    $$GendersTableCreateCompanionBuilder,
    $$GendersTableUpdateCompanionBuilder,
    (Gender, $$GendersTableReferences),
    Gender,
    PrefetchHooks Function({bool nounExtrasRefs})>;
typedef $$NounExtrasTableCreateCompanionBuilder = NounExtrasCompanion Function({
  Value<int> id,
  required int word,
  required int gender,
  Value<String?> plural,
});
typedef $$NounExtrasTableUpdateCompanionBuilder = NounExtrasCompanion Function({
  Value<int> id,
  Value<int> word,
  Value<int> gender,
  Value<String?> plural,
});

final class $$NounExtrasTableReferences
    extends BaseReferences<_$AppDatabase, $NounExtrasTable, NounExtra> {
  $$NounExtrasTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $WordsTable _wordTable(_$AppDatabase db) => db.words
      .createAlias($_aliasNameGenerator(db.nounExtras.word, db.words.id));

  $$WordsTableProcessedTableManager get word {
    final $_column = $_itemColumn<int>('word')!;

    final manager = $$WordsTableTableManager($_db, $_db.words)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_wordTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $GendersTable _genderTable(_$AppDatabase db) => db.genders
      .createAlias($_aliasNameGenerator(db.nounExtras.gender, db.genders.id));

  $$GendersTableProcessedTableManager get gender {
    final $_column = $_itemColumn<int>('gender')!;

    final manager = $$GendersTableTableManager($_db, $_db.genders)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_genderTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$NounExtrasTableFilterComposer
    extends Composer<_$AppDatabase, $NounExtrasTable> {
  $$NounExtrasTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get plural => $composableBuilder(
      column: $table.plural, builder: (column) => ColumnFilters(column));

  $$WordsTableFilterComposer get word {
    final $$WordsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.word,
        referencedTable: $db.words,
        getReferencedColumn: (t) => t.id,
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
    return composer;
  }

  $$GendersTableFilterComposer get gender {
    final $$GendersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.gender,
        referencedTable: $db.genders,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GendersTableFilterComposer(
              $db: $db,
              $table: $db.genders,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$NounExtrasTableOrderingComposer
    extends Composer<_$AppDatabase, $NounExtrasTable> {
  $$NounExtrasTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get plural => $composableBuilder(
      column: $table.plural, builder: (column) => ColumnOrderings(column));

  $$WordsTableOrderingComposer get word {
    final $$WordsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.word,
        referencedTable: $db.words,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WordsTableOrderingComposer(
              $db: $db,
              $table: $db.words,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GendersTableOrderingComposer get gender {
    final $$GendersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.gender,
        referencedTable: $db.genders,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GendersTableOrderingComposer(
              $db: $db,
              $table: $db.genders,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$NounExtrasTableAnnotationComposer
    extends Composer<_$AppDatabase, $NounExtrasTable> {
  $$NounExtrasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get plural =>
      $composableBuilder(column: $table.plural, builder: (column) => column);

  $$WordsTableAnnotationComposer get word {
    final $$WordsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.word,
        referencedTable: $db.words,
        getReferencedColumn: (t) => t.id,
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
    return composer;
  }

  $$GendersTableAnnotationComposer get gender {
    final $$GendersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.gender,
        referencedTable: $db.genders,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GendersTableAnnotationComposer(
              $db: $db,
              $table: $db.genders,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$NounExtrasTableTableManager extends RootTableManager<
    _$AppDatabase,
    $NounExtrasTable,
    NounExtra,
    $$NounExtrasTableFilterComposer,
    $$NounExtrasTableOrderingComposer,
    $$NounExtrasTableAnnotationComposer,
    $$NounExtrasTableCreateCompanionBuilder,
    $$NounExtrasTableUpdateCompanionBuilder,
    (NounExtra, $$NounExtrasTableReferences),
    NounExtra,
    PrefetchHooks Function({bool word, bool gender})> {
  $$NounExtrasTableTableManager(_$AppDatabase db, $NounExtrasTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NounExtrasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NounExtrasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NounExtrasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> word = const Value.absent(),
            Value<int> gender = const Value.absent(),
            Value<String?> plural = const Value.absent(),
          }) =>
              NounExtrasCompanion(
            id: id,
            word: word,
            gender: gender,
            plural: plural,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int word,
            required int gender,
            Value<String?> plural = const Value.absent(),
          }) =>
              NounExtrasCompanion.insert(
            id: id,
            word: word,
            gender: gender,
            plural: plural,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$NounExtrasTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({word = false, gender = false}) {
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
                if (word) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.word,
                    referencedTable: $$NounExtrasTableReferences._wordTable(db),
                    referencedColumn:
                        $$NounExtrasTableReferences._wordTable(db).id,
                  ) as T;
                }
                if (gender) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.gender,
                    referencedTable:
                        $$NounExtrasTableReferences._genderTable(db),
                    referencedColumn:
                        $$NounExtrasTableReferences._genderTable(db).id,
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

typedef $$NounExtrasTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $NounExtrasTable,
    NounExtra,
    $$NounExtrasTableFilterComposer,
    $$NounExtrasTableOrderingComposer,
    $$NounExtrasTableAnnotationComposer,
    $$NounExtrasTableCreateCompanionBuilder,
    $$NounExtrasTableUpdateCompanionBuilder,
    (NounExtra, $$NounExtrasTableReferences),
    NounExtra,
    PrefetchHooks Function({bool word, bool gender})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CoursesTableTableManager get courses =>
      $$CoursesTableTableManager(_db, _db.courses);
  $$SectionsTableTableManager get sections =>
      $$SectionsTableTableManager(_db, _db.sections);
  $$WordTypesTableTableManager get wordTypes =>
      $$WordTypesTableTableManager(_db, _db.wordTypes);
  $$WordsTableTableManager get words =>
      $$WordsTableTableManager(_db, _db.words);
  $$PronounsTableTableManager get pronouns =>
      $$PronounsTableTableManager(_db, _db.pronouns);
  $$VerbExtrasTableTableManager get verbExtras =>
      $$VerbExtrasTableTableManager(_db, _db.verbExtras);
  $$GendersTableTableManager get genders =>
      $$GendersTableTableManager(_db, _db.genders);
  $$NounExtrasTableTableManager get nounExtras =>
      $$NounExtrasTableTableManager(_db, _db.nounExtras);
}
