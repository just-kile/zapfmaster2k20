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
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<int>(userId);
    }
    if (!nullToAbsent || amount != null) {
      map['amount'] = Variable<double>(amount);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    return map;
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
  static Insertable<DrawingData> custom({
    Expression<int> id,
    Expression<int> userId,
    Expression<double> amount,
    Expression<DateTime> createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (amount != null) 'amount': amount,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

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

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
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
  VerificationContext validateIntegrity(Insertable<DrawingData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id'], _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount'], _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at'], _createdAtMeta));
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
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    if (!nullToAbsent || hardwareToken != null) {
      map['hardware_token'] = Variable<String>(hardwareToken);
    }
    return map;
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
  static Insertable<UserData> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<String> imagePath,
    Expression<String> hardwareToken,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (imagePath != null) 'image_path': imagePath,
      if (hardwareToken != null) 'hardware_token': hardwareToken,
    });
  }

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

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (hardwareToken.present) {
      map['hardware_token'] = Variable<String>(hardwareToken.value);
    }
    return map;
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
  VerificationContext validateIntegrity(Insertable<UserData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('image_path')) {
      context.handle(_imagePathMeta,
          imagePath.isAcceptableOrUnknown(data['image_path'], _imagePathMeta));
    }
    if (data.containsKey('hardware_token')) {
      context.handle(
          _hardwareTokenMeta,
          hardwareToken.isAcceptableOrUnknown(
              data['hardware_token'], _hardwareTokenMeta));
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
  $UserTable createAlias(String alias) {
    return $UserTable(_db, alias);
  }
}

class New extends DataClass implements Insertable<New> {
  final int id;
  final int userId;
  final int drawingId;
  final int achievementId;
  final DateTime createdAt;
  final NewsDetails newsDetails;
  New(
      {@required this.id,
      this.userId,
      this.drawingId,
      this.achievementId,
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
      drawingId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}drawing_id']),
      achievementId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}achievement_id']),
      createdAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      newsDetails: $NewsTable.$converter0.mapToDart(stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}news_details'])),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<int>(userId);
    }
    if (!nullToAbsent || drawingId != null) {
      map['drawing_id'] = Variable<int>(drawingId);
    }
    if (!nullToAbsent || achievementId != null) {
      map['achievement_id'] = Variable<int>(achievementId);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || newsDetails != null) {
      final converter = $NewsTable.$converter0;
      map['news_details'] = Variable<String>(converter.mapToSql(newsDetails));
    }
    return map;
  }

  factory New.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return New(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      drawingId: serializer.fromJson<int>(json['drawingId']),
      achievementId: serializer.fromJson<int>(json['achievementId']),
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
      'drawingId': serializer.toJson<int>(drawingId),
      'achievementId': serializer.toJson<int>(achievementId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'newsDetails': serializer.toJson<NewsDetails>(newsDetails),
    };
  }

  New copyWith(
          {int id,
          int userId,
          int drawingId,
          int achievementId,
          DateTime createdAt,
          NewsDetails newsDetails}) =>
      New(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        drawingId: drawingId ?? this.drawingId,
        achievementId: achievementId ?? this.achievementId,
        createdAt: createdAt ?? this.createdAt,
        newsDetails: newsDetails ?? this.newsDetails,
      );
  @override
  String toString() {
    return (StringBuffer('New(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('drawingId: $drawingId, ')
          ..write('achievementId: $achievementId, ')
          ..write('createdAt: $createdAt, ')
          ..write('newsDetails: $newsDetails')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          userId.hashCode,
          $mrjc(
              drawingId.hashCode,
              $mrjc(achievementId.hashCode,
                  $mrjc(createdAt.hashCode, newsDetails.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is New &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.drawingId == this.drawingId &&
          other.achievementId == this.achievementId &&
          other.createdAt == this.createdAt &&
          other.newsDetails == this.newsDetails);
}

class NewsCompanion extends UpdateCompanion<New> {
  final Value<int> id;
  final Value<int> userId;
  final Value<int> drawingId;
  final Value<int> achievementId;
  final Value<DateTime> createdAt;
  final Value<NewsDetails> newsDetails;
  const NewsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.drawingId = const Value.absent(),
    this.achievementId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.newsDetails = const Value.absent(),
  });
  NewsCompanion.insert({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.drawingId = const Value.absent(),
    this.achievementId = const Value.absent(),
    @required DateTime createdAt,
    this.newsDetails = const Value.absent(),
  }) : createdAt = Value(createdAt);
  static Insertable<New> custom({
    Expression<int> id,
    Expression<int> userId,
    Expression<int> drawingId,
    Expression<int> achievementId,
    Expression<DateTime> createdAt,
    Expression<String> newsDetails,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (drawingId != null) 'drawing_id': drawingId,
      if (achievementId != null) 'achievement_id': achievementId,
      if (createdAt != null) 'created_at': createdAt,
      if (newsDetails != null) 'news_details': newsDetails,
    });
  }

  NewsCompanion copyWith(
      {Value<int> id,
      Value<int> userId,
      Value<int> drawingId,
      Value<int> achievementId,
      Value<DateTime> createdAt,
      Value<NewsDetails> newsDetails}) {
    return NewsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      drawingId: drawingId ?? this.drawingId,
      achievementId: achievementId ?? this.achievementId,
      createdAt: createdAt ?? this.createdAt,
      newsDetails: newsDetails ?? this.newsDetails,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (drawingId.present) {
      map['drawing_id'] = Variable<int>(drawingId.value);
    }
    if (achievementId.present) {
      map['achievement_id'] = Variable<int>(achievementId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (newsDetails.present) {
      final converter = $NewsTable.$converter0;
      map['news_details'] =
          Variable<String>(converter.mapToSql(newsDetails.value));
    }
    return map;
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

  final VerificationMeta _drawingIdMeta = const VerificationMeta('drawingId');
  GeneratedIntColumn _drawingId;
  @override
  GeneratedIntColumn get drawingId => _drawingId ??= _constructDrawingId();
  GeneratedIntColumn _constructDrawingId() {
    return GeneratedIntColumn(
      'drawing_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _achievementIdMeta =
      const VerificationMeta('achievementId');
  GeneratedIntColumn _achievementId;
  @override
  GeneratedIntColumn get achievementId =>
      _achievementId ??= _constructAchievementId();
  GeneratedIntColumn _constructAchievementId() {
    return GeneratedIntColumn(
      'achievement_id',
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
  List<GeneratedColumn> get $columns =>
      [id, userId, drawingId, achievementId, createdAt, newsDetails];
  @override
  $NewsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'news';
  @override
  final String actualTableName = 'news';
  @override
  VerificationContext validateIntegrity(Insertable<New> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id'], _userIdMeta));
    }
    if (data.containsKey('drawing_id')) {
      context.handle(_drawingIdMeta,
          drawingId.isAcceptableOrUnknown(data['drawing_id'], _drawingIdMeta));
    }
    if (data.containsKey('achievement_id')) {
      context.handle(
          _achievementIdMeta,
          achievementId.isAcceptableOrUnknown(
              data['achievement_id'], _achievementIdMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at'], _createdAtMeta));
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
  $NewsTable createAlias(String alias) {
    return $NewsTable(_db, alias);
  }

  static TypeConverter<NewsDetails, String> $converter0 =
      const NewsDetailsConverter();
}

class AchievementData extends DataClass implements Insertable<AchievementData> {
  final int id;
  final String title;
  final String description;
  final String imagePath;
  final DateTime createdAt;
  AchievementData(
      {@required this.id,
      this.title,
      this.description,
      this.imagePath,
      @required this.createdAt});
  factory AchievementData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return AchievementData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      imagePath: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}image_path']),
      createdAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    return map;
  }

  factory AchievementData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return AchievementData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      imagePath: serializer.fromJson<String>(json['imagePath']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'imagePath': serializer.toJson<String>(imagePath),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  AchievementData copyWith(
          {int id,
          String title,
          String description,
          String imagePath,
          DateTime createdAt}) =>
      AchievementData(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        imagePath: imagePath ?? this.imagePath,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('AchievementData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('imagePath: $imagePath, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          title.hashCode,
          $mrjc(description.hashCode,
              $mrjc(imagePath.hashCode, createdAt.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is AchievementData &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.imagePath == this.imagePath &&
          other.createdAt == this.createdAt);
}

class AchievementCompanion extends UpdateCompanion<AchievementData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> description;
  final Value<String> imagePath;
  final Value<DateTime> createdAt;
  const AchievementCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  AchievementCompanion.insert({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.imagePath = const Value.absent(),
    @required DateTime createdAt,
  }) : createdAt = Value(createdAt);
  static Insertable<AchievementData> custom({
    Expression<int> id,
    Expression<String> title,
    Expression<String> description,
    Expression<String> imagePath,
    Expression<DateTime> createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (imagePath != null) 'image_path': imagePath,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  AchievementCompanion copyWith(
      {Value<int> id,
      Value<String> title,
      Value<String> description,
      Value<String> imagePath,
      Value<DateTime> createdAt}) {
    return AchievementCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      imagePath: imagePath ?? this.imagePath,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }
}

class $AchievementTable extends Achievement
    with TableInfo<$AchievementTable, AchievementData> {
  final GeneratedDatabase _db;
  final String _alias;
  $AchievementTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      true,
    );
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn(
      'description',
      $tableName,
      true,
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
  List<GeneratedColumn> get $columns =>
      [id, title, description, imagePath, createdAt];
  @override
  $AchievementTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'achievement';
  @override
  final String actualTableName = 'achievement';
  @override
  VerificationContext validateIntegrity(Insertable<AchievementData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    }
    if (data.containsKey('image_path')) {
      context.handle(_imagePathMeta,
          imagePath.isAcceptableOrUnknown(data['image_path'], _imagePathMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at'], _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AchievementData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return AchievementData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $AchievementTable createAlias(String alias) {
    return $AchievementTable(_db, alias);
  }
}

abstract class _$Zm2KDb extends GeneratedDatabase {
  _$Zm2KDb(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $DrawingTable _drawing;
  $DrawingTable get drawing => _drawing ??= $DrawingTable(this);
  $UserTable _user;
  $UserTable get user => _user ??= $UserTable(this);
  $NewsTable _news;
  $NewsTable get news => _news ??= $NewsTable(this);
  $AchievementTable _achievement;
  $AchievementTable get achievement => _achievement ??= $AchievementTable(this);
  DrawingDao _drawingDao;
  DrawingDao get drawingDao => _drawingDao ??= DrawingDao(this as Zm2KDb);
  UserDao _userDao;
  UserDao get userDao => _userDao ??= UserDao(this as Zm2KDb);
  NewsDao _newsDao;
  NewsDao get newsDao => _newsDao ??= NewsDao(this as Zm2KDb);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [drawing, user, news, achievement];
}
