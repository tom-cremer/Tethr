// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, require_trailing_commas, prefer_single_quotes, prefer_double_quotes, use_super_parameters, duplicate_ignore
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_internal_member

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class UsersCollectionReference
    implements
        UsersQuery,
        FirestoreCollectionReference<User, UsersQuerySnapshot> {
  factory UsersCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$UsersCollectionReference;

  static User fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$UserFromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    User value,
    SetOptions? options,
  ) {
    return _$UserToJson(value);
  }

  @override
  CollectionReference<User> get reference;

  @override
  UsersDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<UsersDocumentReference> add(User value);
}

class _$UsersCollectionReference extends _$UsersQuery
    implements UsersCollectionReference {
  factory _$UsersCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$UsersCollectionReference._(
      firestore.collection('users').withConverter(
            fromFirestore: UsersCollectionReference.fromFirestore,
            toFirestore: UsersCollectionReference.toFirestore,
          ),
    );
  }

  _$UsersCollectionReference._(
    CollectionReference<User> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<User> get reference =>
      super.reference as CollectionReference<User>;

  @override
  UsersDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return UsersDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<UsersDocumentReference> add(User value) {
    return reference.add(value).then((ref) => UsersDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$UsersCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class UsersDocumentReference
    extends FirestoreDocumentReference<User, UsersDocumentSnapshot> {
  factory UsersDocumentReference(DocumentReference<User> reference) =
      _$UsersDocumentReference;

  DocumentReference<User> get reference;

  /// A reference to the [UsersCollectionReference] containing this document.
  UsersCollectionReference get parent {
    return _$UsersCollectionReference(reference.firestore);
  }

  late final FollowersCollectionReference followers =
      _$FollowersCollectionReference(
    reference,
  );

  late final UserRewardsCollectionReference rewards =
      _$UserRewardsCollectionReference(
    reference,
  );

  late final UserPurchasesCollectionReference purchases =
      _$UserPurchasesCollectionReference(
    reference,
  );

  @override
  Stream<UsersDocumentSnapshot> snapshots();

  @override
  Future<UsersDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Sets data on the document, overwriting any existing data. If the document
  /// does not yet exist, it will be created.
  ///
  /// If [SetOptions] are provided, the data can be merged into an existing
  /// document instead of overwriting.
  ///
  /// Any [FieldValue]s provided will replace the corresponding fields in the
  /// [model] during serialization.
  Future<void> set(
    User model, {
    SetOptions? options,
    FieldValue firstNameFieldValue,
    FieldValue lastNameFieldValue,
    FieldValue emailFieldValue,
    FieldValue usernameFieldValue,
    FieldValue linksFieldValue,
    FieldValue starPointsFieldValue,
    FieldValue activeItemsFieldValue,
  });

  /// Writes to the document using the transaction API.
  ///
  /// If the document does not exist yet, it will be created. If you pass
  /// [SetOptions], the provided data can be merged into the existing document.
  ///
  /// Any [FieldValue]s provided will replace the corresponding fields in the
  /// [model] during serialization.
  void transactionSet(
    Transaction transaction,
    User model, {
    SetOptions? options,
    FieldValue firstNameFieldValue,
    FieldValue lastNameFieldValue,
    FieldValue emailFieldValue,
    FieldValue usernameFieldValue,
    FieldValue linksFieldValue,
    FieldValue starPointsFieldValue,
    FieldValue activeItemsFieldValue,
  });

  /// Writes to the document using the batch API.
  ///
  /// If the document does not exist yet, it will be created. If you pass
  /// [SetOptions], the provided data can be merged into the existing document.
  ///
  /// Any [FieldValue]s provided will replace the corresponding fields in the
  /// [model] during serialization.
  void batchSet(
    WriteBatch batch,
    User model, {
    SetOptions? options,
    FieldValue firstNameFieldValue,
    FieldValue lastNameFieldValue,
    FieldValue emailFieldValue,
    FieldValue usernameFieldValue,
    FieldValue linksFieldValue,
    FieldValue starPointsFieldValue,
    FieldValue activeItemsFieldValue,
  });

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String firstName,
    FieldValue firstNameFieldValue,
    String lastName,
    FieldValue lastNameFieldValue,
    String email,
    FieldValue emailFieldValue,
    String username,
    FieldValue usernameFieldValue,
    List<String>? links,
    FieldValue linksFieldValue,
    int starPoints,
    FieldValue starPointsFieldValue,
    ActiveItems activeItems,
    FieldValue activeItemsFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String firstName,
    FieldValue firstNameFieldValue,
    String lastName,
    FieldValue lastNameFieldValue,
    String email,
    FieldValue emailFieldValue,
    String username,
    FieldValue usernameFieldValue,
    List<String>? links,
    FieldValue linksFieldValue,
    int starPoints,
    FieldValue starPointsFieldValue,
    ActiveItems activeItems,
    FieldValue activeItemsFieldValue,
  });

  /// Updates fields in the current document using the batch API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void batchUpdate(
    WriteBatch batch, {
    String firstName,
    FieldValue firstNameFieldValue,
    String lastName,
    FieldValue lastNameFieldValue,
    String email,
    FieldValue emailFieldValue,
    String username,
    FieldValue usernameFieldValue,
    List<String>? links,
    FieldValue linksFieldValue,
    int starPoints,
    FieldValue starPointsFieldValue,
    ActiveItems activeItems,
    FieldValue activeItemsFieldValue,
  });
}

class _$UsersDocumentReference
    extends FirestoreDocumentReference<User, UsersDocumentSnapshot>
    implements UsersDocumentReference {
  _$UsersDocumentReference(this.reference);

  @override
  final DocumentReference<User> reference;

  /// A reference to the [UsersCollectionReference] containing this document.
  UsersCollectionReference get parent {
    return _$UsersCollectionReference(reference.firestore);
  }

  late final FollowersCollectionReference followers =
      _$FollowersCollectionReference(
    reference,
  );

  late final UserRewardsCollectionReference rewards =
      _$UserRewardsCollectionReference(
    reference,
  );

  late final UserPurchasesCollectionReference purchases =
      _$UserPurchasesCollectionReference(
    reference,
  );

  @override
  Stream<UsersDocumentSnapshot> snapshots() {
    return reference.snapshots().map(UsersDocumentSnapshot._);
  }

  @override
  Future<UsersDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(UsersDocumentSnapshot._);
  }

  @override
  Future<UsersDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(UsersDocumentSnapshot._);
  }

  Future<void> set(
    User model, {
    SetOptions? options,
    FieldValue? firstNameFieldValue,
    FieldValue? lastNameFieldValue,
    FieldValue? emailFieldValue,
    FieldValue? usernameFieldValue,
    FieldValue? linksFieldValue,
    FieldValue? starPointsFieldValue,
    FieldValue? activeItemsFieldValue,
  }) async {
    final json = {
      ..._$UserToJson(model),
      if (firstNameFieldValue != null)
        _$UserFieldMap['firstName']!: firstNameFieldValue,
      if (lastNameFieldValue != null)
        _$UserFieldMap['lastName']!: lastNameFieldValue,
      if (emailFieldValue != null) _$UserFieldMap['email']!: emailFieldValue,
      if (usernameFieldValue != null)
        _$UserFieldMap['username']!: usernameFieldValue,
      if (linksFieldValue != null) _$UserFieldMap['links']!: linksFieldValue,
      if (starPointsFieldValue != null)
        _$UserFieldMap['starPoints']!: starPointsFieldValue,
      if (activeItemsFieldValue != null)
        _$UserFieldMap['activeItems']!: activeItemsFieldValue,
    };

    final castedReference = reference.withConverter<Map<String, dynamic>>(
      fromFirestore: (snapshot, options) => throw UnimplementedError(),
      toFirestore: (value, options) => value,
    );
    return castedReference.set(json, options);
  }

  void transactionSet(
    Transaction transaction,
    User model, {
    SetOptions? options,
    FieldValue? firstNameFieldValue,
    FieldValue? lastNameFieldValue,
    FieldValue? emailFieldValue,
    FieldValue? usernameFieldValue,
    FieldValue? linksFieldValue,
    FieldValue? starPointsFieldValue,
    FieldValue? activeItemsFieldValue,
  }) {
    final json = {
      ..._$UserToJson(model),
      if (firstNameFieldValue != null)
        _$UserFieldMap['firstName']!: firstNameFieldValue,
      if (lastNameFieldValue != null)
        _$UserFieldMap['lastName']!: lastNameFieldValue,
      if (emailFieldValue != null) _$UserFieldMap['email']!: emailFieldValue,
      if (usernameFieldValue != null)
        _$UserFieldMap['username']!: usernameFieldValue,
      if (linksFieldValue != null) _$UserFieldMap['links']!: linksFieldValue,
      if (starPointsFieldValue != null)
        _$UserFieldMap['starPoints']!: starPointsFieldValue,
      if (activeItemsFieldValue != null)
        _$UserFieldMap['activeItems']!: activeItemsFieldValue,
    };

    transaction.set(reference, json, options);
  }

  void batchSet(
    WriteBatch batch,
    User model, {
    SetOptions? options,
    FieldValue? firstNameFieldValue,
    FieldValue? lastNameFieldValue,
    FieldValue? emailFieldValue,
    FieldValue? usernameFieldValue,
    FieldValue? linksFieldValue,
    FieldValue? starPointsFieldValue,
    FieldValue? activeItemsFieldValue,
  }) {
    final json = {
      ..._$UserToJson(model),
      if (firstNameFieldValue != null)
        _$UserFieldMap['firstName']!: firstNameFieldValue,
      if (lastNameFieldValue != null)
        _$UserFieldMap['lastName']!: lastNameFieldValue,
      if (emailFieldValue != null) _$UserFieldMap['email']!: emailFieldValue,
      if (usernameFieldValue != null)
        _$UserFieldMap['username']!: usernameFieldValue,
      if (linksFieldValue != null) _$UserFieldMap['links']!: linksFieldValue,
      if (starPointsFieldValue != null)
        _$UserFieldMap['starPoints']!: starPointsFieldValue,
      if (activeItemsFieldValue != null)
        _$UserFieldMap['activeItems']!: activeItemsFieldValue,
    };

    batch.set(reference, json, options);
  }

  Future<void> update({
    Object? firstName = _sentinel,
    FieldValue? firstNameFieldValue,
    Object? lastName = _sentinel,
    FieldValue? lastNameFieldValue,
    Object? email = _sentinel,
    FieldValue? emailFieldValue,
    Object? username = _sentinel,
    FieldValue? usernameFieldValue,
    Object? links = _sentinel,
    FieldValue? linksFieldValue,
    Object? starPoints = _sentinel,
    FieldValue? starPointsFieldValue,
    Object? activeItems = _sentinel,
    FieldValue? activeItemsFieldValue,
  }) async {
    assert(
      firstName == _sentinel || firstNameFieldValue == null,
      "Cannot specify both firstName and firstNameFieldValue",
    );
    assert(
      lastName == _sentinel || lastNameFieldValue == null,
      "Cannot specify both lastName and lastNameFieldValue",
    );
    assert(
      email == _sentinel || emailFieldValue == null,
      "Cannot specify both email and emailFieldValue",
    );
    assert(
      username == _sentinel || usernameFieldValue == null,
      "Cannot specify both username and usernameFieldValue",
    );
    assert(
      links == _sentinel || linksFieldValue == null,
      "Cannot specify both links and linksFieldValue",
    );
    assert(
      starPoints == _sentinel || starPointsFieldValue == null,
      "Cannot specify both starPoints and starPointsFieldValue",
    );
    assert(
      activeItems == _sentinel || activeItemsFieldValue == null,
      "Cannot specify both activeItems and activeItemsFieldValue",
    );
    final json = {
      if (firstName != _sentinel)
        _$UserFieldMap['firstName']!:
            _$UserPerFieldToJson.firstName(firstName as String),
      if (firstNameFieldValue != null)
        _$UserFieldMap['firstName']!: firstNameFieldValue,
      if (lastName != _sentinel)
        _$UserFieldMap['lastName']!:
            _$UserPerFieldToJson.lastName(lastName as String),
      if (lastNameFieldValue != null)
        _$UserFieldMap['lastName']!: lastNameFieldValue,
      if (email != _sentinel)
        _$UserFieldMap['email']!: _$UserPerFieldToJson.email(email as String),
      if (emailFieldValue != null) _$UserFieldMap['email']!: emailFieldValue,
      if (username != _sentinel)
        _$UserFieldMap['username']!:
            _$UserPerFieldToJson.username(username as String),
      if (usernameFieldValue != null)
        _$UserFieldMap['username']!: usernameFieldValue,
      if (links != _sentinel)
        _$UserFieldMap['links']!:
            _$UserPerFieldToJson.links(links as List<String>?),
      if (linksFieldValue != null) _$UserFieldMap['links']!: linksFieldValue,
      if (starPoints != _sentinel)
        _$UserFieldMap['starPoints']!:
            _$UserPerFieldToJson.starPoints(starPoints as int),
      if (starPointsFieldValue != null)
        _$UserFieldMap['starPoints']!: starPointsFieldValue,
      if (activeItems != _sentinel)
        _$UserFieldMap['activeItems']!:
            _$UserPerFieldToJson.activeItems(activeItems as ActiveItems),
      if (activeItemsFieldValue != null)
        _$UserFieldMap['activeItems']!: activeItemsFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? firstName = _sentinel,
    FieldValue? firstNameFieldValue,
    Object? lastName = _sentinel,
    FieldValue? lastNameFieldValue,
    Object? email = _sentinel,
    FieldValue? emailFieldValue,
    Object? username = _sentinel,
    FieldValue? usernameFieldValue,
    Object? links = _sentinel,
    FieldValue? linksFieldValue,
    Object? starPoints = _sentinel,
    FieldValue? starPointsFieldValue,
    Object? activeItems = _sentinel,
    FieldValue? activeItemsFieldValue,
  }) {
    assert(
      firstName == _sentinel || firstNameFieldValue == null,
      "Cannot specify both firstName and firstNameFieldValue",
    );
    assert(
      lastName == _sentinel || lastNameFieldValue == null,
      "Cannot specify both lastName and lastNameFieldValue",
    );
    assert(
      email == _sentinel || emailFieldValue == null,
      "Cannot specify both email and emailFieldValue",
    );
    assert(
      username == _sentinel || usernameFieldValue == null,
      "Cannot specify both username and usernameFieldValue",
    );
    assert(
      links == _sentinel || linksFieldValue == null,
      "Cannot specify both links and linksFieldValue",
    );
    assert(
      starPoints == _sentinel || starPointsFieldValue == null,
      "Cannot specify both starPoints and starPointsFieldValue",
    );
    assert(
      activeItems == _sentinel || activeItemsFieldValue == null,
      "Cannot specify both activeItems and activeItemsFieldValue",
    );
    final json = {
      if (firstName != _sentinel)
        _$UserFieldMap['firstName']!:
            _$UserPerFieldToJson.firstName(firstName as String),
      if (firstNameFieldValue != null)
        _$UserFieldMap['firstName']!: firstNameFieldValue,
      if (lastName != _sentinel)
        _$UserFieldMap['lastName']!:
            _$UserPerFieldToJson.lastName(lastName as String),
      if (lastNameFieldValue != null)
        _$UserFieldMap['lastName']!: lastNameFieldValue,
      if (email != _sentinel)
        _$UserFieldMap['email']!: _$UserPerFieldToJson.email(email as String),
      if (emailFieldValue != null) _$UserFieldMap['email']!: emailFieldValue,
      if (username != _sentinel)
        _$UserFieldMap['username']!:
            _$UserPerFieldToJson.username(username as String),
      if (usernameFieldValue != null)
        _$UserFieldMap['username']!: usernameFieldValue,
      if (links != _sentinel)
        _$UserFieldMap['links']!:
            _$UserPerFieldToJson.links(links as List<String>?),
      if (linksFieldValue != null) _$UserFieldMap['links']!: linksFieldValue,
      if (starPoints != _sentinel)
        _$UserFieldMap['starPoints']!:
            _$UserPerFieldToJson.starPoints(starPoints as int),
      if (starPointsFieldValue != null)
        _$UserFieldMap['starPoints']!: starPointsFieldValue,
      if (activeItems != _sentinel)
        _$UserFieldMap['activeItems']!:
            _$UserPerFieldToJson.activeItems(activeItems as ActiveItems),
      if (activeItemsFieldValue != null)
        _$UserFieldMap['activeItems']!: activeItemsFieldValue,
    };

    transaction.update(reference, json);
  }

  void batchUpdate(
    WriteBatch batch, {
    Object? firstName = _sentinel,
    FieldValue? firstNameFieldValue,
    Object? lastName = _sentinel,
    FieldValue? lastNameFieldValue,
    Object? email = _sentinel,
    FieldValue? emailFieldValue,
    Object? username = _sentinel,
    FieldValue? usernameFieldValue,
    Object? links = _sentinel,
    FieldValue? linksFieldValue,
    Object? starPoints = _sentinel,
    FieldValue? starPointsFieldValue,
    Object? activeItems = _sentinel,
    FieldValue? activeItemsFieldValue,
  }) {
    assert(
      firstName == _sentinel || firstNameFieldValue == null,
      "Cannot specify both firstName and firstNameFieldValue",
    );
    assert(
      lastName == _sentinel || lastNameFieldValue == null,
      "Cannot specify both lastName and lastNameFieldValue",
    );
    assert(
      email == _sentinel || emailFieldValue == null,
      "Cannot specify both email and emailFieldValue",
    );
    assert(
      username == _sentinel || usernameFieldValue == null,
      "Cannot specify both username and usernameFieldValue",
    );
    assert(
      links == _sentinel || linksFieldValue == null,
      "Cannot specify both links and linksFieldValue",
    );
    assert(
      starPoints == _sentinel || starPointsFieldValue == null,
      "Cannot specify both starPoints and starPointsFieldValue",
    );
    assert(
      activeItems == _sentinel || activeItemsFieldValue == null,
      "Cannot specify both activeItems and activeItemsFieldValue",
    );
    final json = {
      if (firstName != _sentinel)
        _$UserFieldMap['firstName']!:
            _$UserPerFieldToJson.firstName(firstName as String),
      if (firstNameFieldValue != null)
        _$UserFieldMap['firstName']!: firstNameFieldValue,
      if (lastName != _sentinel)
        _$UserFieldMap['lastName']!:
            _$UserPerFieldToJson.lastName(lastName as String),
      if (lastNameFieldValue != null)
        _$UserFieldMap['lastName']!: lastNameFieldValue,
      if (email != _sentinel)
        _$UserFieldMap['email']!: _$UserPerFieldToJson.email(email as String),
      if (emailFieldValue != null) _$UserFieldMap['email']!: emailFieldValue,
      if (username != _sentinel)
        _$UserFieldMap['username']!:
            _$UserPerFieldToJson.username(username as String),
      if (usernameFieldValue != null)
        _$UserFieldMap['username']!: usernameFieldValue,
      if (links != _sentinel)
        _$UserFieldMap['links']!:
            _$UserPerFieldToJson.links(links as List<String>?),
      if (linksFieldValue != null) _$UserFieldMap['links']!: linksFieldValue,
      if (starPoints != _sentinel)
        _$UserFieldMap['starPoints']!:
            _$UserPerFieldToJson.starPoints(starPoints as int),
      if (starPointsFieldValue != null)
        _$UserFieldMap['starPoints']!: starPointsFieldValue,
      if (activeItems != _sentinel)
        _$UserFieldMap['activeItems']!:
            _$UserPerFieldToJson.activeItems(activeItems as ActiveItems),
      if (activeItemsFieldValue != null)
        _$UserFieldMap['activeItems']!: activeItemsFieldValue,
    };

    batch.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is UsersDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class UsersQuery implements QueryReference<User, UsersQuerySnapshot> {
  @override
  UsersQuery limit(int limit);

  @override
  UsersQuery limitToLast(int limit);

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  UsersQuery whereFieldPath(
    Object fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  UsersQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  UsersQuery whereFirstName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  UsersQuery whereLastName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  UsersQuery whereEmail({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  UsersQuery whereUsername({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  UsersQuery whereLinks({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    String? arrayContains,
    List<String>? arrayContainsAny,
    bool? isNull,
  });

  UsersQuery whereStarPoints({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    List<int>? whereIn,
    List<int>? whereNotIn,
    bool? isNull,
  });

  UsersQuery whereActiveItems({
    ActiveItems? isEqualTo,
    ActiveItems? isNotEqualTo,
    ActiveItems? isLessThan,
    ActiveItems? isLessThanOrEqualTo,
    ActiveItems? isGreaterThan,
    ActiveItems? isGreaterThanOrEqualTo,
    List<ActiveItems>? whereIn,
    List<ActiveItems>? whereNotIn,
    bool? isNull,
  });

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  UsersQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object startAt,
    Object startAfter,
    Object endAt,
    Object endBefore,
    UsersDocumentSnapshot? startAtDocument,
    UsersDocumentSnapshot? endAtDocument,
    UsersDocumentSnapshot? endBeforeDocument,
    UsersDocumentSnapshot? startAfterDocument,
  });

  UsersQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    UsersDocumentSnapshot? startAtDocument,
    UsersDocumentSnapshot? endAtDocument,
    UsersDocumentSnapshot? endBeforeDocument,
    UsersDocumentSnapshot? startAfterDocument,
  });

  UsersQuery orderByFirstName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    UsersDocumentSnapshot? startAtDocument,
    UsersDocumentSnapshot? endAtDocument,
    UsersDocumentSnapshot? endBeforeDocument,
    UsersDocumentSnapshot? startAfterDocument,
  });

  UsersQuery orderByLastName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    UsersDocumentSnapshot? startAtDocument,
    UsersDocumentSnapshot? endAtDocument,
    UsersDocumentSnapshot? endBeforeDocument,
    UsersDocumentSnapshot? startAfterDocument,
  });

  UsersQuery orderByEmail({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    UsersDocumentSnapshot? startAtDocument,
    UsersDocumentSnapshot? endAtDocument,
    UsersDocumentSnapshot? endBeforeDocument,
    UsersDocumentSnapshot? startAfterDocument,
  });

  UsersQuery orderByUsername({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    UsersDocumentSnapshot? startAtDocument,
    UsersDocumentSnapshot? endAtDocument,
    UsersDocumentSnapshot? endBeforeDocument,
    UsersDocumentSnapshot? startAfterDocument,
  });

  UsersQuery orderByLinks({
    bool descending = false,
    List<String>? startAt,
    List<String>? startAfter,
    List<String>? endAt,
    List<String>? endBefore,
    UsersDocumentSnapshot? startAtDocument,
    UsersDocumentSnapshot? endAtDocument,
    UsersDocumentSnapshot? endBeforeDocument,
    UsersDocumentSnapshot? startAfterDocument,
  });

  UsersQuery orderByStarPoints({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    UsersDocumentSnapshot? startAtDocument,
    UsersDocumentSnapshot? endAtDocument,
    UsersDocumentSnapshot? endBeforeDocument,
    UsersDocumentSnapshot? startAfterDocument,
  });

  UsersQuery orderByActiveItems({
    bool descending = false,
    ActiveItems startAt,
    ActiveItems startAfter,
    ActiveItems endAt,
    ActiveItems endBefore,
    UsersDocumentSnapshot? startAtDocument,
    UsersDocumentSnapshot? endAtDocument,
    UsersDocumentSnapshot? endBeforeDocument,
    UsersDocumentSnapshot? startAfterDocument,
  });
}

class _$UsersQuery extends QueryReference<User, UsersQuerySnapshot>
    implements UsersQuery {
  _$UsersQuery(
    this._collection, {
    required Query<User> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<UsersQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(UsersQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<UsersQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(UsersQuerySnapshot._fromQuerySnapshot);
  }

  @override
  UsersQuery limit(int limit) {
    return _$UsersQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UsersQuery limitToLast(int limit) {
    return _$UsersQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UsersQuery whereFieldPath(
    Object fieldPath, {
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$UsersQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        fieldPath,
        isEqualTo: isEqualTo != _sentinel ? isEqualTo : null,
        isNotEqualTo: isNotEqualTo != _sentinel ? isNotEqualTo : null,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UsersQuery whereDocumentId({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$UsersQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo != _sentinel ? isEqualTo : null,
        isNotEqualTo: isNotEqualTo != _sentinel ? isNotEqualTo : null,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UsersQuery whereFirstName({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$UsersQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserFieldMap['firstName']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserPerFieldToJson.firstName(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserPerFieldToJson.firstName(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$UserPerFieldToJson.firstName(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserPerFieldToJson.firstName(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserPerFieldToJson.firstName(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserPerFieldToJson.firstName(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$UserPerFieldToJson.firstName(e)),
        whereNotIn: whereNotIn?.map((e) => _$UserPerFieldToJson.firstName(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UsersQuery whereLastName({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$UsersQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserFieldMap['lastName']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserPerFieldToJson.lastName(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserPerFieldToJson.lastName(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$UserPerFieldToJson.lastName(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserPerFieldToJson.lastName(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserPerFieldToJson.lastName(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserPerFieldToJson.lastName(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$UserPerFieldToJson.lastName(e)),
        whereNotIn: whereNotIn?.map((e) => _$UserPerFieldToJson.lastName(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UsersQuery whereEmail({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$UsersQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserFieldMap['email']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserPerFieldToJson.email(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserPerFieldToJson.email(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$UserPerFieldToJson.email(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserPerFieldToJson.email(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserPerFieldToJson.email(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserPerFieldToJson.email(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$UserPerFieldToJson.email(e)),
        whereNotIn: whereNotIn?.map((e) => _$UserPerFieldToJson.email(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UsersQuery whereUsername({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$UsersQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserFieldMap['username']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserPerFieldToJson.username(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserPerFieldToJson.username(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$UserPerFieldToJson.username(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserPerFieldToJson.username(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserPerFieldToJson.username(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserPerFieldToJson.username(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$UserPerFieldToJson.username(e)),
        whereNotIn: whereNotIn?.map((e) => _$UserPerFieldToJson.username(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UsersQuery whereLinks({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<String>? arrayContainsAny,
    bool? isNull,
  }) {
    return _$UsersQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserFieldMap['links']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserPerFieldToJson.links(isEqualTo as List<String>?)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserPerFieldToJson.links(isNotEqualTo as List<String>?)
            : null,
        isLessThan: isLessThan != null
            ? _$UserPerFieldToJson.links(isLessThan as List<String>?)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserPerFieldToJson.links(isLessThanOrEqualTo as List<String>?)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserPerFieldToJson.links(isGreaterThan as List<String>?)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserPerFieldToJson
                .links(isGreaterThanOrEqualTo as List<String>?)
            : null,
        arrayContains: arrayContains != null
            ? (_$UserPerFieldToJson.links([arrayContains as String]) as List?)!
                .single
            : null,
        arrayContainsAny: arrayContainsAny != null
            ? _$UserPerFieldToJson.links(arrayContainsAny) as Iterable<Object>?
            : null,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UsersQuery whereStarPoints({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<int>? whereIn,
    List<int>? whereNotIn,
    bool? isNull,
  }) {
    return _$UsersQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserFieldMap['starPoints']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserPerFieldToJson.starPoints(isEqualTo as int)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserPerFieldToJson.starPoints(isNotEqualTo as int)
            : null,
        isLessThan: isLessThan != null
            ? _$UserPerFieldToJson.starPoints(isLessThan as int)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserPerFieldToJson.starPoints(isLessThanOrEqualTo as int)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserPerFieldToJson.starPoints(isGreaterThan as int)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserPerFieldToJson.starPoints(isGreaterThanOrEqualTo as int)
            : null,
        whereIn: whereIn?.map((e) => _$UserPerFieldToJson.starPoints(e)),
        whereNotIn: whereNotIn?.map((e) => _$UserPerFieldToJson.starPoints(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UsersQuery whereActiveItems({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<ActiveItems>? whereIn,
    List<ActiveItems>? whereNotIn,
    bool? isNull,
  }) {
    return _$UsersQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserFieldMap['activeItems']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserPerFieldToJson.activeItems(isEqualTo as ActiveItems)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserPerFieldToJson.activeItems(isNotEqualTo as ActiveItems)
            : null,
        isLessThan: isLessThan != null
            ? _$UserPerFieldToJson.activeItems(isLessThan as ActiveItems)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserPerFieldToJson
                .activeItems(isLessThanOrEqualTo as ActiveItems)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserPerFieldToJson.activeItems(isGreaterThan as ActiveItems)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserPerFieldToJson
                .activeItems(isGreaterThanOrEqualTo as ActiveItems)
            : null,
        whereIn: whereIn?.map((e) => _$UserPerFieldToJson.activeItems(e)),
        whereNotIn: whereNotIn?.map((e) => _$UserPerFieldToJson.activeItems(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UsersQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UsersDocumentSnapshot? startAtDocument,
    UsersDocumentSnapshot? endAtDocument,
    UsersDocumentSnapshot? endBeforeDocument,
    UsersDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy(fieldPath, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UsersQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UsersQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UsersDocumentSnapshot? startAtDocument,
    UsersDocumentSnapshot? endAtDocument,
    UsersDocumentSnapshot? endBeforeDocument,
    UsersDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(FieldPath.documentId,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UsersQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UsersQuery orderByFirstName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UsersDocumentSnapshot? startAtDocument,
    UsersDocumentSnapshot? endAtDocument,
    UsersDocumentSnapshot? endBeforeDocument,
    UsersDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$UserFieldMap['firstName']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UsersQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UsersQuery orderByLastName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UsersDocumentSnapshot? startAtDocument,
    UsersDocumentSnapshot? endAtDocument,
    UsersDocumentSnapshot? endBeforeDocument,
    UsersDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$UserFieldMap['lastName']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UsersQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UsersQuery orderByEmail({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UsersDocumentSnapshot? startAtDocument,
    UsersDocumentSnapshot? endAtDocument,
    UsersDocumentSnapshot? endBeforeDocument,
    UsersDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$UserFieldMap['email']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UsersQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UsersQuery orderByUsername({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UsersDocumentSnapshot? startAtDocument,
    UsersDocumentSnapshot? endAtDocument,
    UsersDocumentSnapshot? endBeforeDocument,
    UsersDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$UserFieldMap['username']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UsersQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UsersQuery orderByLinks({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UsersDocumentSnapshot? startAtDocument,
    UsersDocumentSnapshot? endAtDocument,
    UsersDocumentSnapshot? endBeforeDocument,
    UsersDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$UserFieldMap['links']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UsersQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UsersQuery orderByStarPoints({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UsersDocumentSnapshot? startAtDocument,
    UsersDocumentSnapshot? endAtDocument,
    UsersDocumentSnapshot? endBeforeDocument,
    UsersDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$UserFieldMap['starPoints']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UsersQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UsersQuery orderByActiveItems({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UsersDocumentSnapshot? startAtDocument,
    UsersDocumentSnapshot? endAtDocument,
    UsersDocumentSnapshot? endBeforeDocument,
    UsersDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$UserFieldMap['activeItems']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UsersQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$UsersQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class UsersDocumentSnapshot extends FirestoreDocumentSnapshot<User> {
  UsersDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<User> snapshot;

  @override
  UsersDocumentReference get reference {
    return UsersDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final User? data;
}

class UsersQuerySnapshot
    extends FirestoreQuerySnapshot<User, UsersQueryDocumentSnapshot> {
  UsersQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory UsersQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<User> snapshot,
  ) {
    final docs = snapshot.docs.map(UsersQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        UsersDocumentSnapshot._,
      );
    }).toList();

    return UsersQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<UsersDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    UsersDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<UsersDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<User> snapshot;

  @override
  final List<UsersQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<UsersDocumentSnapshot>> docChanges;
}

class UsersQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot<User>
    implements UsersDocumentSnapshot {
  UsersQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<User> snapshot;

  @override
  final User data;

  @override
  UsersDocumentReference get reference {
    return UsersDocumentReference(snapshot.reference);
  }
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class FollowersCollectionReference
    implements
        FollowersQuery,
        FirestoreCollectionReference<User, FollowersQuerySnapshot> {
  factory FollowersCollectionReference(
    DocumentReference<User> parent,
  ) = _$FollowersCollectionReference;

  static User fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$UserFromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    User value,
    SetOptions? options,
  ) {
    return _$UserToJson(value);
  }

  @override
  CollectionReference<User> get reference;

  /// A reference to the containing [UsersDocumentReference] if this is a subcollection.
  UsersDocumentReference get parent;

  @override
  FollowersDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<FollowersDocumentReference> add(User value);
}

class _$FollowersCollectionReference extends _$FollowersQuery
    implements FollowersCollectionReference {
  factory _$FollowersCollectionReference(
    DocumentReference<User> parent,
  ) {
    return _$FollowersCollectionReference._(
      UsersDocumentReference(parent),
      parent.collection('followers').withConverter(
            fromFirestore: FollowersCollectionReference.fromFirestore,
            toFirestore: FollowersCollectionReference.toFirestore,
          ),
    );
  }

  _$FollowersCollectionReference._(
    this.parent,
    CollectionReference<User> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  @override
  final UsersDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<User> get reference =>
      super.reference as CollectionReference<User>;

  @override
  FollowersDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return FollowersDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<FollowersDocumentReference> add(User value) {
    return reference.add(value).then((ref) => FollowersDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$FollowersCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class FollowersDocumentReference
    extends FirestoreDocumentReference<User, FollowersDocumentSnapshot> {
  factory FollowersDocumentReference(DocumentReference<User> reference) =
      _$FollowersDocumentReference;

  DocumentReference<User> get reference;

  /// A reference to the [FollowersCollectionReference] containing this document.
  FollowersCollectionReference get parent {
    return _$FollowersCollectionReference(
      reference.parent.parent!.withConverter<User>(
        fromFirestore: UsersCollectionReference.fromFirestore,
        toFirestore: UsersCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<FollowersDocumentSnapshot> snapshots();

  @override
  Future<FollowersDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Sets data on the document, overwriting any existing data. If the document
  /// does not yet exist, it will be created.
  ///
  /// If [SetOptions] are provided, the data can be merged into an existing
  /// document instead of overwriting.
  ///
  /// Any [FieldValue]s provided will replace the corresponding fields in the
  /// [model] during serialization.
  Future<void> set(
    User model, {
    SetOptions? options,
    FieldValue firstNameFieldValue,
    FieldValue lastNameFieldValue,
    FieldValue emailFieldValue,
    FieldValue usernameFieldValue,
    FieldValue linksFieldValue,
    FieldValue starPointsFieldValue,
    FieldValue activeItemsFieldValue,
  });

  /// Writes to the document using the transaction API.
  ///
  /// If the document does not exist yet, it will be created. If you pass
  /// [SetOptions], the provided data can be merged into the existing document.
  ///
  /// Any [FieldValue]s provided will replace the corresponding fields in the
  /// [model] during serialization.
  void transactionSet(
    Transaction transaction,
    User model, {
    SetOptions? options,
    FieldValue firstNameFieldValue,
    FieldValue lastNameFieldValue,
    FieldValue emailFieldValue,
    FieldValue usernameFieldValue,
    FieldValue linksFieldValue,
    FieldValue starPointsFieldValue,
    FieldValue activeItemsFieldValue,
  });

  /// Writes to the document using the batch API.
  ///
  /// If the document does not exist yet, it will be created. If you pass
  /// [SetOptions], the provided data can be merged into the existing document.
  ///
  /// Any [FieldValue]s provided will replace the corresponding fields in the
  /// [model] during serialization.
  void batchSet(
    WriteBatch batch,
    User model, {
    SetOptions? options,
    FieldValue firstNameFieldValue,
    FieldValue lastNameFieldValue,
    FieldValue emailFieldValue,
    FieldValue usernameFieldValue,
    FieldValue linksFieldValue,
    FieldValue starPointsFieldValue,
    FieldValue activeItemsFieldValue,
  });

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String firstName,
    FieldValue firstNameFieldValue,
    String lastName,
    FieldValue lastNameFieldValue,
    String email,
    FieldValue emailFieldValue,
    String username,
    FieldValue usernameFieldValue,
    List<String>? links,
    FieldValue linksFieldValue,
    int starPoints,
    FieldValue starPointsFieldValue,
    ActiveItems activeItems,
    FieldValue activeItemsFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String firstName,
    FieldValue firstNameFieldValue,
    String lastName,
    FieldValue lastNameFieldValue,
    String email,
    FieldValue emailFieldValue,
    String username,
    FieldValue usernameFieldValue,
    List<String>? links,
    FieldValue linksFieldValue,
    int starPoints,
    FieldValue starPointsFieldValue,
    ActiveItems activeItems,
    FieldValue activeItemsFieldValue,
  });

  /// Updates fields in the current document using the batch API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void batchUpdate(
    WriteBatch batch, {
    String firstName,
    FieldValue firstNameFieldValue,
    String lastName,
    FieldValue lastNameFieldValue,
    String email,
    FieldValue emailFieldValue,
    String username,
    FieldValue usernameFieldValue,
    List<String>? links,
    FieldValue linksFieldValue,
    int starPoints,
    FieldValue starPointsFieldValue,
    ActiveItems activeItems,
    FieldValue activeItemsFieldValue,
  });
}

class _$FollowersDocumentReference
    extends FirestoreDocumentReference<User, FollowersDocumentSnapshot>
    implements FollowersDocumentReference {
  _$FollowersDocumentReference(this.reference);

  @override
  final DocumentReference<User> reference;

  /// A reference to the [FollowersCollectionReference] containing this document.
  FollowersCollectionReference get parent {
    return _$FollowersCollectionReference(
      reference.parent.parent!.withConverter<User>(
        fromFirestore: UsersCollectionReference.fromFirestore,
        toFirestore: UsersCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<FollowersDocumentSnapshot> snapshots() {
    return reference.snapshots().map(FollowersDocumentSnapshot._);
  }

  @override
  Future<FollowersDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(FollowersDocumentSnapshot._);
  }

  @override
  Future<FollowersDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(FollowersDocumentSnapshot._);
  }

  Future<void> set(
    User model, {
    SetOptions? options,
    FieldValue? firstNameFieldValue,
    FieldValue? lastNameFieldValue,
    FieldValue? emailFieldValue,
    FieldValue? usernameFieldValue,
    FieldValue? linksFieldValue,
    FieldValue? starPointsFieldValue,
    FieldValue? activeItemsFieldValue,
  }) async {
    final json = {
      ..._$UserToJson(model),
      if (firstNameFieldValue != null)
        _$UserFieldMap['firstName']!: firstNameFieldValue,
      if (lastNameFieldValue != null)
        _$UserFieldMap['lastName']!: lastNameFieldValue,
      if (emailFieldValue != null) _$UserFieldMap['email']!: emailFieldValue,
      if (usernameFieldValue != null)
        _$UserFieldMap['username']!: usernameFieldValue,
      if (linksFieldValue != null) _$UserFieldMap['links']!: linksFieldValue,
      if (starPointsFieldValue != null)
        _$UserFieldMap['starPoints']!: starPointsFieldValue,
      if (activeItemsFieldValue != null)
        _$UserFieldMap['activeItems']!: activeItemsFieldValue,
    };

    final castedReference = reference.withConverter<Map<String, dynamic>>(
      fromFirestore: (snapshot, options) => throw UnimplementedError(),
      toFirestore: (value, options) => value,
    );
    return castedReference.set(json, options);
  }

  void transactionSet(
    Transaction transaction,
    User model, {
    SetOptions? options,
    FieldValue? firstNameFieldValue,
    FieldValue? lastNameFieldValue,
    FieldValue? emailFieldValue,
    FieldValue? usernameFieldValue,
    FieldValue? linksFieldValue,
    FieldValue? starPointsFieldValue,
    FieldValue? activeItemsFieldValue,
  }) {
    final json = {
      ..._$UserToJson(model),
      if (firstNameFieldValue != null)
        _$UserFieldMap['firstName']!: firstNameFieldValue,
      if (lastNameFieldValue != null)
        _$UserFieldMap['lastName']!: lastNameFieldValue,
      if (emailFieldValue != null) _$UserFieldMap['email']!: emailFieldValue,
      if (usernameFieldValue != null)
        _$UserFieldMap['username']!: usernameFieldValue,
      if (linksFieldValue != null) _$UserFieldMap['links']!: linksFieldValue,
      if (starPointsFieldValue != null)
        _$UserFieldMap['starPoints']!: starPointsFieldValue,
      if (activeItemsFieldValue != null)
        _$UserFieldMap['activeItems']!: activeItemsFieldValue,
    };

    transaction.set(reference, json, options);
  }

  void batchSet(
    WriteBatch batch,
    User model, {
    SetOptions? options,
    FieldValue? firstNameFieldValue,
    FieldValue? lastNameFieldValue,
    FieldValue? emailFieldValue,
    FieldValue? usernameFieldValue,
    FieldValue? linksFieldValue,
    FieldValue? starPointsFieldValue,
    FieldValue? activeItemsFieldValue,
  }) {
    final json = {
      ..._$UserToJson(model),
      if (firstNameFieldValue != null)
        _$UserFieldMap['firstName']!: firstNameFieldValue,
      if (lastNameFieldValue != null)
        _$UserFieldMap['lastName']!: lastNameFieldValue,
      if (emailFieldValue != null) _$UserFieldMap['email']!: emailFieldValue,
      if (usernameFieldValue != null)
        _$UserFieldMap['username']!: usernameFieldValue,
      if (linksFieldValue != null) _$UserFieldMap['links']!: linksFieldValue,
      if (starPointsFieldValue != null)
        _$UserFieldMap['starPoints']!: starPointsFieldValue,
      if (activeItemsFieldValue != null)
        _$UserFieldMap['activeItems']!: activeItemsFieldValue,
    };

    batch.set(reference, json, options);
  }

  Future<void> update({
    Object? firstName = _sentinel,
    FieldValue? firstNameFieldValue,
    Object? lastName = _sentinel,
    FieldValue? lastNameFieldValue,
    Object? email = _sentinel,
    FieldValue? emailFieldValue,
    Object? username = _sentinel,
    FieldValue? usernameFieldValue,
    Object? links = _sentinel,
    FieldValue? linksFieldValue,
    Object? starPoints = _sentinel,
    FieldValue? starPointsFieldValue,
    Object? activeItems = _sentinel,
    FieldValue? activeItemsFieldValue,
  }) async {
    assert(
      firstName == _sentinel || firstNameFieldValue == null,
      "Cannot specify both firstName and firstNameFieldValue",
    );
    assert(
      lastName == _sentinel || lastNameFieldValue == null,
      "Cannot specify both lastName and lastNameFieldValue",
    );
    assert(
      email == _sentinel || emailFieldValue == null,
      "Cannot specify both email and emailFieldValue",
    );
    assert(
      username == _sentinel || usernameFieldValue == null,
      "Cannot specify both username and usernameFieldValue",
    );
    assert(
      links == _sentinel || linksFieldValue == null,
      "Cannot specify both links and linksFieldValue",
    );
    assert(
      starPoints == _sentinel || starPointsFieldValue == null,
      "Cannot specify both starPoints and starPointsFieldValue",
    );
    assert(
      activeItems == _sentinel || activeItemsFieldValue == null,
      "Cannot specify both activeItems and activeItemsFieldValue",
    );
    final json = {
      if (firstName != _sentinel)
        _$UserFieldMap['firstName']!:
            _$UserPerFieldToJson.firstName(firstName as String),
      if (firstNameFieldValue != null)
        _$UserFieldMap['firstName']!: firstNameFieldValue,
      if (lastName != _sentinel)
        _$UserFieldMap['lastName']!:
            _$UserPerFieldToJson.lastName(lastName as String),
      if (lastNameFieldValue != null)
        _$UserFieldMap['lastName']!: lastNameFieldValue,
      if (email != _sentinel)
        _$UserFieldMap['email']!: _$UserPerFieldToJson.email(email as String),
      if (emailFieldValue != null) _$UserFieldMap['email']!: emailFieldValue,
      if (username != _sentinel)
        _$UserFieldMap['username']!:
            _$UserPerFieldToJson.username(username as String),
      if (usernameFieldValue != null)
        _$UserFieldMap['username']!: usernameFieldValue,
      if (links != _sentinel)
        _$UserFieldMap['links']!:
            _$UserPerFieldToJson.links(links as List<String>?),
      if (linksFieldValue != null) _$UserFieldMap['links']!: linksFieldValue,
      if (starPoints != _sentinel)
        _$UserFieldMap['starPoints']!:
            _$UserPerFieldToJson.starPoints(starPoints as int),
      if (starPointsFieldValue != null)
        _$UserFieldMap['starPoints']!: starPointsFieldValue,
      if (activeItems != _sentinel)
        _$UserFieldMap['activeItems']!:
            _$UserPerFieldToJson.activeItems(activeItems as ActiveItems),
      if (activeItemsFieldValue != null)
        _$UserFieldMap['activeItems']!: activeItemsFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? firstName = _sentinel,
    FieldValue? firstNameFieldValue,
    Object? lastName = _sentinel,
    FieldValue? lastNameFieldValue,
    Object? email = _sentinel,
    FieldValue? emailFieldValue,
    Object? username = _sentinel,
    FieldValue? usernameFieldValue,
    Object? links = _sentinel,
    FieldValue? linksFieldValue,
    Object? starPoints = _sentinel,
    FieldValue? starPointsFieldValue,
    Object? activeItems = _sentinel,
    FieldValue? activeItemsFieldValue,
  }) {
    assert(
      firstName == _sentinel || firstNameFieldValue == null,
      "Cannot specify both firstName and firstNameFieldValue",
    );
    assert(
      lastName == _sentinel || lastNameFieldValue == null,
      "Cannot specify both lastName and lastNameFieldValue",
    );
    assert(
      email == _sentinel || emailFieldValue == null,
      "Cannot specify both email and emailFieldValue",
    );
    assert(
      username == _sentinel || usernameFieldValue == null,
      "Cannot specify both username and usernameFieldValue",
    );
    assert(
      links == _sentinel || linksFieldValue == null,
      "Cannot specify both links and linksFieldValue",
    );
    assert(
      starPoints == _sentinel || starPointsFieldValue == null,
      "Cannot specify both starPoints and starPointsFieldValue",
    );
    assert(
      activeItems == _sentinel || activeItemsFieldValue == null,
      "Cannot specify both activeItems and activeItemsFieldValue",
    );
    final json = {
      if (firstName != _sentinel)
        _$UserFieldMap['firstName']!:
            _$UserPerFieldToJson.firstName(firstName as String),
      if (firstNameFieldValue != null)
        _$UserFieldMap['firstName']!: firstNameFieldValue,
      if (lastName != _sentinel)
        _$UserFieldMap['lastName']!:
            _$UserPerFieldToJson.lastName(lastName as String),
      if (lastNameFieldValue != null)
        _$UserFieldMap['lastName']!: lastNameFieldValue,
      if (email != _sentinel)
        _$UserFieldMap['email']!: _$UserPerFieldToJson.email(email as String),
      if (emailFieldValue != null) _$UserFieldMap['email']!: emailFieldValue,
      if (username != _sentinel)
        _$UserFieldMap['username']!:
            _$UserPerFieldToJson.username(username as String),
      if (usernameFieldValue != null)
        _$UserFieldMap['username']!: usernameFieldValue,
      if (links != _sentinel)
        _$UserFieldMap['links']!:
            _$UserPerFieldToJson.links(links as List<String>?),
      if (linksFieldValue != null) _$UserFieldMap['links']!: linksFieldValue,
      if (starPoints != _sentinel)
        _$UserFieldMap['starPoints']!:
            _$UserPerFieldToJson.starPoints(starPoints as int),
      if (starPointsFieldValue != null)
        _$UserFieldMap['starPoints']!: starPointsFieldValue,
      if (activeItems != _sentinel)
        _$UserFieldMap['activeItems']!:
            _$UserPerFieldToJson.activeItems(activeItems as ActiveItems),
      if (activeItemsFieldValue != null)
        _$UserFieldMap['activeItems']!: activeItemsFieldValue,
    };

    transaction.update(reference, json);
  }

  void batchUpdate(
    WriteBatch batch, {
    Object? firstName = _sentinel,
    FieldValue? firstNameFieldValue,
    Object? lastName = _sentinel,
    FieldValue? lastNameFieldValue,
    Object? email = _sentinel,
    FieldValue? emailFieldValue,
    Object? username = _sentinel,
    FieldValue? usernameFieldValue,
    Object? links = _sentinel,
    FieldValue? linksFieldValue,
    Object? starPoints = _sentinel,
    FieldValue? starPointsFieldValue,
    Object? activeItems = _sentinel,
    FieldValue? activeItemsFieldValue,
  }) {
    assert(
      firstName == _sentinel || firstNameFieldValue == null,
      "Cannot specify both firstName and firstNameFieldValue",
    );
    assert(
      lastName == _sentinel || lastNameFieldValue == null,
      "Cannot specify both lastName and lastNameFieldValue",
    );
    assert(
      email == _sentinel || emailFieldValue == null,
      "Cannot specify both email and emailFieldValue",
    );
    assert(
      username == _sentinel || usernameFieldValue == null,
      "Cannot specify both username and usernameFieldValue",
    );
    assert(
      links == _sentinel || linksFieldValue == null,
      "Cannot specify both links and linksFieldValue",
    );
    assert(
      starPoints == _sentinel || starPointsFieldValue == null,
      "Cannot specify both starPoints and starPointsFieldValue",
    );
    assert(
      activeItems == _sentinel || activeItemsFieldValue == null,
      "Cannot specify both activeItems and activeItemsFieldValue",
    );
    final json = {
      if (firstName != _sentinel)
        _$UserFieldMap['firstName']!:
            _$UserPerFieldToJson.firstName(firstName as String),
      if (firstNameFieldValue != null)
        _$UserFieldMap['firstName']!: firstNameFieldValue,
      if (lastName != _sentinel)
        _$UserFieldMap['lastName']!:
            _$UserPerFieldToJson.lastName(lastName as String),
      if (lastNameFieldValue != null)
        _$UserFieldMap['lastName']!: lastNameFieldValue,
      if (email != _sentinel)
        _$UserFieldMap['email']!: _$UserPerFieldToJson.email(email as String),
      if (emailFieldValue != null) _$UserFieldMap['email']!: emailFieldValue,
      if (username != _sentinel)
        _$UserFieldMap['username']!:
            _$UserPerFieldToJson.username(username as String),
      if (usernameFieldValue != null)
        _$UserFieldMap['username']!: usernameFieldValue,
      if (links != _sentinel)
        _$UserFieldMap['links']!:
            _$UserPerFieldToJson.links(links as List<String>?),
      if (linksFieldValue != null) _$UserFieldMap['links']!: linksFieldValue,
      if (starPoints != _sentinel)
        _$UserFieldMap['starPoints']!:
            _$UserPerFieldToJson.starPoints(starPoints as int),
      if (starPointsFieldValue != null)
        _$UserFieldMap['starPoints']!: starPointsFieldValue,
      if (activeItems != _sentinel)
        _$UserFieldMap['activeItems']!:
            _$UserPerFieldToJson.activeItems(activeItems as ActiveItems),
      if (activeItemsFieldValue != null)
        _$UserFieldMap['activeItems']!: activeItemsFieldValue,
    };

    batch.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is FollowersDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class FollowersQuery
    implements QueryReference<User, FollowersQuerySnapshot> {
  @override
  FollowersQuery limit(int limit);

  @override
  FollowersQuery limitToLast(int limit);

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  FollowersQuery whereFieldPath(
    Object fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  FollowersQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  FollowersQuery whereFirstName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  FollowersQuery whereLastName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  FollowersQuery whereEmail({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  FollowersQuery whereUsername({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  FollowersQuery whereLinks({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    String? arrayContains,
    List<String>? arrayContainsAny,
    bool? isNull,
  });

  FollowersQuery whereStarPoints({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    List<int>? whereIn,
    List<int>? whereNotIn,
    bool? isNull,
  });

  FollowersQuery whereActiveItems({
    ActiveItems? isEqualTo,
    ActiveItems? isNotEqualTo,
    ActiveItems? isLessThan,
    ActiveItems? isLessThanOrEqualTo,
    ActiveItems? isGreaterThan,
    ActiveItems? isGreaterThanOrEqualTo,
    List<ActiveItems>? whereIn,
    List<ActiveItems>? whereNotIn,
    bool? isNull,
  });

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  FollowersQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object startAt,
    Object startAfter,
    Object endAt,
    Object endBefore,
    FollowersDocumentSnapshot? startAtDocument,
    FollowersDocumentSnapshot? endAtDocument,
    FollowersDocumentSnapshot? endBeforeDocument,
    FollowersDocumentSnapshot? startAfterDocument,
  });

  FollowersQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    FollowersDocumentSnapshot? startAtDocument,
    FollowersDocumentSnapshot? endAtDocument,
    FollowersDocumentSnapshot? endBeforeDocument,
    FollowersDocumentSnapshot? startAfterDocument,
  });

  FollowersQuery orderByFirstName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    FollowersDocumentSnapshot? startAtDocument,
    FollowersDocumentSnapshot? endAtDocument,
    FollowersDocumentSnapshot? endBeforeDocument,
    FollowersDocumentSnapshot? startAfterDocument,
  });

  FollowersQuery orderByLastName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    FollowersDocumentSnapshot? startAtDocument,
    FollowersDocumentSnapshot? endAtDocument,
    FollowersDocumentSnapshot? endBeforeDocument,
    FollowersDocumentSnapshot? startAfterDocument,
  });

  FollowersQuery orderByEmail({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    FollowersDocumentSnapshot? startAtDocument,
    FollowersDocumentSnapshot? endAtDocument,
    FollowersDocumentSnapshot? endBeforeDocument,
    FollowersDocumentSnapshot? startAfterDocument,
  });

  FollowersQuery orderByUsername({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    FollowersDocumentSnapshot? startAtDocument,
    FollowersDocumentSnapshot? endAtDocument,
    FollowersDocumentSnapshot? endBeforeDocument,
    FollowersDocumentSnapshot? startAfterDocument,
  });

  FollowersQuery orderByLinks({
    bool descending = false,
    List<String>? startAt,
    List<String>? startAfter,
    List<String>? endAt,
    List<String>? endBefore,
    FollowersDocumentSnapshot? startAtDocument,
    FollowersDocumentSnapshot? endAtDocument,
    FollowersDocumentSnapshot? endBeforeDocument,
    FollowersDocumentSnapshot? startAfterDocument,
  });

  FollowersQuery orderByStarPoints({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    FollowersDocumentSnapshot? startAtDocument,
    FollowersDocumentSnapshot? endAtDocument,
    FollowersDocumentSnapshot? endBeforeDocument,
    FollowersDocumentSnapshot? startAfterDocument,
  });

  FollowersQuery orderByActiveItems({
    bool descending = false,
    ActiveItems startAt,
    ActiveItems startAfter,
    ActiveItems endAt,
    ActiveItems endBefore,
    FollowersDocumentSnapshot? startAtDocument,
    FollowersDocumentSnapshot? endAtDocument,
    FollowersDocumentSnapshot? endBeforeDocument,
    FollowersDocumentSnapshot? startAfterDocument,
  });
}

class _$FollowersQuery extends QueryReference<User, FollowersQuerySnapshot>
    implements FollowersQuery {
  _$FollowersQuery(
    this._collection, {
    required Query<User> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<FollowersQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(FollowersQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<FollowersQuerySnapshot> get([GetOptions? options]) {
    return reference
        .get(options)
        .then(FollowersQuerySnapshot._fromQuerySnapshot);
  }

  @override
  FollowersQuery limit(int limit) {
    return _$FollowersQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  FollowersQuery limitToLast(int limit) {
    return _$FollowersQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  FollowersQuery whereFieldPath(
    Object fieldPath, {
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$FollowersQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        fieldPath,
        isEqualTo: isEqualTo != _sentinel ? isEqualTo : null,
        isNotEqualTo: isNotEqualTo != _sentinel ? isNotEqualTo : null,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  FollowersQuery whereDocumentId({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$FollowersQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo != _sentinel ? isEqualTo : null,
        isNotEqualTo: isNotEqualTo != _sentinel ? isNotEqualTo : null,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  FollowersQuery whereFirstName({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$FollowersQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserFieldMap['firstName']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserPerFieldToJson.firstName(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserPerFieldToJson.firstName(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$UserPerFieldToJson.firstName(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserPerFieldToJson.firstName(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserPerFieldToJson.firstName(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserPerFieldToJson.firstName(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$UserPerFieldToJson.firstName(e)),
        whereNotIn: whereNotIn?.map((e) => _$UserPerFieldToJson.firstName(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  FollowersQuery whereLastName({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$FollowersQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserFieldMap['lastName']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserPerFieldToJson.lastName(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserPerFieldToJson.lastName(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$UserPerFieldToJson.lastName(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserPerFieldToJson.lastName(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserPerFieldToJson.lastName(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserPerFieldToJson.lastName(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$UserPerFieldToJson.lastName(e)),
        whereNotIn: whereNotIn?.map((e) => _$UserPerFieldToJson.lastName(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  FollowersQuery whereEmail({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$FollowersQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserFieldMap['email']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserPerFieldToJson.email(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserPerFieldToJson.email(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$UserPerFieldToJson.email(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserPerFieldToJson.email(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserPerFieldToJson.email(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserPerFieldToJson.email(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$UserPerFieldToJson.email(e)),
        whereNotIn: whereNotIn?.map((e) => _$UserPerFieldToJson.email(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  FollowersQuery whereUsername({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$FollowersQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserFieldMap['username']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserPerFieldToJson.username(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserPerFieldToJson.username(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$UserPerFieldToJson.username(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserPerFieldToJson.username(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserPerFieldToJson.username(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserPerFieldToJson.username(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$UserPerFieldToJson.username(e)),
        whereNotIn: whereNotIn?.map((e) => _$UserPerFieldToJson.username(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  FollowersQuery whereLinks({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<String>? arrayContainsAny,
    bool? isNull,
  }) {
    return _$FollowersQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserFieldMap['links']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserPerFieldToJson.links(isEqualTo as List<String>?)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserPerFieldToJson.links(isNotEqualTo as List<String>?)
            : null,
        isLessThan: isLessThan != null
            ? _$UserPerFieldToJson.links(isLessThan as List<String>?)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserPerFieldToJson.links(isLessThanOrEqualTo as List<String>?)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserPerFieldToJson.links(isGreaterThan as List<String>?)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserPerFieldToJson
                .links(isGreaterThanOrEqualTo as List<String>?)
            : null,
        arrayContains: arrayContains != null
            ? (_$UserPerFieldToJson.links([arrayContains as String]) as List?)!
                .single
            : null,
        arrayContainsAny: arrayContainsAny != null
            ? _$UserPerFieldToJson.links(arrayContainsAny) as Iterable<Object>?
            : null,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  FollowersQuery whereStarPoints({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<int>? whereIn,
    List<int>? whereNotIn,
    bool? isNull,
  }) {
    return _$FollowersQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserFieldMap['starPoints']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserPerFieldToJson.starPoints(isEqualTo as int)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserPerFieldToJson.starPoints(isNotEqualTo as int)
            : null,
        isLessThan: isLessThan != null
            ? _$UserPerFieldToJson.starPoints(isLessThan as int)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserPerFieldToJson.starPoints(isLessThanOrEqualTo as int)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserPerFieldToJson.starPoints(isGreaterThan as int)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserPerFieldToJson.starPoints(isGreaterThanOrEqualTo as int)
            : null,
        whereIn: whereIn?.map((e) => _$UserPerFieldToJson.starPoints(e)),
        whereNotIn: whereNotIn?.map((e) => _$UserPerFieldToJson.starPoints(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  FollowersQuery whereActiveItems({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<ActiveItems>? whereIn,
    List<ActiveItems>? whereNotIn,
    bool? isNull,
  }) {
    return _$FollowersQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserFieldMap['activeItems']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserPerFieldToJson.activeItems(isEqualTo as ActiveItems)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserPerFieldToJson.activeItems(isNotEqualTo as ActiveItems)
            : null,
        isLessThan: isLessThan != null
            ? _$UserPerFieldToJson.activeItems(isLessThan as ActiveItems)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserPerFieldToJson
                .activeItems(isLessThanOrEqualTo as ActiveItems)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserPerFieldToJson.activeItems(isGreaterThan as ActiveItems)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserPerFieldToJson
                .activeItems(isGreaterThanOrEqualTo as ActiveItems)
            : null,
        whereIn: whereIn?.map((e) => _$UserPerFieldToJson.activeItems(e)),
        whereNotIn: whereNotIn?.map((e) => _$UserPerFieldToJson.activeItems(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  FollowersQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FollowersDocumentSnapshot? startAtDocument,
    FollowersDocumentSnapshot? endAtDocument,
    FollowersDocumentSnapshot? endBeforeDocument,
    FollowersDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy(fieldPath, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$FollowersQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  FollowersQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FollowersDocumentSnapshot? startAtDocument,
    FollowersDocumentSnapshot? endAtDocument,
    FollowersDocumentSnapshot? endBeforeDocument,
    FollowersDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(FieldPath.documentId,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$FollowersQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  FollowersQuery orderByFirstName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FollowersDocumentSnapshot? startAtDocument,
    FollowersDocumentSnapshot? endAtDocument,
    FollowersDocumentSnapshot? endBeforeDocument,
    FollowersDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$UserFieldMap['firstName']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$FollowersQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  FollowersQuery orderByLastName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FollowersDocumentSnapshot? startAtDocument,
    FollowersDocumentSnapshot? endAtDocument,
    FollowersDocumentSnapshot? endBeforeDocument,
    FollowersDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$UserFieldMap['lastName']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$FollowersQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  FollowersQuery orderByEmail({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FollowersDocumentSnapshot? startAtDocument,
    FollowersDocumentSnapshot? endAtDocument,
    FollowersDocumentSnapshot? endBeforeDocument,
    FollowersDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$UserFieldMap['email']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$FollowersQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  FollowersQuery orderByUsername({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FollowersDocumentSnapshot? startAtDocument,
    FollowersDocumentSnapshot? endAtDocument,
    FollowersDocumentSnapshot? endBeforeDocument,
    FollowersDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$UserFieldMap['username']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$FollowersQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  FollowersQuery orderByLinks({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FollowersDocumentSnapshot? startAtDocument,
    FollowersDocumentSnapshot? endAtDocument,
    FollowersDocumentSnapshot? endBeforeDocument,
    FollowersDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$UserFieldMap['links']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$FollowersQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  FollowersQuery orderByStarPoints({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FollowersDocumentSnapshot? startAtDocument,
    FollowersDocumentSnapshot? endAtDocument,
    FollowersDocumentSnapshot? endBeforeDocument,
    FollowersDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$UserFieldMap['starPoints']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$FollowersQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  FollowersQuery orderByActiveItems({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FollowersDocumentSnapshot? startAtDocument,
    FollowersDocumentSnapshot? endAtDocument,
    FollowersDocumentSnapshot? endBeforeDocument,
    FollowersDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$UserFieldMap['activeItems']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$FollowersQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$FollowersQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class FollowersDocumentSnapshot extends FirestoreDocumentSnapshot<User> {
  FollowersDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<User> snapshot;

  @override
  FollowersDocumentReference get reference {
    return FollowersDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final User? data;
}

class FollowersQuerySnapshot
    extends FirestoreQuerySnapshot<User, FollowersQueryDocumentSnapshot> {
  FollowersQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory FollowersQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<User> snapshot,
  ) {
    final docs = snapshot.docs.map(FollowersQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        FollowersDocumentSnapshot._,
      );
    }).toList();

    return FollowersQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<FollowersDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    FollowersDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<FollowersDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<User> snapshot;

  @override
  final List<FollowersQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<FollowersDocumentSnapshot>> docChanges;
}

class FollowersQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<User>
    implements FollowersDocumentSnapshot {
  FollowersQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<User> snapshot;

  @override
  final User data;

  @override
  FollowersDocumentReference get reference {
    return FollowersDocumentReference(snapshot.reference);
  }
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class UserRewardsCollectionReference
    implements
        UserRewardsQuery,
        FirestoreCollectionReference<UserReward, UserRewardsQuerySnapshot> {
  factory UserRewardsCollectionReference(
    DocumentReference<User> parent,
  ) = _$UserRewardsCollectionReference;

  static UserReward fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$UserRewardFromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    UserReward value,
    SetOptions? options,
  ) {
    return _$UserRewardToJson(value);
  }

  @override
  CollectionReference<UserReward> get reference;

  /// A reference to the containing [UsersDocumentReference] if this is a subcollection.
  UsersDocumentReference get parent;

  @override
  UserRewardsDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<UserRewardsDocumentReference> add(UserReward value);
}

class _$UserRewardsCollectionReference extends _$UserRewardsQuery
    implements UserRewardsCollectionReference {
  factory _$UserRewardsCollectionReference(
    DocumentReference<User> parent,
  ) {
    return _$UserRewardsCollectionReference._(
      UsersDocumentReference(parent),
      parent.collection('rewards').withConverter(
            fromFirestore: UserRewardsCollectionReference.fromFirestore,
            toFirestore: UserRewardsCollectionReference.toFirestore,
          ),
    );
  }

  _$UserRewardsCollectionReference._(
    this.parent,
    CollectionReference<UserReward> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  @override
  final UsersDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<UserReward> get reference =>
      super.reference as CollectionReference<UserReward>;

  @override
  UserRewardsDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return UserRewardsDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<UserRewardsDocumentReference> add(UserReward value) {
    return reference
        .add(value)
        .then((ref) => UserRewardsDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$UserRewardsCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class UserRewardsDocumentReference extends FirestoreDocumentReference<
    UserReward, UserRewardsDocumentSnapshot> {
  factory UserRewardsDocumentReference(
      DocumentReference<UserReward> reference) = _$UserRewardsDocumentReference;

  DocumentReference<UserReward> get reference;

  /// A reference to the [UserRewardsCollectionReference] containing this document.
  UserRewardsCollectionReference get parent {
    return _$UserRewardsCollectionReference(
      reference.parent.parent!.withConverter<User>(
        fromFirestore: UsersCollectionReference.fromFirestore,
        toFirestore: UsersCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<UserRewardsDocumentSnapshot> snapshots();

  @override
  Future<UserRewardsDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Sets data on the document, overwriting any existing data. If the document
  /// does not yet exist, it will be created.
  ///
  /// If [SetOptions] are provided, the data can be merged into an existing
  /// document instead of overwriting.
  ///
  /// Any [FieldValue]s provided will replace the corresponding fields in the
  /// [model] during serialization.
  Future<void> set(
    UserReward model, {
    SetOptions? options,
    FieldValue rewardIdFieldValue,
    FieldValue nameFieldValue,
    FieldValue typeFieldValue,
    FieldValue starPointsFieldValue,
    FieldValue earnedAtFieldValue,
  });

  /// Writes to the document using the transaction API.
  ///
  /// If the document does not exist yet, it will be created. If you pass
  /// [SetOptions], the provided data can be merged into the existing document.
  ///
  /// Any [FieldValue]s provided will replace the corresponding fields in the
  /// [model] during serialization.
  void transactionSet(
    Transaction transaction,
    UserReward model, {
    SetOptions? options,
    FieldValue rewardIdFieldValue,
    FieldValue nameFieldValue,
    FieldValue typeFieldValue,
    FieldValue starPointsFieldValue,
    FieldValue earnedAtFieldValue,
  });

  /// Writes to the document using the batch API.
  ///
  /// If the document does not exist yet, it will be created. If you pass
  /// [SetOptions], the provided data can be merged into the existing document.
  ///
  /// Any [FieldValue]s provided will replace the corresponding fields in the
  /// [model] during serialization.
  void batchSet(
    WriteBatch batch,
    UserReward model, {
    SetOptions? options,
    FieldValue rewardIdFieldValue,
    FieldValue nameFieldValue,
    FieldValue typeFieldValue,
    FieldValue starPointsFieldValue,
    FieldValue earnedAtFieldValue,
  });

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String rewardId,
    FieldValue rewardIdFieldValue,
    String name,
    FieldValue nameFieldValue,
    String type,
    FieldValue typeFieldValue,
    int starPoints,
    FieldValue starPointsFieldValue,
    Timestamp earnedAt,
    FieldValue earnedAtFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String rewardId,
    FieldValue rewardIdFieldValue,
    String name,
    FieldValue nameFieldValue,
    String type,
    FieldValue typeFieldValue,
    int starPoints,
    FieldValue starPointsFieldValue,
    Timestamp earnedAt,
    FieldValue earnedAtFieldValue,
  });

  /// Updates fields in the current document using the batch API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void batchUpdate(
    WriteBatch batch, {
    String rewardId,
    FieldValue rewardIdFieldValue,
    String name,
    FieldValue nameFieldValue,
    String type,
    FieldValue typeFieldValue,
    int starPoints,
    FieldValue starPointsFieldValue,
    Timestamp earnedAt,
    FieldValue earnedAtFieldValue,
  });
}

class _$UserRewardsDocumentReference
    extends FirestoreDocumentReference<UserReward, UserRewardsDocumentSnapshot>
    implements UserRewardsDocumentReference {
  _$UserRewardsDocumentReference(this.reference);

  @override
  final DocumentReference<UserReward> reference;

  /// A reference to the [UserRewardsCollectionReference] containing this document.
  UserRewardsCollectionReference get parent {
    return _$UserRewardsCollectionReference(
      reference.parent.parent!.withConverter<User>(
        fromFirestore: UsersCollectionReference.fromFirestore,
        toFirestore: UsersCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<UserRewardsDocumentSnapshot> snapshots() {
    return reference.snapshots().map(UserRewardsDocumentSnapshot._);
  }

  @override
  Future<UserRewardsDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(UserRewardsDocumentSnapshot._);
  }

  @override
  Future<UserRewardsDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(UserRewardsDocumentSnapshot._);
  }

  Future<void> set(
    UserReward model, {
    SetOptions? options,
    FieldValue? rewardIdFieldValue,
    FieldValue? nameFieldValue,
    FieldValue? typeFieldValue,
    FieldValue? starPointsFieldValue,
    FieldValue? earnedAtFieldValue,
  }) async {
    final json = {
      ..._$UserRewardToJson(model),
      if (rewardIdFieldValue != null)
        _$UserRewardFieldMap['rewardId']!: rewardIdFieldValue,
      if (nameFieldValue != null) _$UserRewardFieldMap['name']!: nameFieldValue,
      if (typeFieldValue != null) _$UserRewardFieldMap['type']!: typeFieldValue,
      if (starPointsFieldValue != null)
        _$UserRewardFieldMap['starPoints']!: starPointsFieldValue,
      if (earnedAtFieldValue != null)
        _$UserRewardFieldMap['earnedAt']!: earnedAtFieldValue,
    };

    final castedReference = reference.withConverter<Map<String, dynamic>>(
      fromFirestore: (snapshot, options) => throw UnimplementedError(),
      toFirestore: (value, options) => value,
    );
    return castedReference.set(json, options);
  }

  void transactionSet(
    Transaction transaction,
    UserReward model, {
    SetOptions? options,
    FieldValue? rewardIdFieldValue,
    FieldValue? nameFieldValue,
    FieldValue? typeFieldValue,
    FieldValue? starPointsFieldValue,
    FieldValue? earnedAtFieldValue,
  }) {
    final json = {
      ..._$UserRewardToJson(model),
      if (rewardIdFieldValue != null)
        _$UserRewardFieldMap['rewardId']!: rewardIdFieldValue,
      if (nameFieldValue != null) _$UserRewardFieldMap['name']!: nameFieldValue,
      if (typeFieldValue != null) _$UserRewardFieldMap['type']!: typeFieldValue,
      if (starPointsFieldValue != null)
        _$UserRewardFieldMap['starPoints']!: starPointsFieldValue,
      if (earnedAtFieldValue != null)
        _$UserRewardFieldMap['earnedAt']!: earnedAtFieldValue,
    };

    transaction.set(reference, json, options);
  }

  void batchSet(
    WriteBatch batch,
    UserReward model, {
    SetOptions? options,
    FieldValue? rewardIdFieldValue,
    FieldValue? nameFieldValue,
    FieldValue? typeFieldValue,
    FieldValue? starPointsFieldValue,
    FieldValue? earnedAtFieldValue,
  }) {
    final json = {
      ..._$UserRewardToJson(model),
      if (rewardIdFieldValue != null)
        _$UserRewardFieldMap['rewardId']!: rewardIdFieldValue,
      if (nameFieldValue != null) _$UserRewardFieldMap['name']!: nameFieldValue,
      if (typeFieldValue != null) _$UserRewardFieldMap['type']!: typeFieldValue,
      if (starPointsFieldValue != null)
        _$UserRewardFieldMap['starPoints']!: starPointsFieldValue,
      if (earnedAtFieldValue != null)
        _$UserRewardFieldMap['earnedAt']!: earnedAtFieldValue,
    };

    batch.set(reference, json, options);
  }

  Future<void> update({
    Object? rewardId = _sentinel,
    FieldValue? rewardIdFieldValue,
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? type = _sentinel,
    FieldValue? typeFieldValue,
    Object? starPoints = _sentinel,
    FieldValue? starPointsFieldValue,
    Object? earnedAt = _sentinel,
    FieldValue? earnedAtFieldValue,
  }) async {
    assert(
      rewardId == _sentinel || rewardIdFieldValue == null,
      "Cannot specify both rewardId and rewardIdFieldValue",
    );
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      type == _sentinel || typeFieldValue == null,
      "Cannot specify both type and typeFieldValue",
    );
    assert(
      starPoints == _sentinel || starPointsFieldValue == null,
      "Cannot specify both starPoints and starPointsFieldValue",
    );
    assert(
      earnedAt == _sentinel || earnedAtFieldValue == null,
      "Cannot specify both earnedAt and earnedAtFieldValue",
    );
    final json = {
      if (rewardId != _sentinel)
        _$UserRewardFieldMap['rewardId']!:
            _$UserRewardPerFieldToJson.rewardId(rewardId as String),
      if (rewardIdFieldValue != null)
        _$UserRewardFieldMap['rewardId']!: rewardIdFieldValue,
      if (name != _sentinel)
        _$UserRewardFieldMap['name']!:
            _$UserRewardPerFieldToJson.name(name as String),
      if (nameFieldValue != null) _$UserRewardFieldMap['name']!: nameFieldValue,
      if (type != _sentinel)
        _$UserRewardFieldMap['type']!:
            _$UserRewardPerFieldToJson.type(type as String),
      if (typeFieldValue != null) _$UserRewardFieldMap['type']!: typeFieldValue,
      if (starPoints != _sentinel)
        _$UserRewardFieldMap['starPoints']!:
            _$UserRewardPerFieldToJson.starPoints(starPoints as int),
      if (starPointsFieldValue != null)
        _$UserRewardFieldMap['starPoints']!: starPointsFieldValue,
      if (earnedAt != _sentinel)
        _$UserRewardFieldMap['earnedAt']!:
            _$UserRewardPerFieldToJson.earnedAt(earnedAt as Timestamp),
      if (earnedAtFieldValue != null)
        _$UserRewardFieldMap['earnedAt']!: earnedAtFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? rewardId = _sentinel,
    FieldValue? rewardIdFieldValue,
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? type = _sentinel,
    FieldValue? typeFieldValue,
    Object? starPoints = _sentinel,
    FieldValue? starPointsFieldValue,
    Object? earnedAt = _sentinel,
    FieldValue? earnedAtFieldValue,
  }) {
    assert(
      rewardId == _sentinel || rewardIdFieldValue == null,
      "Cannot specify both rewardId and rewardIdFieldValue",
    );
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      type == _sentinel || typeFieldValue == null,
      "Cannot specify both type and typeFieldValue",
    );
    assert(
      starPoints == _sentinel || starPointsFieldValue == null,
      "Cannot specify both starPoints and starPointsFieldValue",
    );
    assert(
      earnedAt == _sentinel || earnedAtFieldValue == null,
      "Cannot specify both earnedAt and earnedAtFieldValue",
    );
    final json = {
      if (rewardId != _sentinel)
        _$UserRewardFieldMap['rewardId']!:
            _$UserRewardPerFieldToJson.rewardId(rewardId as String),
      if (rewardIdFieldValue != null)
        _$UserRewardFieldMap['rewardId']!: rewardIdFieldValue,
      if (name != _sentinel)
        _$UserRewardFieldMap['name']!:
            _$UserRewardPerFieldToJson.name(name as String),
      if (nameFieldValue != null) _$UserRewardFieldMap['name']!: nameFieldValue,
      if (type != _sentinel)
        _$UserRewardFieldMap['type']!:
            _$UserRewardPerFieldToJson.type(type as String),
      if (typeFieldValue != null) _$UserRewardFieldMap['type']!: typeFieldValue,
      if (starPoints != _sentinel)
        _$UserRewardFieldMap['starPoints']!:
            _$UserRewardPerFieldToJson.starPoints(starPoints as int),
      if (starPointsFieldValue != null)
        _$UserRewardFieldMap['starPoints']!: starPointsFieldValue,
      if (earnedAt != _sentinel)
        _$UserRewardFieldMap['earnedAt']!:
            _$UserRewardPerFieldToJson.earnedAt(earnedAt as Timestamp),
      if (earnedAtFieldValue != null)
        _$UserRewardFieldMap['earnedAt']!: earnedAtFieldValue,
    };

    transaction.update(reference, json);
  }

  void batchUpdate(
    WriteBatch batch, {
    Object? rewardId = _sentinel,
    FieldValue? rewardIdFieldValue,
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? type = _sentinel,
    FieldValue? typeFieldValue,
    Object? starPoints = _sentinel,
    FieldValue? starPointsFieldValue,
    Object? earnedAt = _sentinel,
    FieldValue? earnedAtFieldValue,
  }) {
    assert(
      rewardId == _sentinel || rewardIdFieldValue == null,
      "Cannot specify both rewardId and rewardIdFieldValue",
    );
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      type == _sentinel || typeFieldValue == null,
      "Cannot specify both type and typeFieldValue",
    );
    assert(
      starPoints == _sentinel || starPointsFieldValue == null,
      "Cannot specify both starPoints and starPointsFieldValue",
    );
    assert(
      earnedAt == _sentinel || earnedAtFieldValue == null,
      "Cannot specify both earnedAt and earnedAtFieldValue",
    );
    final json = {
      if (rewardId != _sentinel)
        _$UserRewardFieldMap['rewardId']!:
            _$UserRewardPerFieldToJson.rewardId(rewardId as String),
      if (rewardIdFieldValue != null)
        _$UserRewardFieldMap['rewardId']!: rewardIdFieldValue,
      if (name != _sentinel)
        _$UserRewardFieldMap['name']!:
            _$UserRewardPerFieldToJson.name(name as String),
      if (nameFieldValue != null) _$UserRewardFieldMap['name']!: nameFieldValue,
      if (type != _sentinel)
        _$UserRewardFieldMap['type']!:
            _$UserRewardPerFieldToJson.type(type as String),
      if (typeFieldValue != null) _$UserRewardFieldMap['type']!: typeFieldValue,
      if (starPoints != _sentinel)
        _$UserRewardFieldMap['starPoints']!:
            _$UserRewardPerFieldToJson.starPoints(starPoints as int),
      if (starPointsFieldValue != null)
        _$UserRewardFieldMap['starPoints']!: starPointsFieldValue,
      if (earnedAt != _sentinel)
        _$UserRewardFieldMap['earnedAt']!:
            _$UserRewardPerFieldToJson.earnedAt(earnedAt as Timestamp),
      if (earnedAtFieldValue != null)
        _$UserRewardFieldMap['earnedAt']!: earnedAtFieldValue,
    };

    batch.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is UserRewardsDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class UserRewardsQuery
    implements QueryReference<UserReward, UserRewardsQuerySnapshot> {
  @override
  UserRewardsQuery limit(int limit);

  @override
  UserRewardsQuery limitToLast(int limit);

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  UserRewardsQuery whereFieldPath(
    Object fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  UserRewardsQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  UserRewardsQuery whereRewardId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  UserRewardsQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  UserRewardsQuery whereType({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  UserRewardsQuery whereStarPoints({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    List<int>? whereIn,
    List<int>? whereNotIn,
    bool? isNull,
  });

  UserRewardsQuery whereEarnedAt({
    Timestamp? isEqualTo,
    Timestamp? isNotEqualTo,
    Timestamp? isLessThan,
    Timestamp? isLessThanOrEqualTo,
    Timestamp? isGreaterThan,
    Timestamp? isGreaterThanOrEqualTo,
    List<Timestamp>? whereIn,
    List<Timestamp>? whereNotIn,
    bool? isNull,
  });

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  UserRewardsQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object startAt,
    Object startAfter,
    Object endAt,
    Object endBefore,
    UserRewardsDocumentSnapshot? startAtDocument,
    UserRewardsDocumentSnapshot? endAtDocument,
    UserRewardsDocumentSnapshot? endBeforeDocument,
    UserRewardsDocumentSnapshot? startAfterDocument,
  });

  UserRewardsQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    UserRewardsDocumentSnapshot? startAtDocument,
    UserRewardsDocumentSnapshot? endAtDocument,
    UserRewardsDocumentSnapshot? endBeforeDocument,
    UserRewardsDocumentSnapshot? startAfterDocument,
  });

  UserRewardsQuery orderByRewardId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    UserRewardsDocumentSnapshot? startAtDocument,
    UserRewardsDocumentSnapshot? endAtDocument,
    UserRewardsDocumentSnapshot? endBeforeDocument,
    UserRewardsDocumentSnapshot? startAfterDocument,
  });

  UserRewardsQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    UserRewardsDocumentSnapshot? startAtDocument,
    UserRewardsDocumentSnapshot? endAtDocument,
    UserRewardsDocumentSnapshot? endBeforeDocument,
    UserRewardsDocumentSnapshot? startAfterDocument,
  });

  UserRewardsQuery orderByType({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    UserRewardsDocumentSnapshot? startAtDocument,
    UserRewardsDocumentSnapshot? endAtDocument,
    UserRewardsDocumentSnapshot? endBeforeDocument,
    UserRewardsDocumentSnapshot? startAfterDocument,
  });

  UserRewardsQuery orderByStarPoints({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    UserRewardsDocumentSnapshot? startAtDocument,
    UserRewardsDocumentSnapshot? endAtDocument,
    UserRewardsDocumentSnapshot? endBeforeDocument,
    UserRewardsDocumentSnapshot? startAfterDocument,
  });

  UserRewardsQuery orderByEarnedAt({
    bool descending = false,
    Timestamp startAt,
    Timestamp startAfter,
    Timestamp endAt,
    Timestamp endBefore,
    UserRewardsDocumentSnapshot? startAtDocument,
    UserRewardsDocumentSnapshot? endAtDocument,
    UserRewardsDocumentSnapshot? endBeforeDocument,
    UserRewardsDocumentSnapshot? startAfterDocument,
  });
}

class _$UserRewardsQuery
    extends QueryReference<UserReward, UserRewardsQuerySnapshot>
    implements UserRewardsQuery {
  _$UserRewardsQuery(
    this._collection, {
    required Query<UserReward> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<UserRewardsQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference
        .snapshots()
        .map(UserRewardsQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<UserRewardsQuerySnapshot> get([GetOptions? options]) {
    return reference
        .get(options)
        .then(UserRewardsQuerySnapshot._fromQuerySnapshot);
  }

  @override
  UserRewardsQuery limit(int limit) {
    return _$UserRewardsQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserRewardsQuery limitToLast(int limit) {
    return _$UserRewardsQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserRewardsQuery whereFieldPath(
    Object fieldPath, {
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserRewardsQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        fieldPath,
        isEqualTo: isEqualTo != _sentinel ? isEqualTo : null,
        isNotEqualTo: isNotEqualTo != _sentinel ? isNotEqualTo : null,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserRewardsQuery whereDocumentId({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserRewardsQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo != _sentinel ? isEqualTo : null,
        isNotEqualTo: isNotEqualTo != _sentinel ? isNotEqualTo : null,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserRewardsQuery whereRewardId({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserRewardsQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserRewardFieldMap['rewardId']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserRewardPerFieldToJson.rewardId(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserRewardPerFieldToJson.rewardId(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$UserRewardPerFieldToJson.rewardId(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserRewardPerFieldToJson.rewardId(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserRewardPerFieldToJson.rewardId(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserRewardPerFieldToJson
                .rewardId(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$UserRewardPerFieldToJson.rewardId(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$UserRewardPerFieldToJson.rewardId(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserRewardsQuery whereName({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserRewardsQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserRewardFieldMap['name']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserRewardPerFieldToJson.name(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserRewardPerFieldToJson.name(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$UserRewardPerFieldToJson.name(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserRewardPerFieldToJson.name(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserRewardPerFieldToJson.name(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserRewardPerFieldToJson.name(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$UserRewardPerFieldToJson.name(e)),
        whereNotIn: whereNotIn?.map((e) => _$UserRewardPerFieldToJson.name(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserRewardsQuery whereType({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserRewardsQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserRewardFieldMap['type']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserRewardPerFieldToJson.type(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserRewardPerFieldToJson.type(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$UserRewardPerFieldToJson.type(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserRewardPerFieldToJson.type(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserRewardPerFieldToJson.type(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserRewardPerFieldToJson.type(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$UserRewardPerFieldToJson.type(e)),
        whereNotIn: whereNotIn?.map((e) => _$UserRewardPerFieldToJson.type(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserRewardsQuery whereStarPoints({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<int>? whereIn,
    List<int>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserRewardsQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserRewardFieldMap['starPoints']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserRewardPerFieldToJson.starPoints(isEqualTo as int)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserRewardPerFieldToJson.starPoints(isNotEqualTo as int)
            : null,
        isLessThan: isLessThan != null
            ? _$UserRewardPerFieldToJson.starPoints(isLessThan as int)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserRewardPerFieldToJson.starPoints(isLessThanOrEqualTo as int)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserRewardPerFieldToJson.starPoints(isGreaterThan as int)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserRewardPerFieldToJson
                .starPoints(isGreaterThanOrEqualTo as int)
            : null,
        whereIn: whereIn?.map((e) => _$UserRewardPerFieldToJson.starPoints(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$UserRewardPerFieldToJson.starPoints(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserRewardsQuery whereEarnedAt({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<Timestamp>? whereIn,
    List<Timestamp>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserRewardsQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserRewardFieldMap['earnedAt']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserRewardPerFieldToJson.earnedAt(isEqualTo as Timestamp)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserRewardPerFieldToJson.earnedAt(isNotEqualTo as Timestamp)
            : null,
        isLessThan: isLessThan != null
            ? _$UserRewardPerFieldToJson.earnedAt(isLessThan as Timestamp)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserRewardPerFieldToJson
                .earnedAt(isLessThanOrEqualTo as Timestamp)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserRewardPerFieldToJson.earnedAt(isGreaterThan as Timestamp)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserRewardPerFieldToJson
                .earnedAt(isGreaterThanOrEqualTo as Timestamp)
            : null,
        whereIn: whereIn?.map((e) => _$UserRewardPerFieldToJson.earnedAt(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$UserRewardPerFieldToJson.earnedAt(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserRewardsQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserRewardsDocumentSnapshot? startAtDocument,
    UserRewardsDocumentSnapshot? endAtDocument,
    UserRewardsDocumentSnapshot? endBeforeDocument,
    UserRewardsDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy(fieldPath, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserRewardsQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserRewardsQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserRewardsDocumentSnapshot? startAtDocument,
    UserRewardsDocumentSnapshot? endAtDocument,
    UserRewardsDocumentSnapshot? endBeforeDocument,
    UserRewardsDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(FieldPath.documentId,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserRewardsQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserRewardsQuery orderByRewardId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserRewardsDocumentSnapshot? startAtDocument,
    UserRewardsDocumentSnapshot? endAtDocument,
    UserRewardsDocumentSnapshot? endBeforeDocument,
    UserRewardsDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$UserRewardFieldMap['rewardId']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserRewardsQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserRewardsQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserRewardsDocumentSnapshot? startAtDocument,
    UserRewardsDocumentSnapshot? endAtDocument,
    UserRewardsDocumentSnapshot? endBeforeDocument,
    UserRewardsDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$UserRewardFieldMap['name']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserRewardsQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserRewardsQuery orderByType({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserRewardsDocumentSnapshot? startAtDocument,
    UserRewardsDocumentSnapshot? endAtDocument,
    UserRewardsDocumentSnapshot? endBeforeDocument,
    UserRewardsDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$UserRewardFieldMap['type']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserRewardsQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserRewardsQuery orderByStarPoints({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserRewardsDocumentSnapshot? startAtDocument,
    UserRewardsDocumentSnapshot? endAtDocument,
    UserRewardsDocumentSnapshot? endBeforeDocument,
    UserRewardsDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$UserRewardFieldMap['starPoints']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserRewardsQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserRewardsQuery orderByEarnedAt({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserRewardsDocumentSnapshot? startAtDocument,
    UserRewardsDocumentSnapshot? endAtDocument,
    UserRewardsDocumentSnapshot? endBeforeDocument,
    UserRewardsDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$UserRewardFieldMap['earnedAt']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserRewardsQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$UserRewardsQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class UserRewardsDocumentSnapshot
    extends FirestoreDocumentSnapshot<UserReward> {
  UserRewardsDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<UserReward> snapshot;

  @override
  UserRewardsDocumentReference get reference {
    return UserRewardsDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final UserReward? data;
}

class UserRewardsQuerySnapshot extends FirestoreQuerySnapshot<UserReward,
    UserRewardsQueryDocumentSnapshot> {
  UserRewardsQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory UserRewardsQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<UserReward> snapshot,
  ) {
    final docs = snapshot.docs.map(UserRewardsQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        UserRewardsDocumentSnapshot._,
      );
    }).toList();

    return UserRewardsQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<UserRewardsDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    UserRewardsDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<UserRewardsDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<UserReward> snapshot;

  @override
  final List<UserRewardsQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<UserRewardsDocumentSnapshot>> docChanges;
}

class UserRewardsQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<UserReward>
    implements UserRewardsDocumentSnapshot {
  UserRewardsQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<UserReward> snapshot;

  @override
  final UserReward data;

  @override
  UserRewardsDocumentReference get reference {
    return UserRewardsDocumentReference(snapshot.reference);
  }
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class UserPurchasesCollectionReference
    implements
        UserPurchasesQuery,
        FirestoreCollectionReference<UserPurchase, UserPurchasesQuerySnapshot> {
  factory UserPurchasesCollectionReference(
    DocumentReference<User> parent,
  ) = _$UserPurchasesCollectionReference;

  static UserPurchase fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$UserPurchaseFromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    UserPurchase value,
    SetOptions? options,
  ) {
    return _$UserPurchaseToJson(value);
  }

  @override
  CollectionReference<UserPurchase> get reference;

  /// A reference to the containing [UsersDocumentReference] if this is a subcollection.
  UsersDocumentReference get parent;

  @override
  UserPurchasesDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<UserPurchasesDocumentReference> add(UserPurchase value);
}

class _$UserPurchasesCollectionReference extends _$UserPurchasesQuery
    implements UserPurchasesCollectionReference {
  factory _$UserPurchasesCollectionReference(
    DocumentReference<User> parent,
  ) {
    return _$UserPurchasesCollectionReference._(
      UsersDocumentReference(parent),
      parent.collection('purchases').withConverter(
            fromFirestore: UserPurchasesCollectionReference.fromFirestore,
            toFirestore: UserPurchasesCollectionReference.toFirestore,
          ),
    );
  }

  _$UserPurchasesCollectionReference._(
    this.parent,
    CollectionReference<UserPurchase> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  @override
  final UsersDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<UserPurchase> get reference =>
      super.reference as CollectionReference<UserPurchase>;

  @override
  UserPurchasesDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return UserPurchasesDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<UserPurchasesDocumentReference> add(UserPurchase value) {
    return reference
        .add(value)
        .then((ref) => UserPurchasesDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$UserPurchasesCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class UserPurchasesDocumentReference
    extends FirestoreDocumentReference<UserPurchase,
        UserPurchasesDocumentSnapshot> {
  factory UserPurchasesDocumentReference(
          DocumentReference<UserPurchase> reference) =
      _$UserPurchasesDocumentReference;

  DocumentReference<UserPurchase> get reference;

  /// A reference to the [UserPurchasesCollectionReference] containing this document.
  UserPurchasesCollectionReference get parent {
    return _$UserPurchasesCollectionReference(
      reference.parent.parent!.withConverter<User>(
        fromFirestore: UsersCollectionReference.fromFirestore,
        toFirestore: UsersCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<UserPurchasesDocumentSnapshot> snapshots();

  @override
  Future<UserPurchasesDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Sets data on the document, overwriting any existing data. If the document
  /// does not yet exist, it will be created.
  ///
  /// If [SetOptions] are provided, the data can be merged into an existing
  /// document instead of overwriting.
  ///
  /// Any [FieldValue]s provided will replace the corresponding fields in the
  /// [model] during serialization.
  Future<void> set(
    UserPurchase model, {
    SetOptions? options,
    FieldValue itemIdFieldValue,
    FieldValue nameFieldValue,
    FieldValue typeFieldValue,
    FieldValue iconFieldValue,
    FieldValue purchasedAtFieldValue,
  });

  /// Writes to the document using the transaction API.
  ///
  /// If the document does not exist yet, it will be created. If you pass
  /// [SetOptions], the provided data can be merged into the existing document.
  ///
  /// Any [FieldValue]s provided will replace the corresponding fields in the
  /// [model] during serialization.
  void transactionSet(
    Transaction transaction,
    UserPurchase model, {
    SetOptions? options,
    FieldValue itemIdFieldValue,
    FieldValue nameFieldValue,
    FieldValue typeFieldValue,
    FieldValue iconFieldValue,
    FieldValue purchasedAtFieldValue,
  });

  /// Writes to the document using the batch API.
  ///
  /// If the document does not exist yet, it will be created. If you pass
  /// [SetOptions], the provided data can be merged into the existing document.
  ///
  /// Any [FieldValue]s provided will replace the corresponding fields in the
  /// [model] during serialization.
  void batchSet(
    WriteBatch batch,
    UserPurchase model, {
    SetOptions? options,
    FieldValue itemIdFieldValue,
    FieldValue nameFieldValue,
    FieldValue typeFieldValue,
    FieldValue iconFieldValue,
    FieldValue purchasedAtFieldValue,
  });

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String itemId,
    FieldValue itemIdFieldValue,
    String name,
    FieldValue nameFieldValue,
    String type,
    FieldValue typeFieldValue,
    String icon,
    FieldValue iconFieldValue,
    Timestamp purchasedAt,
    FieldValue purchasedAtFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String itemId,
    FieldValue itemIdFieldValue,
    String name,
    FieldValue nameFieldValue,
    String type,
    FieldValue typeFieldValue,
    String icon,
    FieldValue iconFieldValue,
    Timestamp purchasedAt,
    FieldValue purchasedAtFieldValue,
  });

  /// Updates fields in the current document using the batch API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void batchUpdate(
    WriteBatch batch, {
    String itemId,
    FieldValue itemIdFieldValue,
    String name,
    FieldValue nameFieldValue,
    String type,
    FieldValue typeFieldValue,
    String icon,
    FieldValue iconFieldValue,
    Timestamp purchasedAt,
    FieldValue purchasedAtFieldValue,
  });
}

class _$UserPurchasesDocumentReference extends FirestoreDocumentReference<
    UserPurchase,
    UserPurchasesDocumentSnapshot> implements UserPurchasesDocumentReference {
  _$UserPurchasesDocumentReference(this.reference);

  @override
  final DocumentReference<UserPurchase> reference;

  /// A reference to the [UserPurchasesCollectionReference] containing this document.
  UserPurchasesCollectionReference get parent {
    return _$UserPurchasesCollectionReference(
      reference.parent.parent!.withConverter<User>(
        fromFirestore: UsersCollectionReference.fromFirestore,
        toFirestore: UsersCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<UserPurchasesDocumentSnapshot> snapshots() {
    return reference.snapshots().map(UserPurchasesDocumentSnapshot._);
  }

  @override
  Future<UserPurchasesDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(UserPurchasesDocumentSnapshot._);
  }

  @override
  Future<UserPurchasesDocumentSnapshot> transactionGet(
      Transaction transaction) {
    return transaction.get(reference).then(UserPurchasesDocumentSnapshot._);
  }

  Future<void> set(
    UserPurchase model, {
    SetOptions? options,
    FieldValue? itemIdFieldValue,
    FieldValue? nameFieldValue,
    FieldValue? typeFieldValue,
    FieldValue? iconFieldValue,
    FieldValue? purchasedAtFieldValue,
  }) async {
    final json = {
      ..._$UserPurchaseToJson(model),
      if (itemIdFieldValue != null)
        _$UserPurchaseFieldMap['itemId']!: itemIdFieldValue,
      if (nameFieldValue != null)
        _$UserPurchaseFieldMap['name']!: nameFieldValue,
      if (typeFieldValue != null)
        _$UserPurchaseFieldMap['type']!: typeFieldValue,
      if (iconFieldValue != null)
        _$UserPurchaseFieldMap['icon']!: iconFieldValue,
      if (purchasedAtFieldValue != null)
        _$UserPurchaseFieldMap['purchasedAt']!: purchasedAtFieldValue,
    };

    final castedReference = reference.withConverter<Map<String, dynamic>>(
      fromFirestore: (snapshot, options) => throw UnimplementedError(),
      toFirestore: (value, options) => value,
    );
    return castedReference.set(json, options);
  }

  void transactionSet(
    Transaction transaction,
    UserPurchase model, {
    SetOptions? options,
    FieldValue? itemIdFieldValue,
    FieldValue? nameFieldValue,
    FieldValue? typeFieldValue,
    FieldValue? iconFieldValue,
    FieldValue? purchasedAtFieldValue,
  }) {
    final json = {
      ..._$UserPurchaseToJson(model),
      if (itemIdFieldValue != null)
        _$UserPurchaseFieldMap['itemId']!: itemIdFieldValue,
      if (nameFieldValue != null)
        _$UserPurchaseFieldMap['name']!: nameFieldValue,
      if (typeFieldValue != null)
        _$UserPurchaseFieldMap['type']!: typeFieldValue,
      if (iconFieldValue != null)
        _$UserPurchaseFieldMap['icon']!: iconFieldValue,
      if (purchasedAtFieldValue != null)
        _$UserPurchaseFieldMap['purchasedAt']!: purchasedAtFieldValue,
    };

    transaction.set(reference, json, options);
  }

  void batchSet(
    WriteBatch batch,
    UserPurchase model, {
    SetOptions? options,
    FieldValue? itemIdFieldValue,
    FieldValue? nameFieldValue,
    FieldValue? typeFieldValue,
    FieldValue? iconFieldValue,
    FieldValue? purchasedAtFieldValue,
  }) {
    final json = {
      ..._$UserPurchaseToJson(model),
      if (itemIdFieldValue != null)
        _$UserPurchaseFieldMap['itemId']!: itemIdFieldValue,
      if (nameFieldValue != null)
        _$UserPurchaseFieldMap['name']!: nameFieldValue,
      if (typeFieldValue != null)
        _$UserPurchaseFieldMap['type']!: typeFieldValue,
      if (iconFieldValue != null)
        _$UserPurchaseFieldMap['icon']!: iconFieldValue,
      if (purchasedAtFieldValue != null)
        _$UserPurchaseFieldMap['purchasedAt']!: purchasedAtFieldValue,
    };

    batch.set(reference, json, options);
  }

  Future<void> update({
    Object? itemId = _sentinel,
    FieldValue? itemIdFieldValue,
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? type = _sentinel,
    FieldValue? typeFieldValue,
    Object? icon = _sentinel,
    FieldValue? iconFieldValue,
    Object? purchasedAt = _sentinel,
    FieldValue? purchasedAtFieldValue,
  }) async {
    assert(
      itemId == _sentinel || itemIdFieldValue == null,
      "Cannot specify both itemId and itemIdFieldValue",
    );
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      type == _sentinel || typeFieldValue == null,
      "Cannot specify both type and typeFieldValue",
    );
    assert(
      icon == _sentinel || iconFieldValue == null,
      "Cannot specify both icon and iconFieldValue",
    );
    assert(
      purchasedAt == _sentinel || purchasedAtFieldValue == null,
      "Cannot specify both purchasedAt and purchasedAtFieldValue",
    );
    final json = {
      if (itemId != _sentinel)
        _$UserPurchaseFieldMap['itemId']!:
            _$UserPurchasePerFieldToJson.itemId(itemId as String),
      if (itemIdFieldValue != null)
        _$UserPurchaseFieldMap['itemId']!: itemIdFieldValue,
      if (name != _sentinel)
        _$UserPurchaseFieldMap['name']!:
            _$UserPurchasePerFieldToJson.name(name as String),
      if (nameFieldValue != null)
        _$UserPurchaseFieldMap['name']!: nameFieldValue,
      if (type != _sentinel)
        _$UserPurchaseFieldMap['type']!:
            _$UserPurchasePerFieldToJson.type(type as String),
      if (typeFieldValue != null)
        _$UserPurchaseFieldMap['type']!: typeFieldValue,
      if (icon != _sentinel)
        _$UserPurchaseFieldMap['icon']!:
            _$UserPurchasePerFieldToJson.icon(icon as String),
      if (iconFieldValue != null)
        _$UserPurchaseFieldMap['icon']!: iconFieldValue,
      if (purchasedAt != _sentinel)
        _$UserPurchaseFieldMap['purchasedAt']!:
            _$UserPurchasePerFieldToJson.purchasedAt(purchasedAt as Timestamp),
      if (purchasedAtFieldValue != null)
        _$UserPurchaseFieldMap['purchasedAt']!: purchasedAtFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? itemId = _sentinel,
    FieldValue? itemIdFieldValue,
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? type = _sentinel,
    FieldValue? typeFieldValue,
    Object? icon = _sentinel,
    FieldValue? iconFieldValue,
    Object? purchasedAt = _sentinel,
    FieldValue? purchasedAtFieldValue,
  }) {
    assert(
      itemId == _sentinel || itemIdFieldValue == null,
      "Cannot specify both itemId and itemIdFieldValue",
    );
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      type == _sentinel || typeFieldValue == null,
      "Cannot specify both type and typeFieldValue",
    );
    assert(
      icon == _sentinel || iconFieldValue == null,
      "Cannot specify both icon and iconFieldValue",
    );
    assert(
      purchasedAt == _sentinel || purchasedAtFieldValue == null,
      "Cannot specify both purchasedAt and purchasedAtFieldValue",
    );
    final json = {
      if (itemId != _sentinel)
        _$UserPurchaseFieldMap['itemId']!:
            _$UserPurchasePerFieldToJson.itemId(itemId as String),
      if (itemIdFieldValue != null)
        _$UserPurchaseFieldMap['itemId']!: itemIdFieldValue,
      if (name != _sentinel)
        _$UserPurchaseFieldMap['name']!:
            _$UserPurchasePerFieldToJson.name(name as String),
      if (nameFieldValue != null)
        _$UserPurchaseFieldMap['name']!: nameFieldValue,
      if (type != _sentinel)
        _$UserPurchaseFieldMap['type']!:
            _$UserPurchasePerFieldToJson.type(type as String),
      if (typeFieldValue != null)
        _$UserPurchaseFieldMap['type']!: typeFieldValue,
      if (icon != _sentinel)
        _$UserPurchaseFieldMap['icon']!:
            _$UserPurchasePerFieldToJson.icon(icon as String),
      if (iconFieldValue != null)
        _$UserPurchaseFieldMap['icon']!: iconFieldValue,
      if (purchasedAt != _sentinel)
        _$UserPurchaseFieldMap['purchasedAt']!:
            _$UserPurchasePerFieldToJson.purchasedAt(purchasedAt as Timestamp),
      if (purchasedAtFieldValue != null)
        _$UserPurchaseFieldMap['purchasedAt']!: purchasedAtFieldValue,
    };

    transaction.update(reference, json);
  }

  void batchUpdate(
    WriteBatch batch, {
    Object? itemId = _sentinel,
    FieldValue? itemIdFieldValue,
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? type = _sentinel,
    FieldValue? typeFieldValue,
    Object? icon = _sentinel,
    FieldValue? iconFieldValue,
    Object? purchasedAt = _sentinel,
    FieldValue? purchasedAtFieldValue,
  }) {
    assert(
      itemId == _sentinel || itemIdFieldValue == null,
      "Cannot specify both itemId and itemIdFieldValue",
    );
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      type == _sentinel || typeFieldValue == null,
      "Cannot specify both type and typeFieldValue",
    );
    assert(
      icon == _sentinel || iconFieldValue == null,
      "Cannot specify both icon and iconFieldValue",
    );
    assert(
      purchasedAt == _sentinel || purchasedAtFieldValue == null,
      "Cannot specify both purchasedAt and purchasedAtFieldValue",
    );
    final json = {
      if (itemId != _sentinel)
        _$UserPurchaseFieldMap['itemId']!:
            _$UserPurchasePerFieldToJson.itemId(itemId as String),
      if (itemIdFieldValue != null)
        _$UserPurchaseFieldMap['itemId']!: itemIdFieldValue,
      if (name != _sentinel)
        _$UserPurchaseFieldMap['name']!:
            _$UserPurchasePerFieldToJson.name(name as String),
      if (nameFieldValue != null)
        _$UserPurchaseFieldMap['name']!: nameFieldValue,
      if (type != _sentinel)
        _$UserPurchaseFieldMap['type']!:
            _$UserPurchasePerFieldToJson.type(type as String),
      if (typeFieldValue != null)
        _$UserPurchaseFieldMap['type']!: typeFieldValue,
      if (icon != _sentinel)
        _$UserPurchaseFieldMap['icon']!:
            _$UserPurchasePerFieldToJson.icon(icon as String),
      if (iconFieldValue != null)
        _$UserPurchaseFieldMap['icon']!: iconFieldValue,
      if (purchasedAt != _sentinel)
        _$UserPurchaseFieldMap['purchasedAt']!:
            _$UserPurchasePerFieldToJson.purchasedAt(purchasedAt as Timestamp),
      if (purchasedAtFieldValue != null)
        _$UserPurchaseFieldMap['purchasedAt']!: purchasedAtFieldValue,
    };

    batch.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is UserPurchasesDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class UserPurchasesQuery
    implements QueryReference<UserPurchase, UserPurchasesQuerySnapshot> {
  @override
  UserPurchasesQuery limit(int limit);

  @override
  UserPurchasesQuery limitToLast(int limit);

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  UserPurchasesQuery whereFieldPath(
    Object fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  UserPurchasesQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  UserPurchasesQuery whereItemId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  UserPurchasesQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  UserPurchasesQuery whereType({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  UserPurchasesQuery whereIcon({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  UserPurchasesQuery wherePurchasedAt({
    Timestamp? isEqualTo,
    Timestamp? isNotEqualTo,
    Timestamp? isLessThan,
    Timestamp? isLessThanOrEqualTo,
    Timestamp? isGreaterThan,
    Timestamp? isGreaterThanOrEqualTo,
    List<Timestamp>? whereIn,
    List<Timestamp>? whereNotIn,
    bool? isNull,
  });

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  UserPurchasesQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object startAt,
    Object startAfter,
    Object endAt,
    Object endBefore,
    UserPurchasesDocumentSnapshot? startAtDocument,
    UserPurchasesDocumentSnapshot? endAtDocument,
    UserPurchasesDocumentSnapshot? endBeforeDocument,
    UserPurchasesDocumentSnapshot? startAfterDocument,
  });

  UserPurchasesQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    UserPurchasesDocumentSnapshot? startAtDocument,
    UserPurchasesDocumentSnapshot? endAtDocument,
    UserPurchasesDocumentSnapshot? endBeforeDocument,
    UserPurchasesDocumentSnapshot? startAfterDocument,
  });

  UserPurchasesQuery orderByItemId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    UserPurchasesDocumentSnapshot? startAtDocument,
    UserPurchasesDocumentSnapshot? endAtDocument,
    UserPurchasesDocumentSnapshot? endBeforeDocument,
    UserPurchasesDocumentSnapshot? startAfterDocument,
  });

  UserPurchasesQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    UserPurchasesDocumentSnapshot? startAtDocument,
    UserPurchasesDocumentSnapshot? endAtDocument,
    UserPurchasesDocumentSnapshot? endBeforeDocument,
    UserPurchasesDocumentSnapshot? startAfterDocument,
  });

  UserPurchasesQuery orderByType({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    UserPurchasesDocumentSnapshot? startAtDocument,
    UserPurchasesDocumentSnapshot? endAtDocument,
    UserPurchasesDocumentSnapshot? endBeforeDocument,
    UserPurchasesDocumentSnapshot? startAfterDocument,
  });

  UserPurchasesQuery orderByIcon({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    UserPurchasesDocumentSnapshot? startAtDocument,
    UserPurchasesDocumentSnapshot? endAtDocument,
    UserPurchasesDocumentSnapshot? endBeforeDocument,
    UserPurchasesDocumentSnapshot? startAfterDocument,
  });

  UserPurchasesQuery orderByPurchasedAt({
    bool descending = false,
    Timestamp startAt,
    Timestamp startAfter,
    Timestamp endAt,
    Timestamp endBefore,
    UserPurchasesDocumentSnapshot? startAtDocument,
    UserPurchasesDocumentSnapshot? endAtDocument,
    UserPurchasesDocumentSnapshot? endBeforeDocument,
    UserPurchasesDocumentSnapshot? startAfterDocument,
  });
}

class _$UserPurchasesQuery
    extends QueryReference<UserPurchase, UserPurchasesQuerySnapshot>
    implements UserPurchasesQuery {
  _$UserPurchasesQuery(
    this._collection, {
    required Query<UserPurchase> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<UserPurchasesQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference
        .snapshots()
        .map(UserPurchasesQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<UserPurchasesQuerySnapshot> get([GetOptions? options]) {
    return reference
        .get(options)
        .then(UserPurchasesQuerySnapshot._fromQuerySnapshot);
  }

  @override
  UserPurchasesQuery limit(int limit) {
    return _$UserPurchasesQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserPurchasesQuery limitToLast(int limit) {
    return _$UserPurchasesQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserPurchasesQuery whereFieldPath(
    Object fieldPath, {
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserPurchasesQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        fieldPath,
        isEqualTo: isEqualTo != _sentinel ? isEqualTo : null,
        isNotEqualTo: isNotEqualTo != _sentinel ? isNotEqualTo : null,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserPurchasesQuery whereDocumentId({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserPurchasesQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo != _sentinel ? isEqualTo : null,
        isNotEqualTo: isNotEqualTo != _sentinel ? isNotEqualTo : null,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserPurchasesQuery whereItemId({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserPurchasesQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserPurchaseFieldMap['itemId']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserPurchasePerFieldToJson.itemId(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserPurchasePerFieldToJson.itemId(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$UserPurchasePerFieldToJson.itemId(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserPurchasePerFieldToJson.itemId(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserPurchasePerFieldToJson.itemId(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserPurchasePerFieldToJson
                .itemId(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$UserPurchasePerFieldToJson.itemId(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$UserPurchasePerFieldToJson.itemId(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserPurchasesQuery whereName({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserPurchasesQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserPurchaseFieldMap['name']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserPurchasePerFieldToJson.name(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserPurchasePerFieldToJson.name(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$UserPurchasePerFieldToJson.name(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserPurchasePerFieldToJson.name(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserPurchasePerFieldToJson.name(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserPurchasePerFieldToJson
                .name(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$UserPurchasePerFieldToJson.name(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$UserPurchasePerFieldToJson.name(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserPurchasesQuery whereType({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserPurchasesQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserPurchaseFieldMap['type']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserPurchasePerFieldToJson.type(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserPurchasePerFieldToJson.type(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$UserPurchasePerFieldToJson.type(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserPurchasePerFieldToJson.type(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserPurchasePerFieldToJson.type(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserPurchasePerFieldToJson
                .type(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$UserPurchasePerFieldToJson.type(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$UserPurchasePerFieldToJson.type(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserPurchasesQuery whereIcon({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserPurchasesQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserPurchaseFieldMap['icon']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserPurchasePerFieldToJson.icon(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserPurchasePerFieldToJson.icon(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$UserPurchasePerFieldToJson.icon(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserPurchasePerFieldToJson.icon(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserPurchasePerFieldToJson.icon(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserPurchasePerFieldToJson
                .icon(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$UserPurchasePerFieldToJson.icon(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$UserPurchasePerFieldToJson.icon(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserPurchasesQuery wherePurchasedAt({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<Timestamp>? whereIn,
    List<Timestamp>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserPurchasesQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserPurchaseFieldMap['purchasedAt']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$UserPurchasePerFieldToJson.purchasedAt(isEqualTo as Timestamp)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$UserPurchasePerFieldToJson
                .purchasedAt(isNotEqualTo as Timestamp)
            : null,
        isLessThan: isLessThan != null
            ? _$UserPurchasePerFieldToJson.purchasedAt(isLessThan as Timestamp)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$UserPurchasePerFieldToJson
                .purchasedAt(isLessThanOrEqualTo as Timestamp)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$UserPurchasePerFieldToJson
                .purchasedAt(isGreaterThan as Timestamp)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$UserPurchasePerFieldToJson
                .purchasedAt(isGreaterThanOrEqualTo as Timestamp)
            : null,
        whereIn:
            whereIn?.map((e) => _$UserPurchasePerFieldToJson.purchasedAt(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$UserPurchasePerFieldToJson.purchasedAt(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserPurchasesQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserPurchasesDocumentSnapshot? startAtDocument,
    UserPurchasesDocumentSnapshot? endAtDocument,
    UserPurchasesDocumentSnapshot? endBeforeDocument,
    UserPurchasesDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy(fieldPath, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserPurchasesQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserPurchasesQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserPurchasesDocumentSnapshot? startAtDocument,
    UserPurchasesDocumentSnapshot? endAtDocument,
    UserPurchasesDocumentSnapshot? endBeforeDocument,
    UserPurchasesDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(FieldPath.documentId,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserPurchasesQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserPurchasesQuery orderByItemId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserPurchasesDocumentSnapshot? startAtDocument,
    UserPurchasesDocumentSnapshot? endAtDocument,
    UserPurchasesDocumentSnapshot? endBeforeDocument,
    UserPurchasesDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$UserPurchaseFieldMap['itemId']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserPurchasesQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserPurchasesQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserPurchasesDocumentSnapshot? startAtDocument,
    UserPurchasesDocumentSnapshot? endAtDocument,
    UserPurchasesDocumentSnapshot? endBeforeDocument,
    UserPurchasesDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$UserPurchaseFieldMap['name']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserPurchasesQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserPurchasesQuery orderByType({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserPurchasesDocumentSnapshot? startAtDocument,
    UserPurchasesDocumentSnapshot? endAtDocument,
    UserPurchasesDocumentSnapshot? endBeforeDocument,
    UserPurchasesDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$UserPurchaseFieldMap['type']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserPurchasesQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserPurchasesQuery orderByIcon({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserPurchasesDocumentSnapshot? startAtDocument,
    UserPurchasesDocumentSnapshot? endAtDocument,
    UserPurchasesDocumentSnapshot? endBeforeDocument,
    UserPurchasesDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$UserPurchaseFieldMap['icon']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserPurchasesQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserPurchasesQuery orderByPurchasedAt({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserPurchasesDocumentSnapshot? startAtDocument,
    UserPurchasesDocumentSnapshot? endAtDocument,
    UserPurchasesDocumentSnapshot? endBeforeDocument,
    UserPurchasesDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$UserPurchaseFieldMap['purchasedAt']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserPurchasesQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$UserPurchasesQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class UserPurchasesDocumentSnapshot
    extends FirestoreDocumentSnapshot<UserPurchase> {
  UserPurchasesDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<UserPurchase> snapshot;

  @override
  UserPurchasesDocumentReference get reference {
    return UserPurchasesDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final UserPurchase? data;
}

class UserPurchasesQuerySnapshot extends FirestoreQuerySnapshot<UserPurchase,
    UserPurchasesQueryDocumentSnapshot> {
  UserPurchasesQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory UserPurchasesQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<UserPurchase> snapshot,
  ) {
    final docs =
        snapshot.docs.map(UserPurchasesQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        UserPurchasesDocumentSnapshot._,
      );
    }).toList();

    return UserPurchasesQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<UserPurchasesDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    UserPurchasesDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<UserPurchasesDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<UserPurchase> snapshot;

  @override
  final List<UserPurchasesQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<UserPurchasesDocumentSnapshot>> docChanges;
}

class UserPurchasesQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<UserPurchase>
    implements UserPurchasesDocumentSnapshot {
  UserPurchasesQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<UserPurchase> snapshot;

  @override
  final UserPurchase data;

  @override
  UserPurchasesDocumentReference get reference {
    return UserPurchasesDocumentReference(snapshot.reference);
  }
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class RewardsCollectionReference
    implements
        RewardsQuery,
        FirestoreCollectionReference<Reward, RewardsQuerySnapshot> {
  factory RewardsCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$RewardsCollectionReference;

  static Reward fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$RewardFromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Reward value,
    SetOptions? options,
  ) {
    return _$RewardToJson(value);
  }

  @override
  CollectionReference<Reward> get reference;

  @override
  RewardsDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<RewardsDocumentReference> add(Reward value);
}

class _$RewardsCollectionReference extends _$RewardsQuery
    implements RewardsCollectionReference {
  factory _$RewardsCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$RewardsCollectionReference._(
      firestore.collection('rewards').withConverter(
            fromFirestore: RewardsCollectionReference.fromFirestore,
            toFirestore: RewardsCollectionReference.toFirestore,
          ),
    );
  }

  _$RewardsCollectionReference._(
    CollectionReference<Reward> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<Reward> get reference =>
      super.reference as CollectionReference<Reward>;

  @override
  RewardsDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return RewardsDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<RewardsDocumentReference> add(Reward value) {
    return reference.add(value).then((ref) => RewardsDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$RewardsCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class RewardsDocumentReference
    extends FirestoreDocumentReference<Reward, RewardsDocumentSnapshot> {
  factory RewardsDocumentReference(DocumentReference<Reward> reference) =
      _$RewardsDocumentReference;

  DocumentReference<Reward> get reference;

  /// A reference to the [RewardsCollectionReference] containing this document.
  RewardsCollectionReference get parent {
    return _$RewardsCollectionReference(reference.firestore);
  }

  @override
  Stream<RewardsDocumentSnapshot> snapshots();

  @override
  Future<RewardsDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Sets data on the document, overwriting any existing data. If the document
  /// does not yet exist, it will be created.
  ///
  /// If [SetOptions] are provided, the data can be merged into an existing
  /// document instead of overwriting.
  ///
  /// Any [FieldValue]s provided will replace the corresponding fields in the
  /// [model] during serialization.
  Future<void> set(
    Reward model, {
    SetOptions? options,
    FieldValue idFieldValue,
    FieldValue nameFieldValue,
    FieldValue typeFieldValue,
    FieldValue descriptionFieldValue,
    FieldValue starPointsFieldValue,
  });

  /// Writes to the document using the transaction API.
  ///
  /// If the document does not exist yet, it will be created. If you pass
  /// [SetOptions], the provided data can be merged into the existing document.
  ///
  /// Any [FieldValue]s provided will replace the corresponding fields in the
  /// [model] during serialization.
  void transactionSet(
    Transaction transaction,
    Reward model, {
    SetOptions? options,
    FieldValue idFieldValue,
    FieldValue nameFieldValue,
    FieldValue typeFieldValue,
    FieldValue descriptionFieldValue,
    FieldValue starPointsFieldValue,
  });

  /// Writes to the document using the batch API.
  ///
  /// If the document does not exist yet, it will be created. If you pass
  /// [SetOptions], the provided data can be merged into the existing document.
  ///
  /// Any [FieldValue]s provided will replace the corresponding fields in the
  /// [model] during serialization.
  void batchSet(
    WriteBatch batch,
    Reward model, {
    SetOptions? options,
    FieldValue idFieldValue,
    FieldValue nameFieldValue,
    FieldValue typeFieldValue,
    FieldValue descriptionFieldValue,
    FieldValue starPointsFieldValue,
  });

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String id,
    FieldValue idFieldValue,
    String name,
    FieldValue nameFieldValue,
    String type,
    FieldValue typeFieldValue,
    String description,
    FieldValue descriptionFieldValue,
    int starPoints,
    FieldValue starPointsFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String id,
    FieldValue idFieldValue,
    String name,
    FieldValue nameFieldValue,
    String type,
    FieldValue typeFieldValue,
    String description,
    FieldValue descriptionFieldValue,
    int starPoints,
    FieldValue starPointsFieldValue,
  });

  /// Updates fields in the current document using the batch API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void batchUpdate(
    WriteBatch batch, {
    String id,
    FieldValue idFieldValue,
    String name,
    FieldValue nameFieldValue,
    String type,
    FieldValue typeFieldValue,
    String description,
    FieldValue descriptionFieldValue,
    int starPoints,
    FieldValue starPointsFieldValue,
  });
}

class _$RewardsDocumentReference
    extends FirestoreDocumentReference<Reward, RewardsDocumentSnapshot>
    implements RewardsDocumentReference {
  _$RewardsDocumentReference(this.reference);

  @override
  final DocumentReference<Reward> reference;

  /// A reference to the [RewardsCollectionReference] containing this document.
  RewardsCollectionReference get parent {
    return _$RewardsCollectionReference(reference.firestore);
  }

  @override
  Stream<RewardsDocumentSnapshot> snapshots() {
    return reference.snapshots().map(RewardsDocumentSnapshot._);
  }

  @override
  Future<RewardsDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(RewardsDocumentSnapshot._);
  }

  @override
  Future<RewardsDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(RewardsDocumentSnapshot._);
  }

  Future<void> set(
    Reward model, {
    SetOptions? options,
    FieldValue? idFieldValue,
    FieldValue? nameFieldValue,
    FieldValue? typeFieldValue,
    FieldValue? descriptionFieldValue,
    FieldValue? starPointsFieldValue,
  }) async {
    final json = {
      ..._$RewardToJson(model),
      if (idFieldValue != null) _$RewardFieldMap['id']!: idFieldValue,
      if (nameFieldValue != null) _$RewardFieldMap['name']!: nameFieldValue,
      if (typeFieldValue != null) _$RewardFieldMap['type']!: typeFieldValue,
      if (descriptionFieldValue != null)
        _$RewardFieldMap['description']!: descriptionFieldValue,
      if (starPointsFieldValue != null)
        _$RewardFieldMap['starPoints']!: starPointsFieldValue,
    };

    final castedReference = reference.withConverter<Map<String, dynamic>>(
      fromFirestore: (snapshot, options) => throw UnimplementedError(),
      toFirestore: (value, options) => value,
    );
    return castedReference.set(json, options);
  }

  void transactionSet(
    Transaction transaction,
    Reward model, {
    SetOptions? options,
    FieldValue? idFieldValue,
    FieldValue? nameFieldValue,
    FieldValue? typeFieldValue,
    FieldValue? descriptionFieldValue,
    FieldValue? starPointsFieldValue,
  }) {
    final json = {
      ..._$RewardToJson(model),
      if (idFieldValue != null) _$RewardFieldMap['id']!: idFieldValue,
      if (nameFieldValue != null) _$RewardFieldMap['name']!: nameFieldValue,
      if (typeFieldValue != null) _$RewardFieldMap['type']!: typeFieldValue,
      if (descriptionFieldValue != null)
        _$RewardFieldMap['description']!: descriptionFieldValue,
      if (starPointsFieldValue != null)
        _$RewardFieldMap['starPoints']!: starPointsFieldValue,
    };

    transaction.set(reference, json, options);
  }

  void batchSet(
    WriteBatch batch,
    Reward model, {
    SetOptions? options,
    FieldValue? idFieldValue,
    FieldValue? nameFieldValue,
    FieldValue? typeFieldValue,
    FieldValue? descriptionFieldValue,
    FieldValue? starPointsFieldValue,
  }) {
    final json = {
      ..._$RewardToJson(model),
      if (idFieldValue != null) _$RewardFieldMap['id']!: idFieldValue,
      if (nameFieldValue != null) _$RewardFieldMap['name']!: nameFieldValue,
      if (typeFieldValue != null) _$RewardFieldMap['type']!: typeFieldValue,
      if (descriptionFieldValue != null)
        _$RewardFieldMap['description']!: descriptionFieldValue,
      if (starPointsFieldValue != null)
        _$RewardFieldMap['starPoints']!: starPointsFieldValue,
    };

    batch.set(reference, json, options);
  }

  Future<void> update({
    Object? id = _sentinel,
    FieldValue? idFieldValue,
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? type = _sentinel,
    FieldValue? typeFieldValue,
    Object? description = _sentinel,
    FieldValue? descriptionFieldValue,
    Object? starPoints = _sentinel,
    FieldValue? starPointsFieldValue,
  }) async {
    assert(
      id == _sentinel || idFieldValue == null,
      "Cannot specify both id and idFieldValue",
    );
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      type == _sentinel || typeFieldValue == null,
      "Cannot specify both type and typeFieldValue",
    );
    assert(
      description == _sentinel || descriptionFieldValue == null,
      "Cannot specify both description and descriptionFieldValue",
    );
    assert(
      starPoints == _sentinel || starPointsFieldValue == null,
      "Cannot specify both starPoints and starPointsFieldValue",
    );
    final json = {
      if (id != _sentinel)
        _$RewardFieldMap['id']!: _$RewardPerFieldToJson.id(id as String),
      if (idFieldValue != null) _$RewardFieldMap['id']!: idFieldValue,
      if (name != _sentinel)
        _$RewardFieldMap['name']!: _$RewardPerFieldToJson.name(name as String),
      if (nameFieldValue != null) _$RewardFieldMap['name']!: nameFieldValue,
      if (type != _sentinel)
        _$RewardFieldMap['type']!: _$RewardPerFieldToJson.type(type as String),
      if (typeFieldValue != null) _$RewardFieldMap['type']!: typeFieldValue,
      if (description != _sentinel)
        _$RewardFieldMap['description']!:
            _$RewardPerFieldToJson.description(description as String),
      if (descriptionFieldValue != null)
        _$RewardFieldMap['description']!: descriptionFieldValue,
      if (starPoints != _sentinel)
        _$RewardFieldMap['starPoints']!:
            _$RewardPerFieldToJson.starPoints(starPoints as int),
      if (starPointsFieldValue != null)
        _$RewardFieldMap['starPoints']!: starPointsFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? id = _sentinel,
    FieldValue? idFieldValue,
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? type = _sentinel,
    FieldValue? typeFieldValue,
    Object? description = _sentinel,
    FieldValue? descriptionFieldValue,
    Object? starPoints = _sentinel,
    FieldValue? starPointsFieldValue,
  }) {
    assert(
      id == _sentinel || idFieldValue == null,
      "Cannot specify both id and idFieldValue",
    );
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      type == _sentinel || typeFieldValue == null,
      "Cannot specify both type and typeFieldValue",
    );
    assert(
      description == _sentinel || descriptionFieldValue == null,
      "Cannot specify both description and descriptionFieldValue",
    );
    assert(
      starPoints == _sentinel || starPointsFieldValue == null,
      "Cannot specify both starPoints and starPointsFieldValue",
    );
    final json = {
      if (id != _sentinel)
        _$RewardFieldMap['id']!: _$RewardPerFieldToJson.id(id as String),
      if (idFieldValue != null) _$RewardFieldMap['id']!: idFieldValue,
      if (name != _sentinel)
        _$RewardFieldMap['name']!: _$RewardPerFieldToJson.name(name as String),
      if (nameFieldValue != null) _$RewardFieldMap['name']!: nameFieldValue,
      if (type != _sentinel)
        _$RewardFieldMap['type']!: _$RewardPerFieldToJson.type(type as String),
      if (typeFieldValue != null) _$RewardFieldMap['type']!: typeFieldValue,
      if (description != _sentinel)
        _$RewardFieldMap['description']!:
            _$RewardPerFieldToJson.description(description as String),
      if (descriptionFieldValue != null)
        _$RewardFieldMap['description']!: descriptionFieldValue,
      if (starPoints != _sentinel)
        _$RewardFieldMap['starPoints']!:
            _$RewardPerFieldToJson.starPoints(starPoints as int),
      if (starPointsFieldValue != null)
        _$RewardFieldMap['starPoints']!: starPointsFieldValue,
    };

    transaction.update(reference, json);
  }

  void batchUpdate(
    WriteBatch batch, {
    Object? id = _sentinel,
    FieldValue? idFieldValue,
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? type = _sentinel,
    FieldValue? typeFieldValue,
    Object? description = _sentinel,
    FieldValue? descriptionFieldValue,
    Object? starPoints = _sentinel,
    FieldValue? starPointsFieldValue,
  }) {
    assert(
      id == _sentinel || idFieldValue == null,
      "Cannot specify both id and idFieldValue",
    );
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      type == _sentinel || typeFieldValue == null,
      "Cannot specify both type and typeFieldValue",
    );
    assert(
      description == _sentinel || descriptionFieldValue == null,
      "Cannot specify both description and descriptionFieldValue",
    );
    assert(
      starPoints == _sentinel || starPointsFieldValue == null,
      "Cannot specify both starPoints and starPointsFieldValue",
    );
    final json = {
      if (id != _sentinel)
        _$RewardFieldMap['id']!: _$RewardPerFieldToJson.id(id as String),
      if (idFieldValue != null) _$RewardFieldMap['id']!: idFieldValue,
      if (name != _sentinel)
        _$RewardFieldMap['name']!: _$RewardPerFieldToJson.name(name as String),
      if (nameFieldValue != null) _$RewardFieldMap['name']!: nameFieldValue,
      if (type != _sentinel)
        _$RewardFieldMap['type']!: _$RewardPerFieldToJson.type(type as String),
      if (typeFieldValue != null) _$RewardFieldMap['type']!: typeFieldValue,
      if (description != _sentinel)
        _$RewardFieldMap['description']!:
            _$RewardPerFieldToJson.description(description as String),
      if (descriptionFieldValue != null)
        _$RewardFieldMap['description']!: descriptionFieldValue,
      if (starPoints != _sentinel)
        _$RewardFieldMap['starPoints']!:
            _$RewardPerFieldToJson.starPoints(starPoints as int),
      if (starPointsFieldValue != null)
        _$RewardFieldMap['starPoints']!: starPointsFieldValue,
    };

    batch.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is RewardsDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class RewardsQuery
    implements QueryReference<Reward, RewardsQuerySnapshot> {
  @override
  RewardsQuery limit(int limit);

  @override
  RewardsQuery limitToLast(int limit);

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  RewardsQuery whereFieldPath(
    Object fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  RewardsQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  RewardsQuery whereId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  RewardsQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  RewardsQuery whereType({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  RewardsQuery whereDescription({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  RewardsQuery whereStarPoints({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    List<int>? whereIn,
    List<int>? whereNotIn,
    bool? isNull,
  });

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  RewardsQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object startAt,
    Object startAfter,
    Object endAt,
    Object endBefore,
    RewardsDocumentSnapshot? startAtDocument,
    RewardsDocumentSnapshot? endAtDocument,
    RewardsDocumentSnapshot? endBeforeDocument,
    RewardsDocumentSnapshot? startAfterDocument,
  });

  RewardsQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    RewardsDocumentSnapshot? startAtDocument,
    RewardsDocumentSnapshot? endAtDocument,
    RewardsDocumentSnapshot? endBeforeDocument,
    RewardsDocumentSnapshot? startAfterDocument,
  });

  RewardsQuery orderById({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    RewardsDocumentSnapshot? startAtDocument,
    RewardsDocumentSnapshot? endAtDocument,
    RewardsDocumentSnapshot? endBeforeDocument,
    RewardsDocumentSnapshot? startAfterDocument,
  });

  RewardsQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    RewardsDocumentSnapshot? startAtDocument,
    RewardsDocumentSnapshot? endAtDocument,
    RewardsDocumentSnapshot? endBeforeDocument,
    RewardsDocumentSnapshot? startAfterDocument,
  });

  RewardsQuery orderByType({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    RewardsDocumentSnapshot? startAtDocument,
    RewardsDocumentSnapshot? endAtDocument,
    RewardsDocumentSnapshot? endBeforeDocument,
    RewardsDocumentSnapshot? startAfterDocument,
  });

  RewardsQuery orderByDescription({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    RewardsDocumentSnapshot? startAtDocument,
    RewardsDocumentSnapshot? endAtDocument,
    RewardsDocumentSnapshot? endBeforeDocument,
    RewardsDocumentSnapshot? startAfterDocument,
  });

  RewardsQuery orderByStarPoints({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    RewardsDocumentSnapshot? startAtDocument,
    RewardsDocumentSnapshot? endAtDocument,
    RewardsDocumentSnapshot? endBeforeDocument,
    RewardsDocumentSnapshot? startAfterDocument,
  });
}

class _$RewardsQuery extends QueryReference<Reward, RewardsQuerySnapshot>
    implements RewardsQuery {
  _$RewardsQuery(
    this._collection, {
    required Query<Reward> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<RewardsQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(RewardsQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<RewardsQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(RewardsQuerySnapshot._fromQuerySnapshot);
  }

  @override
  RewardsQuery limit(int limit) {
    return _$RewardsQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  RewardsQuery limitToLast(int limit) {
    return _$RewardsQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  RewardsQuery whereFieldPath(
    Object fieldPath, {
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$RewardsQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        fieldPath,
        isEqualTo: isEqualTo != _sentinel ? isEqualTo : null,
        isNotEqualTo: isNotEqualTo != _sentinel ? isNotEqualTo : null,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  RewardsQuery whereDocumentId({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$RewardsQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo != _sentinel ? isEqualTo : null,
        isNotEqualTo: isNotEqualTo != _sentinel ? isNotEqualTo : null,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  RewardsQuery whereId({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$RewardsQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$RewardFieldMap['id']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$RewardPerFieldToJson.id(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$RewardPerFieldToJson.id(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$RewardPerFieldToJson.id(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$RewardPerFieldToJson.id(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$RewardPerFieldToJson.id(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$RewardPerFieldToJson.id(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$RewardPerFieldToJson.id(e)),
        whereNotIn: whereNotIn?.map((e) => _$RewardPerFieldToJson.id(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  RewardsQuery whereName({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$RewardsQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$RewardFieldMap['name']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$RewardPerFieldToJson.name(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$RewardPerFieldToJson.name(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$RewardPerFieldToJson.name(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$RewardPerFieldToJson.name(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$RewardPerFieldToJson.name(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$RewardPerFieldToJson.name(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$RewardPerFieldToJson.name(e)),
        whereNotIn: whereNotIn?.map((e) => _$RewardPerFieldToJson.name(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  RewardsQuery whereType({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$RewardsQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$RewardFieldMap['type']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$RewardPerFieldToJson.type(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$RewardPerFieldToJson.type(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$RewardPerFieldToJson.type(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$RewardPerFieldToJson.type(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$RewardPerFieldToJson.type(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$RewardPerFieldToJson.type(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$RewardPerFieldToJson.type(e)),
        whereNotIn: whereNotIn?.map((e) => _$RewardPerFieldToJson.type(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  RewardsQuery whereDescription({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$RewardsQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$RewardFieldMap['description']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$RewardPerFieldToJson.description(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$RewardPerFieldToJson.description(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$RewardPerFieldToJson.description(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$RewardPerFieldToJson.description(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$RewardPerFieldToJson.description(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$RewardPerFieldToJson
                .description(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$RewardPerFieldToJson.description(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$RewardPerFieldToJson.description(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  RewardsQuery whereStarPoints({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<int>? whereIn,
    List<int>? whereNotIn,
    bool? isNull,
  }) {
    return _$RewardsQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$RewardFieldMap['starPoints']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$RewardPerFieldToJson.starPoints(isEqualTo as int)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$RewardPerFieldToJson.starPoints(isNotEqualTo as int)
            : null,
        isLessThan: isLessThan != null
            ? _$RewardPerFieldToJson.starPoints(isLessThan as int)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$RewardPerFieldToJson.starPoints(isLessThanOrEqualTo as int)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$RewardPerFieldToJson.starPoints(isGreaterThan as int)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$RewardPerFieldToJson.starPoints(isGreaterThanOrEqualTo as int)
            : null,
        whereIn: whereIn?.map((e) => _$RewardPerFieldToJson.starPoints(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$RewardPerFieldToJson.starPoints(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  RewardsQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RewardsDocumentSnapshot? startAtDocument,
    RewardsDocumentSnapshot? endAtDocument,
    RewardsDocumentSnapshot? endBeforeDocument,
    RewardsDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy(fieldPath, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$RewardsQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  RewardsQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RewardsDocumentSnapshot? startAtDocument,
    RewardsDocumentSnapshot? endAtDocument,
    RewardsDocumentSnapshot? endBeforeDocument,
    RewardsDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(FieldPath.documentId,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$RewardsQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  RewardsQuery orderById({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RewardsDocumentSnapshot? startAtDocument,
    RewardsDocumentSnapshot? endAtDocument,
    RewardsDocumentSnapshot? endBeforeDocument,
    RewardsDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$RewardFieldMap['id']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$RewardsQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  RewardsQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RewardsDocumentSnapshot? startAtDocument,
    RewardsDocumentSnapshot? endAtDocument,
    RewardsDocumentSnapshot? endBeforeDocument,
    RewardsDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$RewardFieldMap['name']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$RewardsQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  RewardsQuery orderByType({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RewardsDocumentSnapshot? startAtDocument,
    RewardsDocumentSnapshot? endAtDocument,
    RewardsDocumentSnapshot? endBeforeDocument,
    RewardsDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$RewardFieldMap['type']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$RewardsQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  RewardsQuery orderByDescription({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RewardsDocumentSnapshot? startAtDocument,
    RewardsDocumentSnapshot? endAtDocument,
    RewardsDocumentSnapshot? endBeforeDocument,
    RewardsDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$RewardFieldMap['description']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$RewardsQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  RewardsQuery orderByStarPoints({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RewardsDocumentSnapshot? startAtDocument,
    RewardsDocumentSnapshot? endAtDocument,
    RewardsDocumentSnapshot? endBeforeDocument,
    RewardsDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$RewardFieldMap['starPoints']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$RewardsQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$RewardsQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class RewardsDocumentSnapshot extends FirestoreDocumentSnapshot<Reward> {
  RewardsDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<Reward> snapshot;

  @override
  RewardsDocumentReference get reference {
    return RewardsDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Reward? data;
}

class RewardsQuerySnapshot
    extends FirestoreQuerySnapshot<Reward, RewardsQueryDocumentSnapshot> {
  RewardsQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory RewardsQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<Reward> snapshot,
  ) {
    final docs = snapshot.docs.map(RewardsQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        RewardsDocumentSnapshot._,
      );
    }).toList();

    return RewardsQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<RewardsDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    RewardsDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<RewardsDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<Reward> snapshot;

  @override
  final List<RewardsQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<RewardsDocumentSnapshot>> docChanges;
}

class RewardsQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<Reward>
    implements RewardsDocumentSnapshot {
  RewardsQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<Reward> snapshot;

  @override
  final Reward data;

  @override
  RewardsDocumentReference get reference {
    return RewardsDocumentReference(snapshot.reference);
  }
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class ShopCollectionReference
    implements
        ShopQuery,
        FirestoreCollectionReference<ShopItem, ShopQuerySnapshot> {
  factory ShopCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$ShopCollectionReference;

  static ShopItem fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$ShopItemFromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    ShopItem value,
    SetOptions? options,
  ) {
    return _$ShopItemToJson(value);
  }

  @override
  CollectionReference<ShopItem> get reference;

  @override
  ShopDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<ShopDocumentReference> add(ShopItem value);
}

class _$ShopCollectionReference extends _$ShopQuery
    implements ShopCollectionReference {
  factory _$ShopCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$ShopCollectionReference._(
      firestore.collection('shop').withConverter(
            fromFirestore: ShopCollectionReference.fromFirestore,
            toFirestore: ShopCollectionReference.toFirestore,
          ),
    );
  }

  _$ShopCollectionReference._(
    CollectionReference<ShopItem> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<ShopItem> get reference =>
      super.reference as CollectionReference<ShopItem>;

  @override
  ShopDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return ShopDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<ShopDocumentReference> add(ShopItem value) {
    return reference.add(value).then((ref) => ShopDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$ShopCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class ShopDocumentReference
    extends FirestoreDocumentReference<ShopItem, ShopDocumentSnapshot> {
  factory ShopDocumentReference(DocumentReference<ShopItem> reference) =
      _$ShopDocumentReference;

  DocumentReference<ShopItem> get reference;

  /// A reference to the [ShopCollectionReference] containing this document.
  ShopCollectionReference get parent {
    return _$ShopCollectionReference(reference.firestore);
  }

  @override
  Stream<ShopDocumentSnapshot> snapshots();

  @override
  Future<ShopDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Sets data on the document, overwriting any existing data. If the document
  /// does not yet exist, it will be created.
  ///
  /// If [SetOptions] are provided, the data can be merged into an existing
  /// document instead of overwriting.
  ///
  /// Any [FieldValue]s provided will replace the corresponding fields in the
  /// [model] during serialization.
  Future<void> set(
    ShopItem model, {
    SetOptions? options,
    FieldValue idFieldValue,
    FieldValue nameFieldValue,
    FieldValue typeFieldValue,
    FieldValue descriptionFieldValue,
    FieldValue costFieldValue,
    FieldValue iconFieldValue,
  });

  /// Writes to the document using the transaction API.
  ///
  /// If the document does not exist yet, it will be created. If you pass
  /// [SetOptions], the provided data can be merged into the existing document.
  ///
  /// Any [FieldValue]s provided will replace the corresponding fields in the
  /// [model] during serialization.
  void transactionSet(
    Transaction transaction,
    ShopItem model, {
    SetOptions? options,
    FieldValue idFieldValue,
    FieldValue nameFieldValue,
    FieldValue typeFieldValue,
    FieldValue descriptionFieldValue,
    FieldValue costFieldValue,
    FieldValue iconFieldValue,
  });

  /// Writes to the document using the batch API.
  ///
  /// If the document does not exist yet, it will be created. If you pass
  /// [SetOptions], the provided data can be merged into the existing document.
  ///
  /// Any [FieldValue]s provided will replace the corresponding fields in the
  /// [model] during serialization.
  void batchSet(
    WriteBatch batch,
    ShopItem model, {
    SetOptions? options,
    FieldValue idFieldValue,
    FieldValue nameFieldValue,
    FieldValue typeFieldValue,
    FieldValue descriptionFieldValue,
    FieldValue costFieldValue,
    FieldValue iconFieldValue,
  });

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String id,
    FieldValue idFieldValue,
    String name,
    FieldValue nameFieldValue,
    String type,
    FieldValue typeFieldValue,
    String description,
    FieldValue descriptionFieldValue,
    int cost,
    FieldValue costFieldValue,
    String icon,
    FieldValue iconFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String id,
    FieldValue idFieldValue,
    String name,
    FieldValue nameFieldValue,
    String type,
    FieldValue typeFieldValue,
    String description,
    FieldValue descriptionFieldValue,
    int cost,
    FieldValue costFieldValue,
    String icon,
    FieldValue iconFieldValue,
  });

  /// Updates fields in the current document using the batch API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void batchUpdate(
    WriteBatch batch, {
    String id,
    FieldValue idFieldValue,
    String name,
    FieldValue nameFieldValue,
    String type,
    FieldValue typeFieldValue,
    String description,
    FieldValue descriptionFieldValue,
    int cost,
    FieldValue costFieldValue,
    String icon,
    FieldValue iconFieldValue,
  });
}

class _$ShopDocumentReference
    extends FirestoreDocumentReference<ShopItem, ShopDocumentSnapshot>
    implements ShopDocumentReference {
  _$ShopDocumentReference(this.reference);

  @override
  final DocumentReference<ShopItem> reference;

  /// A reference to the [ShopCollectionReference] containing this document.
  ShopCollectionReference get parent {
    return _$ShopCollectionReference(reference.firestore);
  }

  @override
  Stream<ShopDocumentSnapshot> snapshots() {
    return reference.snapshots().map(ShopDocumentSnapshot._);
  }

  @override
  Future<ShopDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(ShopDocumentSnapshot._);
  }

  @override
  Future<ShopDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(ShopDocumentSnapshot._);
  }

  Future<void> set(
    ShopItem model, {
    SetOptions? options,
    FieldValue? idFieldValue,
    FieldValue? nameFieldValue,
    FieldValue? typeFieldValue,
    FieldValue? descriptionFieldValue,
    FieldValue? costFieldValue,
    FieldValue? iconFieldValue,
  }) async {
    final json = {
      ..._$ShopItemToJson(model),
      if (idFieldValue != null) _$ShopItemFieldMap['id']!: idFieldValue,
      if (nameFieldValue != null) _$ShopItemFieldMap['name']!: nameFieldValue,
      if (typeFieldValue != null) _$ShopItemFieldMap['type']!: typeFieldValue,
      if (descriptionFieldValue != null)
        _$ShopItemFieldMap['description']!: descriptionFieldValue,
      if (costFieldValue != null) _$ShopItemFieldMap['cost']!: costFieldValue,
      if (iconFieldValue != null) _$ShopItemFieldMap['icon']!: iconFieldValue,
    };

    final castedReference = reference.withConverter<Map<String, dynamic>>(
      fromFirestore: (snapshot, options) => throw UnimplementedError(),
      toFirestore: (value, options) => value,
    );
    return castedReference.set(json, options);
  }

  void transactionSet(
    Transaction transaction,
    ShopItem model, {
    SetOptions? options,
    FieldValue? idFieldValue,
    FieldValue? nameFieldValue,
    FieldValue? typeFieldValue,
    FieldValue? descriptionFieldValue,
    FieldValue? costFieldValue,
    FieldValue? iconFieldValue,
  }) {
    final json = {
      ..._$ShopItemToJson(model),
      if (idFieldValue != null) _$ShopItemFieldMap['id']!: idFieldValue,
      if (nameFieldValue != null) _$ShopItemFieldMap['name']!: nameFieldValue,
      if (typeFieldValue != null) _$ShopItemFieldMap['type']!: typeFieldValue,
      if (descriptionFieldValue != null)
        _$ShopItemFieldMap['description']!: descriptionFieldValue,
      if (costFieldValue != null) _$ShopItemFieldMap['cost']!: costFieldValue,
      if (iconFieldValue != null) _$ShopItemFieldMap['icon']!: iconFieldValue,
    };

    transaction.set(reference, json, options);
  }

  void batchSet(
    WriteBatch batch,
    ShopItem model, {
    SetOptions? options,
    FieldValue? idFieldValue,
    FieldValue? nameFieldValue,
    FieldValue? typeFieldValue,
    FieldValue? descriptionFieldValue,
    FieldValue? costFieldValue,
    FieldValue? iconFieldValue,
  }) {
    final json = {
      ..._$ShopItemToJson(model),
      if (idFieldValue != null) _$ShopItemFieldMap['id']!: idFieldValue,
      if (nameFieldValue != null) _$ShopItemFieldMap['name']!: nameFieldValue,
      if (typeFieldValue != null) _$ShopItemFieldMap['type']!: typeFieldValue,
      if (descriptionFieldValue != null)
        _$ShopItemFieldMap['description']!: descriptionFieldValue,
      if (costFieldValue != null) _$ShopItemFieldMap['cost']!: costFieldValue,
      if (iconFieldValue != null) _$ShopItemFieldMap['icon']!: iconFieldValue,
    };

    batch.set(reference, json, options);
  }

  Future<void> update({
    Object? id = _sentinel,
    FieldValue? idFieldValue,
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? type = _sentinel,
    FieldValue? typeFieldValue,
    Object? description = _sentinel,
    FieldValue? descriptionFieldValue,
    Object? cost = _sentinel,
    FieldValue? costFieldValue,
    Object? icon = _sentinel,
    FieldValue? iconFieldValue,
  }) async {
    assert(
      id == _sentinel || idFieldValue == null,
      "Cannot specify both id and idFieldValue",
    );
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      type == _sentinel || typeFieldValue == null,
      "Cannot specify both type and typeFieldValue",
    );
    assert(
      description == _sentinel || descriptionFieldValue == null,
      "Cannot specify both description and descriptionFieldValue",
    );
    assert(
      cost == _sentinel || costFieldValue == null,
      "Cannot specify both cost and costFieldValue",
    );
    assert(
      icon == _sentinel || iconFieldValue == null,
      "Cannot specify both icon and iconFieldValue",
    );
    final json = {
      if (id != _sentinel)
        _$ShopItemFieldMap['id']!: _$ShopItemPerFieldToJson.id(id as String),
      if (idFieldValue != null) _$ShopItemFieldMap['id']!: idFieldValue,
      if (name != _sentinel)
        _$ShopItemFieldMap['name']!:
            _$ShopItemPerFieldToJson.name(name as String),
      if (nameFieldValue != null) _$ShopItemFieldMap['name']!: nameFieldValue,
      if (type != _sentinel)
        _$ShopItemFieldMap['type']!:
            _$ShopItemPerFieldToJson.type(type as String),
      if (typeFieldValue != null) _$ShopItemFieldMap['type']!: typeFieldValue,
      if (description != _sentinel)
        _$ShopItemFieldMap['description']!:
            _$ShopItemPerFieldToJson.description(description as String),
      if (descriptionFieldValue != null)
        _$ShopItemFieldMap['description']!: descriptionFieldValue,
      if (cost != _sentinel)
        _$ShopItemFieldMap['cost']!: _$ShopItemPerFieldToJson.cost(cost as int),
      if (costFieldValue != null) _$ShopItemFieldMap['cost']!: costFieldValue,
      if (icon != _sentinel)
        _$ShopItemFieldMap['icon']!:
            _$ShopItemPerFieldToJson.icon(icon as String),
      if (iconFieldValue != null) _$ShopItemFieldMap['icon']!: iconFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? id = _sentinel,
    FieldValue? idFieldValue,
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? type = _sentinel,
    FieldValue? typeFieldValue,
    Object? description = _sentinel,
    FieldValue? descriptionFieldValue,
    Object? cost = _sentinel,
    FieldValue? costFieldValue,
    Object? icon = _sentinel,
    FieldValue? iconFieldValue,
  }) {
    assert(
      id == _sentinel || idFieldValue == null,
      "Cannot specify both id and idFieldValue",
    );
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      type == _sentinel || typeFieldValue == null,
      "Cannot specify both type and typeFieldValue",
    );
    assert(
      description == _sentinel || descriptionFieldValue == null,
      "Cannot specify both description and descriptionFieldValue",
    );
    assert(
      cost == _sentinel || costFieldValue == null,
      "Cannot specify both cost and costFieldValue",
    );
    assert(
      icon == _sentinel || iconFieldValue == null,
      "Cannot specify both icon and iconFieldValue",
    );
    final json = {
      if (id != _sentinel)
        _$ShopItemFieldMap['id']!: _$ShopItemPerFieldToJson.id(id as String),
      if (idFieldValue != null) _$ShopItemFieldMap['id']!: idFieldValue,
      if (name != _sentinel)
        _$ShopItemFieldMap['name']!:
            _$ShopItemPerFieldToJson.name(name as String),
      if (nameFieldValue != null) _$ShopItemFieldMap['name']!: nameFieldValue,
      if (type != _sentinel)
        _$ShopItemFieldMap['type']!:
            _$ShopItemPerFieldToJson.type(type as String),
      if (typeFieldValue != null) _$ShopItemFieldMap['type']!: typeFieldValue,
      if (description != _sentinel)
        _$ShopItemFieldMap['description']!:
            _$ShopItemPerFieldToJson.description(description as String),
      if (descriptionFieldValue != null)
        _$ShopItemFieldMap['description']!: descriptionFieldValue,
      if (cost != _sentinel)
        _$ShopItemFieldMap['cost']!: _$ShopItemPerFieldToJson.cost(cost as int),
      if (costFieldValue != null) _$ShopItemFieldMap['cost']!: costFieldValue,
      if (icon != _sentinel)
        _$ShopItemFieldMap['icon']!:
            _$ShopItemPerFieldToJson.icon(icon as String),
      if (iconFieldValue != null) _$ShopItemFieldMap['icon']!: iconFieldValue,
    };

    transaction.update(reference, json);
  }

  void batchUpdate(
    WriteBatch batch, {
    Object? id = _sentinel,
    FieldValue? idFieldValue,
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? type = _sentinel,
    FieldValue? typeFieldValue,
    Object? description = _sentinel,
    FieldValue? descriptionFieldValue,
    Object? cost = _sentinel,
    FieldValue? costFieldValue,
    Object? icon = _sentinel,
    FieldValue? iconFieldValue,
  }) {
    assert(
      id == _sentinel || idFieldValue == null,
      "Cannot specify both id and idFieldValue",
    );
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      type == _sentinel || typeFieldValue == null,
      "Cannot specify both type and typeFieldValue",
    );
    assert(
      description == _sentinel || descriptionFieldValue == null,
      "Cannot specify both description and descriptionFieldValue",
    );
    assert(
      cost == _sentinel || costFieldValue == null,
      "Cannot specify both cost and costFieldValue",
    );
    assert(
      icon == _sentinel || iconFieldValue == null,
      "Cannot specify both icon and iconFieldValue",
    );
    final json = {
      if (id != _sentinel)
        _$ShopItemFieldMap['id']!: _$ShopItemPerFieldToJson.id(id as String),
      if (idFieldValue != null) _$ShopItemFieldMap['id']!: idFieldValue,
      if (name != _sentinel)
        _$ShopItemFieldMap['name']!:
            _$ShopItemPerFieldToJson.name(name as String),
      if (nameFieldValue != null) _$ShopItemFieldMap['name']!: nameFieldValue,
      if (type != _sentinel)
        _$ShopItemFieldMap['type']!:
            _$ShopItemPerFieldToJson.type(type as String),
      if (typeFieldValue != null) _$ShopItemFieldMap['type']!: typeFieldValue,
      if (description != _sentinel)
        _$ShopItemFieldMap['description']!:
            _$ShopItemPerFieldToJson.description(description as String),
      if (descriptionFieldValue != null)
        _$ShopItemFieldMap['description']!: descriptionFieldValue,
      if (cost != _sentinel)
        _$ShopItemFieldMap['cost']!: _$ShopItemPerFieldToJson.cost(cost as int),
      if (costFieldValue != null) _$ShopItemFieldMap['cost']!: costFieldValue,
      if (icon != _sentinel)
        _$ShopItemFieldMap['icon']!:
            _$ShopItemPerFieldToJson.icon(icon as String),
      if (iconFieldValue != null) _$ShopItemFieldMap['icon']!: iconFieldValue,
    };

    batch.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is ShopDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class ShopQuery
    implements QueryReference<ShopItem, ShopQuerySnapshot> {
  @override
  ShopQuery limit(int limit);

  @override
  ShopQuery limitToLast(int limit);

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  ShopQuery whereFieldPath(
    Object fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  ShopQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  ShopQuery whereId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  ShopQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  ShopQuery whereType({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  ShopQuery whereDescription({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  ShopQuery whereCost({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    List<int>? whereIn,
    List<int>? whereNotIn,
    bool? isNull,
  });

  ShopQuery whereIcon({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  ShopQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object startAt,
    Object startAfter,
    Object endAt,
    Object endBefore,
    ShopDocumentSnapshot? startAtDocument,
    ShopDocumentSnapshot? endAtDocument,
    ShopDocumentSnapshot? endBeforeDocument,
    ShopDocumentSnapshot? startAfterDocument,
  });

  ShopQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ShopDocumentSnapshot? startAtDocument,
    ShopDocumentSnapshot? endAtDocument,
    ShopDocumentSnapshot? endBeforeDocument,
    ShopDocumentSnapshot? startAfterDocument,
  });

  ShopQuery orderById({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ShopDocumentSnapshot? startAtDocument,
    ShopDocumentSnapshot? endAtDocument,
    ShopDocumentSnapshot? endBeforeDocument,
    ShopDocumentSnapshot? startAfterDocument,
  });

  ShopQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ShopDocumentSnapshot? startAtDocument,
    ShopDocumentSnapshot? endAtDocument,
    ShopDocumentSnapshot? endBeforeDocument,
    ShopDocumentSnapshot? startAfterDocument,
  });

  ShopQuery orderByType({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ShopDocumentSnapshot? startAtDocument,
    ShopDocumentSnapshot? endAtDocument,
    ShopDocumentSnapshot? endBeforeDocument,
    ShopDocumentSnapshot? startAfterDocument,
  });

  ShopQuery orderByDescription({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ShopDocumentSnapshot? startAtDocument,
    ShopDocumentSnapshot? endAtDocument,
    ShopDocumentSnapshot? endBeforeDocument,
    ShopDocumentSnapshot? startAfterDocument,
  });

  ShopQuery orderByCost({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    ShopDocumentSnapshot? startAtDocument,
    ShopDocumentSnapshot? endAtDocument,
    ShopDocumentSnapshot? endBeforeDocument,
    ShopDocumentSnapshot? startAfterDocument,
  });

  ShopQuery orderByIcon({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ShopDocumentSnapshot? startAtDocument,
    ShopDocumentSnapshot? endAtDocument,
    ShopDocumentSnapshot? endBeforeDocument,
    ShopDocumentSnapshot? startAfterDocument,
  });
}

class _$ShopQuery extends QueryReference<ShopItem, ShopQuerySnapshot>
    implements ShopQuery {
  _$ShopQuery(
    this._collection, {
    required Query<ShopItem> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<ShopQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(ShopQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<ShopQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(ShopQuerySnapshot._fromQuerySnapshot);
  }

  @override
  ShopQuery limit(int limit) {
    return _$ShopQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  ShopQuery limitToLast(int limit) {
    return _$ShopQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  ShopQuery whereFieldPath(
    Object fieldPath, {
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$ShopQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        fieldPath,
        isEqualTo: isEqualTo != _sentinel ? isEqualTo : null,
        isNotEqualTo: isNotEqualTo != _sentinel ? isNotEqualTo : null,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  ShopQuery whereDocumentId({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$ShopQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo != _sentinel ? isEqualTo : null,
        isNotEqualTo: isNotEqualTo != _sentinel ? isNotEqualTo : null,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  ShopQuery whereId({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$ShopQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$ShopItemFieldMap['id']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$ShopItemPerFieldToJson.id(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$ShopItemPerFieldToJson.id(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$ShopItemPerFieldToJson.id(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$ShopItemPerFieldToJson.id(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$ShopItemPerFieldToJson.id(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$ShopItemPerFieldToJson.id(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$ShopItemPerFieldToJson.id(e)),
        whereNotIn: whereNotIn?.map((e) => _$ShopItemPerFieldToJson.id(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  ShopQuery whereName({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$ShopQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$ShopItemFieldMap['name']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$ShopItemPerFieldToJson.name(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$ShopItemPerFieldToJson.name(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$ShopItemPerFieldToJson.name(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$ShopItemPerFieldToJson.name(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$ShopItemPerFieldToJson.name(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$ShopItemPerFieldToJson.name(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$ShopItemPerFieldToJson.name(e)),
        whereNotIn: whereNotIn?.map((e) => _$ShopItemPerFieldToJson.name(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  ShopQuery whereType({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$ShopQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$ShopItemFieldMap['type']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$ShopItemPerFieldToJson.type(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$ShopItemPerFieldToJson.type(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$ShopItemPerFieldToJson.type(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$ShopItemPerFieldToJson.type(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$ShopItemPerFieldToJson.type(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$ShopItemPerFieldToJson.type(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$ShopItemPerFieldToJson.type(e)),
        whereNotIn: whereNotIn?.map((e) => _$ShopItemPerFieldToJson.type(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  ShopQuery whereDescription({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$ShopQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$ShopItemFieldMap['description']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$ShopItemPerFieldToJson.description(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$ShopItemPerFieldToJson.description(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$ShopItemPerFieldToJson.description(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$ShopItemPerFieldToJson
                .description(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$ShopItemPerFieldToJson.description(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$ShopItemPerFieldToJson
                .description(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$ShopItemPerFieldToJson.description(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$ShopItemPerFieldToJson.description(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  ShopQuery whereCost({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<int>? whereIn,
    List<int>? whereNotIn,
    bool? isNull,
  }) {
    return _$ShopQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$ShopItemFieldMap['cost']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$ShopItemPerFieldToJson.cost(isEqualTo as int)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$ShopItemPerFieldToJson.cost(isNotEqualTo as int)
            : null,
        isLessThan: isLessThan != null
            ? _$ShopItemPerFieldToJson.cost(isLessThan as int)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$ShopItemPerFieldToJson.cost(isLessThanOrEqualTo as int)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$ShopItemPerFieldToJson.cost(isGreaterThan as int)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$ShopItemPerFieldToJson.cost(isGreaterThanOrEqualTo as int)
            : null,
        whereIn: whereIn?.map((e) => _$ShopItemPerFieldToJson.cost(e)),
        whereNotIn: whereNotIn?.map((e) => _$ShopItemPerFieldToJson.cost(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  ShopQuery whereIcon({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$ShopQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$ShopItemFieldMap['icon']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$ShopItemPerFieldToJson.icon(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$ShopItemPerFieldToJson.icon(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$ShopItemPerFieldToJson.icon(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$ShopItemPerFieldToJson.icon(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$ShopItemPerFieldToJson.icon(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$ShopItemPerFieldToJson.icon(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$ShopItemPerFieldToJson.icon(e)),
        whereNotIn: whereNotIn?.map((e) => _$ShopItemPerFieldToJson.icon(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  ShopQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ShopDocumentSnapshot? startAtDocument,
    ShopDocumentSnapshot? endAtDocument,
    ShopDocumentSnapshot? endBeforeDocument,
    ShopDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy(fieldPath, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$ShopQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  ShopQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ShopDocumentSnapshot? startAtDocument,
    ShopDocumentSnapshot? endAtDocument,
    ShopDocumentSnapshot? endBeforeDocument,
    ShopDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(FieldPath.documentId,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$ShopQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  ShopQuery orderById({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ShopDocumentSnapshot? startAtDocument,
    ShopDocumentSnapshot? endAtDocument,
    ShopDocumentSnapshot? endBeforeDocument,
    ShopDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$ShopItemFieldMap['id']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$ShopQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  ShopQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ShopDocumentSnapshot? startAtDocument,
    ShopDocumentSnapshot? endAtDocument,
    ShopDocumentSnapshot? endBeforeDocument,
    ShopDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$ShopItemFieldMap['name']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$ShopQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  ShopQuery orderByType({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ShopDocumentSnapshot? startAtDocument,
    ShopDocumentSnapshot? endAtDocument,
    ShopDocumentSnapshot? endBeforeDocument,
    ShopDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$ShopItemFieldMap['type']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$ShopQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  ShopQuery orderByDescription({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ShopDocumentSnapshot? startAtDocument,
    ShopDocumentSnapshot? endAtDocument,
    ShopDocumentSnapshot? endBeforeDocument,
    ShopDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$ShopItemFieldMap['description']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$ShopQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  ShopQuery orderByCost({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ShopDocumentSnapshot? startAtDocument,
    ShopDocumentSnapshot? endAtDocument,
    ShopDocumentSnapshot? endBeforeDocument,
    ShopDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$ShopItemFieldMap['cost']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$ShopQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  ShopQuery orderByIcon({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ShopDocumentSnapshot? startAtDocument,
    ShopDocumentSnapshot? endAtDocument,
    ShopDocumentSnapshot? endBeforeDocument,
    ShopDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$ShopItemFieldMap['icon']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$ShopQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$ShopQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class ShopDocumentSnapshot extends FirestoreDocumentSnapshot<ShopItem> {
  ShopDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<ShopItem> snapshot;

  @override
  ShopDocumentReference get reference {
    return ShopDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final ShopItem? data;
}

class ShopQuerySnapshot
    extends FirestoreQuerySnapshot<ShopItem, ShopQueryDocumentSnapshot> {
  ShopQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory ShopQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<ShopItem> snapshot,
  ) {
    final docs = snapshot.docs.map(ShopQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        ShopDocumentSnapshot._,
      );
    }).toList();

    return ShopQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<ShopDocumentSnapshot> _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    ShopDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<ShopDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<ShopItem> snapshot;

  @override
  final List<ShopQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<ShopDocumentSnapshot>> docChanges;
}

class ShopQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot<ShopItem>
    implements ShopDocumentSnapshot {
  ShopQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<ShopItem> snapshot;

  @override
  final ShopItem data;

  @override
  ShopDocumentReference get reference {
    return ShopDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      username: json['username'] as String,
      links:
          (json['links'] as List<dynamic>?)?.map((e) => e as String).toList(),
      starPoints: (json['starPoints'] as num?)?.toInt() ?? 0,
      activeItems: json['activeItems'] == null
          ? const ActiveItems()
          : ActiveItems.fromJson(json['activeItems'] as Map<String, dynamic>),
    );

const _$UserFieldMap = <String, String>{
  'firstName': 'firstName',
  'lastName': 'lastName',
  'email': 'email',
  'username': 'username',
  'links': 'links',
  'starPoints': 'starPoints',
  'activeItems': 'activeItems',
};

// ignore: unused_element
abstract class _$UserPerFieldToJson {
  // ignore: unused_element
  static Object? firstName(String instance) => instance;
  // ignore: unused_element
  static Object? lastName(String instance) => instance;
  // ignore: unused_element
  static Object? email(String instance) => instance;
  // ignore: unused_element
  static Object? username(String instance) => instance;
  // ignore: unused_element
  static Object? links(List<String>? instance) => instance;
  // ignore: unused_element
  static Object? starPoints(int instance) => instance;
  // ignore: unused_element
  static Object? activeItems(ActiveItems instance) => instance.toJson();
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'username': instance.username,
      'links': instance.links,
      'starPoints': instance.starPoints,
      'activeItems': instance.activeItems.toJson(),
    };

ActiveItems _$ActiveItemsFromJson(Map<String, dynamic> json) => ActiveItems(
      banner: json['banner'] as String?,
      iconDecoration: json['iconDecoration'] as String?,
      backgroundDecoration: json['backgroundDecoration'] as String?,
      nameTag: json['nameTag'] as String?,
    );

const _$ActiveItemsFieldMap = <String, String>{
  'banner': 'banner',
  'iconDecoration': 'iconDecoration',
  'backgroundDecoration': 'backgroundDecoration',
  'nameTag': 'nameTag',
};

// ignore: unused_element
abstract class _$ActiveItemsPerFieldToJson {
  // ignore: unused_element
  static Object? banner(String? instance) => instance;
  // ignore: unused_element
  static Object? iconDecoration(String? instance) => instance;
  // ignore: unused_element
  static Object? backgroundDecoration(String? instance) => instance;
  // ignore: unused_element
  static Object? nameTag(String? instance) => instance;
}

Map<String, dynamic> _$ActiveItemsToJson(ActiveItems instance) =>
    <String, dynamic>{
      'banner': instance.banner,
      'iconDecoration': instance.iconDecoration,
      'backgroundDecoration': instance.backgroundDecoration,
      'nameTag': instance.nameTag,
    };

Follow _$FollowFromJson(Map<String, dynamic> json) => Follow(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      username: json['username'] as String,
      links:
          (json['links'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

const _$FollowFieldMap = <String, String>{
  'firstName': 'firstName',
  'lastName': 'lastName',
  'email': 'email',
  'username': 'username',
  'links': 'links',
};

// ignore: unused_element
abstract class _$FollowPerFieldToJson {
  // ignore: unused_element
  static Object? firstName(String instance) => instance;
  // ignore: unused_element
  static Object? lastName(String instance) => instance;
  // ignore: unused_element
  static Object? email(String instance) => instance;
  // ignore: unused_element
  static Object? username(String instance) => instance;
  // ignore: unused_element
  static Object? links(List<String>? instance) => instance;
}

Map<String, dynamic> _$FollowToJson(Follow instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'username': instance.username,
      'links': instance.links,
    };

Reward _$RewardFromJson(Map<String, dynamic> json) => Reward(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      description: json['description'] as String,
      starPoints: (json['starPoints'] as num).toInt(),
    );

const _$RewardFieldMap = <String, String>{
  'id': 'id',
  'name': 'name',
  'type': 'type',
  'description': 'description',
  'starPoints': 'starPoints',
};

// ignore: unused_element
abstract class _$RewardPerFieldToJson {
  // ignore: unused_element
  static Object? id(String instance) => instance;
  // ignore: unused_element
  static Object? name(String instance) => instance;
  // ignore: unused_element
  static Object? type(String instance) => instance;
  // ignore: unused_element
  static Object? description(String instance) => instance;
  // ignore: unused_element
  static Object? starPoints(int instance) => instance;
}

Map<String, dynamic> _$RewardToJson(Reward instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'description': instance.description,
      'starPoints': instance.starPoints,
    };

UserReward _$UserRewardFromJson(Map<String, dynamic> json) => UserReward(
      rewardId: json['rewardId'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      starPoints: (json['starPoints'] as num).toInt(),
      earnedAt: const FirestoreTimestampConverter()
          .fromJson(json['earnedAt'] as Timestamp),
    );

const _$UserRewardFieldMap = <String, String>{
  'rewardId': 'rewardId',
  'name': 'name',
  'type': 'type',
  'starPoints': 'starPoints',
  'earnedAt': 'earnedAt',
};

// ignore: unused_element
abstract class _$UserRewardPerFieldToJson {
  // ignore: unused_element
  static Object? rewardId(String instance) => instance;
  // ignore: unused_element
  static Object? name(String instance) => instance;
  // ignore: unused_element
  static Object? type(String instance) => instance;
  // ignore: unused_element
  static Object? starPoints(int instance) => instance;
  // ignore: unused_element
  static Object? earnedAt(Timestamp instance) =>
      const FirestoreTimestampConverter().toJson(instance);
}

Map<String, dynamic> _$UserRewardToJson(UserReward instance) =>
    <String, dynamic>{
      'rewardId': instance.rewardId,
      'name': instance.name,
      'type': instance.type,
      'starPoints': instance.starPoints,
      'earnedAt': const FirestoreTimestampConverter().toJson(instance.earnedAt),
    };

ShopItem _$ShopItemFromJson(Map<String, dynamic> json) => ShopItem(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      description: json['description'] as String,
      cost: (json['cost'] as num).toInt(),
      icon: json['icon'] as String,
    );

const _$ShopItemFieldMap = <String, String>{
  'id': 'id',
  'name': 'name',
  'type': 'type',
  'description': 'description',
  'cost': 'cost',
  'icon': 'icon',
};

// ignore: unused_element
abstract class _$ShopItemPerFieldToJson {
  // ignore: unused_element
  static Object? id(String instance) => instance;
  // ignore: unused_element
  static Object? name(String instance) => instance;
  // ignore: unused_element
  static Object? type(String instance) => instance;
  // ignore: unused_element
  static Object? description(String instance) => instance;
  // ignore: unused_element
  static Object? cost(int instance) => instance;
  // ignore: unused_element
  static Object? icon(String instance) => instance;
}

Map<String, dynamic> _$ShopItemToJson(ShopItem instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'description': instance.description,
      'cost': instance.cost,
      'icon': instance.icon,
    };

UserPurchase _$UserPurchaseFromJson(Map<String, dynamic> json) => UserPurchase(
      itemId: json['itemId'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      icon: json['icon'] as String,
      purchasedAt: const FirestoreTimestampConverter()
          .fromJson(json['purchasedAt'] as Timestamp),
    );

const _$UserPurchaseFieldMap = <String, String>{
  'itemId': 'itemId',
  'name': 'name',
  'type': 'type',
  'icon': 'icon',
  'purchasedAt': 'purchasedAt',
};

// ignore: unused_element
abstract class _$UserPurchasePerFieldToJson {
  // ignore: unused_element
  static Object? itemId(String instance) => instance;
  // ignore: unused_element
  static Object? name(String instance) => instance;
  // ignore: unused_element
  static Object? type(String instance) => instance;
  // ignore: unused_element
  static Object? icon(String instance) => instance;
  // ignore: unused_element
  static Object? purchasedAt(Timestamp instance) =>
      const FirestoreTimestampConverter().toJson(instance);
}

Map<String, dynamic> _$UserPurchaseToJson(UserPurchase instance) =>
    <String, dynamic>{
      'itemId': instance.itemId,
      'name': instance.name,
      'type': instance.type,
      'icon': instance.icon,
      'purchasedAt':
          const FirestoreTimestampConverter().toJson(instance.purchasedAt),
    };
