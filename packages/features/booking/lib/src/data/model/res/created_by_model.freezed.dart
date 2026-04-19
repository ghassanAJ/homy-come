// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'created_by_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreatedByModel {

 String? get id;@JsonKey(name: 'documentId') String? get documentId; String? get firstname; String? get lastname; String? get username; String? get email;@JsonKey(name: 'resetPasswordToken') String? get resetPasswordToken;@JsonKey(name: 'registrationToken') String? get registrationToken;@JsonKey(name: 'isActive') bool? get isActive; List<RoleRefModel> get roles; bool? get blocked;@JsonKey(name: 'preferedLanguage') String? get preferedLanguage;@JsonKey(name: 'createdAt') String? get createdAt;@JsonKey(name: 'updatedAt') String? get updatedAt;@JsonKey(name: 'publishedAt') String? get publishedAt;@JsonKey(name: 'createdBy') DocumentRefModel? get createdBy;@JsonKey(name: 'updatedBy') DocumentRefModel? get updatedBy; String? get locale; List<DocumentRefModel> get localizations;
/// Create a copy of CreatedByModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatedByModelCopyWith<CreatedByModel> get copyWith => _$CreatedByModelCopyWithImpl<CreatedByModel>(this as CreatedByModel, _$identity);

  /// Serializes this CreatedByModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatedByModel&&(identical(other.id, id) || other.id == id)&&(identical(other.documentId, documentId) || other.documentId == documentId)&&(identical(other.firstname, firstname) || other.firstname == firstname)&&(identical(other.lastname, lastname) || other.lastname == lastname)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.resetPasswordToken, resetPasswordToken) || other.resetPasswordToken == resetPasswordToken)&&(identical(other.registrationToken, registrationToken) || other.registrationToken == registrationToken)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&const DeepCollectionEquality().equals(other.roles, roles)&&(identical(other.blocked, blocked) || other.blocked == blocked)&&(identical(other.preferedLanguage, preferedLanguage) || other.preferedLanguage == preferedLanguage)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.updatedBy, updatedBy) || other.updatedBy == updatedBy)&&(identical(other.locale, locale) || other.locale == locale)&&const DeepCollectionEquality().equals(other.localizations, localizations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,documentId,firstname,lastname,username,email,resetPasswordToken,registrationToken,isActive,const DeepCollectionEquality().hash(roles),blocked,preferedLanguage,createdAt,updatedAt,publishedAt,createdBy,updatedBy,locale,const DeepCollectionEquality().hash(localizations)]);

@override
String toString() {
  return 'CreatedByModel(id: $id, documentId: $documentId, firstname: $firstname, lastname: $lastname, username: $username, email: $email, resetPasswordToken: $resetPasswordToken, registrationToken: $registrationToken, isActive: $isActive, roles: $roles, blocked: $blocked, preferedLanguage: $preferedLanguage, createdAt: $createdAt, updatedAt: $updatedAt, publishedAt: $publishedAt, createdBy: $createdBy, updatedBy: $updatedBy, locale: $locale, localizations: $localizations)';
}


}

/// @nodoc
abstract mixin class $CreatedByModelCopyWith<$Res>  {
  factory $CreatedByModelCopyWith(CreatedByModel value, $Res Function(CreatedByModel) _then) = _$CreatedByModelCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'documentId') String? documentId, String? firstname, String? lastname, String? username, String? email,@JsonKey(name: 'resetPasswordToken') String? resetPasswordToken,@JsonKey(name: 'registrationToken') String? registrationToken,@JsonKey(name: 'isActive') bool? isActive, List<RoleRefModel> roles, bool? blocked,@JsonKey(name: 'preferedLanguage') String? preferedLanguage,@JsonKey(name: 'createdAt') String? createdAt,@JsonKey(name: 'updatedAt') String? updatedAt,@JsonKey(name: 'publishedAt') String? publishedAt,@JsonKey(name: 'createdBy') DocumentRefModel? createdBy,@JsonKey(name: 'updatedBy') DocumentRefModel? updatedBy, String? locale, List<DocumentRefModel> localizations
});


$DocumentRefModelCopyWith<$Res>? get createdBy;$DocumentRefModelCopyWith<$Res>? get updatedBy;

}
/// @nodoc
class _$CreatedByModelCopyWithImpl<$Res>
    implements $CreatedByModelCopyWith<$Res> {
  _$CreatedByModelCopyWithImpl(this._self, this._then);

  final CreatedByModel _self;
  final $Res Function(CreatedByModel) _then;

/// Create a copy of CreatedByModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? documentId = freezed,Object? firstname = freezed,Object? lastname = freezed,Object? username = freezed,Object? email = freezed,Object? resetPasswordToken = freezed,Object? registrationToken = freezed,Object? isActive = freezed,Object? roles = null,Object? blocked = freezed,Object? preferedLanguage = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? publishedAt = freezed,Object? createdBy = freezed,Object? updatedBy = freezed,Object? locale = freezed,Object? localizations = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,documentId: freezed == documentId ? _self.documentId : documentId // ignore: cast_nullable_to_non_nullable
as String?,firstname: freezed == firstname ? _self.firstname : firstname // ignore: cast_nullable_to_non_nullable
as String?,lastname: freezed == lastname ? _self.lastname : lastname // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,resetPasswordToken: freezed == resetPasswordToken ? _self.resetPasswordToken : resetPasswordToken // ignore: cast_nullable_to_non_nullable
as String?,registrationToken: freezed == registrationToken ? _self.registrationToken : registrationToken // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,roles: null == roles ? _self.roles : roles // ignore: cast_nullable_to_non_nullable
as List<RoleRefModel>,blocked: freezed == blocked ? _self.blocked : blocked // ignore: cast_nullable_to_non_nullable
as bool?,preferedLanguage: freezed == preferedLanguage ? _self.preferedLanguage : preferedLanguage // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,publishedAt: freezed == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as String?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as DocumentRefModel?,updatedBy: freezed == updatedBy ? _self.updatedBy : updatedBy // ignore: cast_nullable_to_non_nullable
as DocumentRefModel?,locale: freezed == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String?,localizations: null == localizations ? _self.localizations : localizations // ignore: cast_nullable_to_non_nullable
as List<DocumentRefModel>,
  ));
}
/// Create a copy of CreatedByModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentRefModelCopyWith<$Res>? get createdBy {
    if (_self.createdBy == null) {
    return null;
  }

  return $DocumentRefModelCopyWith<$Res>(_self.createdBy!, (value) {
    return _then(_self.copyWith(createdBy: value));
  });
}/// Create a copy of CreatedByModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentRefModelCopyWith<$Res>? get updatedBy {
    if (_self.updatedBy == null) {
    return null;
  }

  return $DocumentRefModelCopyWith<$Res>(_self.updatedBy!, (value) {
    return _then(_self.copyWith(updatedBy: value));
  });
}
}


/// Adds pattern-matching-related methods to [CreatedByModel].
extension CreatedByModelPatterns on CreatedByModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreatedByModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreatedByModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreatedByModel value)  $default,){
final _that = this;
switch (_that) {
case _CreatedByModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreatedByModel value)?  $default,){
final _that = this;
switch (_that) {
case _CreatedByModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'documentId')  String? documentId,  String? firstname,  String? lastname,  String? username,  String? email, @JsonKey(name: 'resetPasswordToken')  String? resetPasswordToken, @JsonKey(name: 'registrationToken')  String? registrationToken, @JsonKey(name: 'isActive')  bool? isActive,  List<RoleRefModel> roles,  bool? blocked, @JsonKey(name: 'preferedLanguage')  String? preferedLanguage, @JsonKey(name: 'createdAt')  String? createdAt, @JsonKey(name: 'updatedAt')  String? updatedAt, @JsonKey(name: 'publishedAt')  String? publishedAt, @JsonKey(name: 'createdBy')  DocumentRefModel? createdBy, @JsonKey(name: 'updatedBy')  DocumentRefModel? updatedBy,  String? locale,  List<DocumentRefModel> localizations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreatedByModel() when $default != null:
return $default(_that.id,_that.documentId,_that.firstname,_that.lastname,_that.username,_that.email,_that.resetPasswordToken,_that.registrationToken,_that.isActive,_that.roles,_that.blocked,_that.preferedLanguage,_that.createdAt,_that.updatedAt,_that.publishedAt,_that.createdBy,_that.updatedBy,_that.locale,_that.localizations);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'documentId')  String? documentId,  String? firstname,  String? lastname,  String? username,  String? email, @JsonKey(name: 'resetPasswordToken')  String? resetPasswordToken, @JsonKey(name: 'registrationToken')  String? registrationToken, @JsonKey(name: 'isActive')  bool? isActive,  List<RoleRefModel> roles,  bool? blocked, @JsonKey(name: 'preferedLanguage')  String? preferedLanguage, @JsonKey(name: 'createdAt')  String? createdAt, @JsonKey(name: 'updatedAt')  String? updatedAt, @JsonKey(name: 'publishedAt')  String? publishedAt, @JsonKey(name: 'createdBy')  DocumentRefModel? createdBy, @JsonKey(name: 'updatedBy')  DocumentRefModel? updatedBy,  String? locale,  List<DocumentRefModel> localizations)  $default,) {final _that = this;
switch (_that) {
case _CreatedByModel():
return $default(_that.id,_that.documentId,_that.firstname,_that.lastname,_that.username,_that.email,_that.resetPasswordToken,_that.registrationToken,_that.isActive,_that.roles,_that.blocked,_that.preferedLanguage,_that.createdAt,_that.updatedAt,_that.publishedAt,_that.createdBy,_that.updatedBy,_that.locale,_that.localizations);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'documentId')  String? documentId,  String? firstname,  String? lastname,  String? username,  String? email, @JsonKey(name: 'resetPasswordToken')  String? resetPasswordToken, @JsonKey(name: 'registrationToken')  String? registrationToken, @JsonKey(name: 'isActive')  bool? isActive,  List<RoleRefModel> roles,  bool? blocked, @JsonKey(name: 'preferedLanguage')  String? preferedLanguage, @JsonKey(name: 'createdAt')  String? createdAt, @JsonKey(name: 'updatedAt')  String? updatedAt, @JsonKey(name: 'publishedAt')  String? publishedAt, @JsonKey(name: 'createdBy')  DocumentRefModel? createdBy, @JsonKey(name: 'updatedBy')  DocumentRefModel? updatedBy,  String? locale,  List<DocumentRefModel> localizations)?  $default,) {final _that = this;
switch (_that) {
case _CreatedByModel() when $default != null:
return $default(_that.id,_that.documentId,_that.firstname,_that.lastname,_that.username,_that.email,_that.resetPasswordToken,_that.registrationToken,_that.isActive,_that.roles,_that.blocked,_that.preferedLanguage,_that.createdAt,_that.updatedAt,_that.publishedAt,_that.createdBy,_that.updatedBy,_that.locale,_that.localizations);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreatedByModel implements CreatedByModel {
  const _CreatedByModel({this.id, @JsonKey(name: 'documentId') this.documentId, this.firstname, this.lastname, this.username, this.email, @JsonKey(name: 'resetPasswordToken') this.resetPasswordToken, @JsonKey(name: 'registrationToken') this.registrationToken, @JsonKey(name: 'isActive') this.isActive, final  List<RoleRefModel> roles = const [], this.blocked, @JsonKey(name: 'preferedLanguage') this.preferedLanguage, @JsonKey(name: 'createdAt') this.createdAt, @JsonKey(name: 'updatedAt') this.updatedAt, @JsonKey(name: 'publishedAt') this.publishedAt, @JsonKey(name: 'createdBy') this.createdBy, @JsonKey(name: 'updatedBy') this.updatedBy, this.locale, final  List<DocumentRefModel> localizations = const []}): _roles = roles,_localizations = localizations;
  factory _CreatedByModel.fromJson(Map<String, dynamic> json) => _$CreatedByModelFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'documentId') final  String? documentId;
@override final  String? firstname;
@override final  String? lastname;
@override final  String? username;
@override final  String? email;
@override@JsonKey(name: 'resetPasswordToken') final  String? resetPasswordToken;
@override@JsonKey(name: 'registrationToken') final  String? registrationToken;
@override@JsonKey(name: 'isActive') final  bool? isActive;
 final  List<RoleRefModel> _roles;
@override@JsonKey() List<RoleRefModel> get roles {
  if (_roles is EqualUnmodifiableListView) return _roles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_roles);
}

@override final  bool? blocked;
@override@JsonKey(name: 'preferedLanguage') final  String? preferedLanguage;
@override@JsonKey(name: 'createdAt') final  String? createdAt;
@override@JsonKey(name: 'updatedAt') final  String? updatedAt;
@override@JsonKey(name: 'publishedAt') final  String? publishedAt;
@override@JsonKey(name: 'createdBy') final  DocumentRefModel? createdBy;
@override@JsonKey(name: 'updatedBy') final  DocumentRefModel? updatedBy;
@override final  String? locale;
 final  List<DocumentRefModel> _localizations;
@override@JsonKey() List<DocumentRefModel> get localizations {
  if (_localizations is EqualUnmodifiableListView) return _localizations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_localizations);
}


/// Create a copy of CreatedByModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatedByModelCopyWith<_CreatedByModel> get copyWith => __$CreatedByModelCopyWithImpl<_CreatedByModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreatedByModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreatedByModel&&(identical(other.id, id) || other.id == id)&&(identical(other.documentId, documentId) || other.documentId == documentId)&&(identical(other.firstname, firstname) || other.firstname == firstname)&&(identical(other.lastname, lastname) || other.lastname == lastname)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.resetPasswordToken, resetPasswordToken) || other.resetPasswordToken == resetPasswordToken)&&(identical(other.registrationToken, registrationToken) || other.registrationToken == registrationToken)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&const DeepCollectionEquality().equals(other._roles, _roles)&&(identical(other.blocked, blocked) || other.blocked == blocked)&&(identical(other.preferedLanguage, preferedLanguage) || other.preferedLanguage == preferedLanguage)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.updatedBy, updatedBy) || other.updatedBy == updatedBy)&&(identical(other.locale, locale) || other.locale == locale)&&const DeepCollectionEquality().equals(other._localizations, _localizations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,documentId,firstname,lastname,username,email,resetPasswordToken,registrationToken,isActive,const DeepCollectionEquality().hash(_roles),blocked,preferedLanguage,createdAt,updatedAt,publishedAt,createdBy,updatedBy,locale,const DeepCollectionEquality().hash(_localizations)]);

@override
String toString() {
  return 'CreatedByModel(id: $id, documentId: $documentId, firstname: $firstname, lastname: $lastname, username: $username, email: $email, resetPasswordToken: $resetPasswordToken, registrationToken: $registrationToken, isActive: $isActive, roles: $roles, blocked: $blocked, preferedLanguage: $preferedLanguage, createdAt: $createdAt, updatedAt: $updatedAt, publishedAt: $publishedAt, createdBy: $createdBy, updatedBy: $updatedBy, locale: $locale, localizations: $localizations)';
}


}

/// @nodoc
abstract mixin class _$CreatedByModelCopyWith<$Res> implements $CreatedByModelCopyWith<$Res> {
  factory _$CreatedByModelCopyWith(_CreatedByModel value, $Res Function(_CreatedByModel) _then) = __$CreatedByModelCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'documentId') String? documentId, String? firstname, String? lastname, String? username, String? email,@JsonKey(name: 'resetPasswordToken') String? resetPasswordToken,@JsonKey(name: 'registrationToken') String? registrationToken,@JsonKey(name: 'isActive') bool? isActive, List<RoleRefModel> roles, bool? blocked,@JsonKey(name: 'preferedLanguage') String? preferedLanguage,@JsonKey(name: 'createdAt') String? createdAt,@JsonKey(name: 'updatedAt') String? updatedAt,@JsonKey(name: 'publishedAt') String? publishedAt,@JsonKey(name: 'createdBy') DocumentRefModel? createdBy,@JsonKey(name: 'updatedBy') DocumentRefModel? updatedBy, String? locale, List<DocumentRefModel> localizations
});


@override $DocumentRefModelCopyWith<$Res>? get createdBy;@override $DocumentRefModelCopyWith<$Res>? get updatedBy;

}
/// @nodoc
class __$CreatedByModelCopyWithImpl<$Res>
    implements _$CreatedByModelCopyWith<$Res> {
  __$CreatedByModelCopyWithImpl(this._self, this._then);

  final _CreatedByModel _self;
  final $Res Function(_CreatedByModel) _then;

/// Create a copy of CreatedByModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? documentId = freezed,Object? firstname = freezed,Object? lastname = freezed,Object? username = freezed,Object? email = freezed,Object? resetPasswordToken = freezed,Object? registrationToken = freezed,Object? isActive = freezed,Object? roles = null,Object? blocked = freezed,Object? preferedLanguage = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? publishedAt = freezed,Object? createdBy = freezed,Object? updatedBy = freezed,Object? locale = freezed,Object? localizations = null,}) {
  return _then(_CreatedByModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,documentId: freezed == documentId ? _self.documentId : documentId // ignore: cast_nullable_to_non_nullable
as String?,firstname: freezed == firstname ? _self.firstname : firstname // ignore: cast_nullable_to_non_nullable
as String?,lastname: freezed == lastname ? _self.lastname : lastname // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,resetPasswordToken: freezed == resetPasswordToken ? _self.resetPasswordToken : resetPasswordToken // ignore: cast_nullable_to_non_nullable
as String?,registrationToken: freezed == registrationToken ? _self.registrationToken : registrationToken // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,roles: null == roles ? _self._roles : roles // ignore: cast_nullable_to_non_nullable
as List<RoleRefModel>,blocked: freezed == blocked ? _self.blocked : blocked // ignore: cast_nullable_to_non_nullable
as bool?,preferedLanguage: freezed == preferedLanguage ? _self.preferedLanguage : preferedLanguage // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,publishedAt: freezed == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as String?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as DocumentRefModel?,updatedBy: freezed == updatedBy ? _self.updatedBy : updatedBy // ignore: cast_nullable_to_non_nullable
as DocumentRefModel?,locale: freezed == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String?,localizations: null == localizations ? _self._localizations : localizations // ignore: cast_nullable_to_non_nullable
as List<DocumentRefModel>,
  ));
}

/// Create a copy of CreatedByModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentRefModelCopyWith<$Res>? get createdBy {
    if (_self.createdBy == null) {
    return null;
  }

  return $DocumentRefModelCopyWith<$Res>(_self.createdBy!, (value) {
    return _then(_self.copyWith(createdBy: value));
  });
}/// Create a copy of CreatedByModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentRefModelCopyWith<$Res>? get updatedBy {
    if (_self.updatedBy == null) {
    return null;
  }

  return $DocumentRefModelCopyWith<$Res>(_self.updatedBy!, (value) {
    return _then(_self.copyWith(updatedBy: value));
  });
}
}

// dart format on
