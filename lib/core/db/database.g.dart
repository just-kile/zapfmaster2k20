// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class DrawingData extends DataClass implements Insertable<DrawingData> {
  final int id;
  final int userId;
  final double amount;
  final DateTime createdAt;
  DrawingData(
      {@required this.id,
      @required this.userId,
      @required this.amount,
      @required this.createdAt});
  factory DrawingData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final doubleType = db.typeSystem.forDartType<double>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return DrawingData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      userId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}user_id']),
      amount:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}amount']),
      createdAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
    );
  }
  factory DrawingData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DrawingData(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      amount: serializer.fromJson<double>(json['amount']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'amount': serializer.toJson<double>(amount),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  @override
  DrawingCompanion createCompanion(bool nullToAbsent) {
    return DrawingCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      userId:
          userId == null && nullToAbsent ? const Value.absent() : Value(userId),
      amount:
          amount == null && nullToAbsent ? const Value.absent() : Value(amount),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  DrawingData copyWith(
          {int id, int userId, double amount, DateTime createdAt}) =>
      DrawingData(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        amount: amount ?? this.amount,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('DrawingData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('amount: $amount, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(userId.hashCode, $mrjc(amount.hashCode, createdAt.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is DrawingData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.amount == this.amount &&
          other.createdAt == this.createdAt);
}

class DrawingCompanion extends UpdateCompanion<DrawingData> {
  final Value<int> id;
  final Value<int> userId;
  final Value<double> amount;
  final Value<DateTime> createdAt;
  const DrawingCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.amount = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  DrawingCompanion.insert({
    this.id = const Value.absent(),
    @required int userId,
    @required double amount,
    @required DateTime createdAt,
  })  : userId = Value(userId),
        amount = Value(amount),
        createdAt = Value(createdAt);
  DrawingCompanion copyWith(
      {Value<int> id,
      Value<int> userId,
      Value<double> amount,
      Value<DateTime> createdAt}) {
    return DrawingCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      amount: amount ?? this.amount,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class $DrawingTable extends Drawing with TableInfo<$DrawingTable, DrawingData> {
  final GeneratedDatabase _db;
  final String _alias;
  $DrawingTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  GeneratedIntColumn _userId;
  @override
  GeneratedIntColumn get userId => _userId ??= _constructUserId();
  GeneratedIntColumn _constructUserId() {
    return GeneratedIntColumn(
      'user_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _amountMeta = const VerificationMeta('amount');
  GeneratedRealColumn _amount;
  @override
  GeneratedRealColumn get amount => _amount ??= _constructAmount();
  GeneratedRealColumn _constructAmount() {
    return GeneratedRealColumn(
      'amount',
      $tableName,
      false,
    );
  }

  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  GeneratedDateTimeColumn _createdAt;
  @override
  GeneratedDateTimeColumn get createdAt => _createdAt ??= _constructCreatedAt();
  GeneratedDateTimeColumn _constructCreatedAt() {
    return GeneratedDateTimeColumn(
      'created_at',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, userId, amount, createdAt];
  @override
  $DrawingTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'drawing';
  @override
  final String actualTableName = 'drawing';
  @override
  VerificationContext validateIntegrity(DrawingCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.userId.present) {
      context.handle(
          _userIdMeta, userId.isAcceptableValue(d.userId.value, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (d.amount.present) {
      context.handle(
          _amountMeta, amount.isAcceptableValue(d.amount.value, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (d.createdAt.present) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableValue(d.createdAt.value, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DrawingData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return DrawingData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(DrawingCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.userId.present) {
      map['user_id'] = Variable<int, IntType>(d.userId.value);
    }
    if (d.amount.present) {
      map['amount'] = Variable<double, RealType>(d.amount.value);
    }
    if (d.createdAt.present) {
      map['created_at'] = Variable<DateTime, DateTimeType>(d.createdAt.value);
    }
    return map;
  }

  @override
  $DrawingTable createAlias(String alias) {
    return $DrawingTable(_db, alias);
  }
}

class UserData extends DataClass implements Insertable<UserData> {
  final int id;
  final String name;
  final String imagePath;
  final String hardwareToken;
  UserData(
      {@required this.id,
      @required this.name,
      this.imagePath,
      this.hardwareToken});
  factory UserData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return UserData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      imagePath: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}image_path']),
      hardwareToken: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}hardware_token']),
    );
  }
  factory UserData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return UserData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      imagePath: serializer.fromJson<String>(json['imagePath']),
      hardwareToken: serializer.fromJson<String>(json['hardwareToken']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'imagePath': serializer.toJson<String>(imagePath),
      'hardwareToken': serializer.toJson<String>(hardwareToken),
    };
  }

  @override
  UserCompanion createCompanion(bool nullToAbsent) {
    return UserCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
      hardwareToken: hardwareToken == null && nullToAbsent
          ? const Value.absent()
          : Value(hardwareToken),
    );
  }

  UserData copyWith(
          {int id, String name, String imagePath, String hardwareToken}) =>
      UserData(
        id: id ?? this.id,
        name: name ?? this.name,
        imagePath: imagePath ?? this.imagePath,
        hardwareToken: hardwareToken ?? this.hardwareToken,
      );
  @override
  String toString() {
    return (StringBuffer('UserData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('imagePath: $imagePath, ')
          ..write('hardwareToken: $hardwareToken')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(name.hashCode, $mrjc(imagePath.hashCode, hardwareToken.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is UserData &&
          other.id == this.id &&
          other.name == this.name &&
          other.imagePath == this.imagePath &&
          other.hardwareToken == this.hardwareToken);
}

class UserCompanion extends UpdateCompanion<UserData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> imagePath;
  final Value<String> hardwareToken;
  const UserCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.hardwareToken = const Value.absent(),
  });
  UserCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    this.imagePath = const Value.absent(),
    this.hardwareToken = const Value.absent(),
  }) : name = Value(name);
  UserCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<String> imagePath,
      Value<String> hardwareToken}) {
    return UserCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      imagePath: imagePath ?? this.imagePath,
      hardwareToken: hardwareToken ?? this.hardwareToken,
    );
  }
}

class $UserTable extends User with TableInfo<$UserTable, UserData> {
  final GeneratedDatabase _db;
  final String _alias;
  $UserTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _imagePathMeta = const VerificationMeta('imagePath');
  GeneratedTextColumn _imagePath;
  @override
  GeneratedTextColumn get imagePath => _imagePath ??= _constructImagePath();
  GeneratedTextColumn _constructImagePath() {
    return GeneratedTextColumn(
      'image_path',
      $tableName,
      true,
    );
  }

  final VerificationMeta _hardwareTokenMeta =
      const VerificationMeta('hardwareToken');
  GeneratedTextColumn _hardwareToken;
  @override
  GeneratedTextColumn get hardwareToken =>
      _hardwareToken ??= _constructHardwareToken();
  GeneratedTextColumn _constructHardwareToken() {
    return GeneratedTextColumn(
      'hardware_token',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, name, imagePath, hardwareToken];
  @override
  $UserTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'user';
  @override
  final String actualTableName = 'user';
  @override
  VerificationContext validateIntegrity(UserCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (d.imagePath.present) {
      context.handle(_imagePathMeta,
          imagePath.isAcceptableValue(d.imagePath.value, _imagePathMeta));
    }
    if (d.hardwareToken.present) {
      context.handle(
          _hardwareTokenMeta,
          hardwareToken.isAcceptableValue(
              d.hardwareToken.value, _hardwareTokenMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return UserData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(UserCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.imagePath.present) {
      map['image_path'] = Variable<String, StringType>(d.imagePath.value);
    }
    if (d.hardwareToken.present) {
      map['hardware_token'] =
          Variable<String, StringType>(d.hardwareToken.value);
    }
    return map;
  }

  @override
  $UserTable createAlias(String alias) {
    return $UserTable(_db, alias);
  }
}

class New extends DataClass implements Insertable<New> {
  final int id;
  final int userId;
  final DateTime createdAt;
  final NewsDetails newsDetails;
  New(
      {@required this.id,
      this.userId,
      @required this.createdAt,
      this.newsDetails});
  factory New.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final stringType = db.typeSystem.forDartType<String>();
    return New(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      userId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}user_id']),
      createdAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      newsDetails: $NewsTable.$converter0.mapToDart(stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}news_details'])),
    );
  }
  factory New.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return New(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      newsDetails: serializer.fromJson<NewsDetails>(json['newsDetails']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'newsDetails': serializer.toJson<NewsDetails>(newsDetails),
    };
  }

  @override
  NewsCompanion createCompanion(bool nullToAbsent) {
    return NewsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      userId:
          userId == null && nullToAbsent ? const Value.absent() : Value(userId),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      newsDetails: newsDetails == null && nullToAbsent
          ? const Value.absent()
          : Value(newsDetails),
    );
  }

  New copyWith(
          {int id, int userId, DateTime createdAt, NewsDetails newsDetails}) =>
      New(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        createdAt: createdAt ?? this.createdAt,
        newsDetails: newsDetails ?? this.newsDetails,
      );
  @override
  String toString() {
    return (StringBuffer('New(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('newsDetails: $newsDetails')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(userId.hashCode, $mrjc(createdAt.hashCode, newsDetails.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is New &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt &&
          other.newsDetails == this.newsDetails);
}

class NewsCompanion extends UpdateCompanion<New> {
  final Value<int> id;
  final Value<int> userId;
  final Value<DateTime> createdAt;
  final Value<NewsDetails> newsDetails;
  const NewsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.newsDetails = const Value.absent(),
  });
  NewsCompanion.insert({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    @required DateTime createdAt,
    this.newsDetails = const Value.absent(),
  }) : createdAt = Value(createdAt);
  NewsCompanion copyWith(
      {Value<int> id,
      Value<int> userId,
      Value<DateTime> createdAt,
      Value<NewsDetails> newsDetails}) {
    return NewsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      newsDetails: newsDetails ?? this.newsDetails,
    );
  }
}

class $NewsTable extends News with TableInfo<$NewsTable, New> {
  final GeneratedDatabase _db;
  final String _alias;
  $NewsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  GeneratedIntColumn _userId;
  @override
  GeneratedIntColumn get userId => _userId ??= _constructUserId();
  GeneratedIntColumn _constructUserId() {
    return GeneratedIntColumn(
      'user_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  GeneratedDateTimeColumn _createdAt;
  @override
  GeneratedDateTimeColumn get createdAt => _createdAt ??= _constructCreatedAt();
  GeneratedDateTimeColumn _constructCreatedAt() {
    return GeneratedDateTimeColumn(
      'created_at',
      $tableName,
      false,
    );
  }

  final VerificationMeta _newsDetailsMeta =
      const VerificationMeta('newsDetails');
  GeneratedTextColumn _newsDetails;
  @override
  GeneratedTextColumn get newsDetails =>
      _newsDetails ??= _constructNewsDetails();
  GeneratedTextColumn _constructNewsDetails() {
    return GeneratedTextColumn(
      'news_details',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, userId, createdAt, newsDetails];
  @override
  $NewsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'news';
  @override
  final String actualTableName = 'news';
  @override
  VerificationContext validateIntegrity(NewsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.userId.present) {
      context.handle(
          _userIdMeta, userId.isAcceptableValue(d.userId.value, _userIdMeta));
    }
    if (d.createdAt.present) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableValue(d.createdAt.value, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    context.handle(_newsDetailsMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  New map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return New.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(NewsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.userId.present) {
      map['user_id'] = Variable<int, IntType>(d.userId.value);
    }
    if (d.createdAt.present) {
      map['created_at'] = Variable<DateTime, DateTimeType>(d.createdAt.value);
    }
    if (d.newsDetails.present) {
      final converter = $NewsTable.$converter0;
      map['news_details'] =
          Variable<String, StringType>(converter.mapToSql(d.newsDetails.value));
    }
    return map;
  }

  @override
  $NewsTable createAlias(String alias) {
    return $NewsTable(_db, alias);
  }

  static TypeConverter<NewsDetails, String> $converter0 =
      const NewsDetailsConverter();
}

abstract class _$Zm2KDb extends GeneratedDatabase {
  _$Zm2KDb(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $DrawingTable _drawing;
  $DrawingTable get drawing => _drawing ??= $DrawingTable(this);
  $UserTable _user;
  $UserTable get user => _user ??= $UserTable(this);
  $NewsTable _news;
  $NewsTable get news => _news ??= $NewsTable(this);
  DrawingDao _drawingDao;
  DrawingDao get drawingDao => _drawingDao ??= DrawingDao(this as Zm2KDb);
  UserDao _userDao;
  UserDao get userDao => _userDao ??= UserDao(this as Zm2KDb);
  NewsDao _newsDao;
  NewsDao get newsDao => _newsDao ??= NewsDao(this as Zm2KDb);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [drawing, user, news];
}
