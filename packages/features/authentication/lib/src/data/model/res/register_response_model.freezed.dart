// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SendOTPResponseModel {

 String get message;
/// Create a copy of SendOTPResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendOTPResponseModelCopyWith<SendOTPResponseModel> get copyWith => _$SendOTPResponseModelCopyWithImpl<SendOTPResponseModel>(this as SendOTPResponseModel, _$identity);

  /// Serializes this SendOTPResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendOTPResponseModel&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SendOTPResponseModel(message: $message)';
}


}

/// @nodoc
abstract mixin class $SendOTPResponseModelCopyWith<$Res>  {
  factory $SendOTPResponseModelCopyWith(SendOTPResponseModel value, $Res Function(SendOTPResponseModel) _then) = _$SendOTPResponseModelCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$SendOTPResponseModelCopyWithImpl<$Res>
    implements $SendOTPResponseModelCopyWith<$Res> {
  _$SendOTPResponseModelCopyWithImpl(this._self, this._then);

  final SendOTPResponseModel _self;
  final $Res Function(SendOTPResponseModel) _then;

/// Create a copy of SendOTPResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SendOTPResponseModel].
extension SendOTPResponseModelPatterns on SendOTPResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SendOTPResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SendOTPResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SendOTPResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _SendOTPResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SendOTPResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _SendOTPResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SendOTPResponseModel() when $default != null:
return $default(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String message)  $default,) {final _that = this;
switch (_that) {
case _SendOTPResponseModel():
return $default(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String message)?  $default,) {final _that = this;
switch (_that) {
case _SendOTPResponseModel() when $default != null:
return $default(_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SendOTPResponseModel implements SendOTPResponseModel {
  const _SendOTPResponseModel({required this.message});
  factory _SendOTPResponseModel.fromJson(Map<String, dynamic> json) => _$SendOTPResponseModelFromJson(json);

@override final  String message;

/// Create a copy of SendOTPResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendOTPResponseModelCopyWith<_SendOTPResponseModel> get copyWith => __$SendOTPResponseModelCopyWithImpl<_SendOTPResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SendOTPResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendOTPResponseModel&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SendOTPResponseModel(message: $message)';
}


}

/// @nodoc
abstract mixin class _$SendOTPResponseModelCopyWith<$Res> implements $SendOTPResponseModelCopyWith<$Res> {
  factory _$SendOTPResponseModelCopyWith(_SendOTPResponseModel value, $Res Function(_SendOTPResponseModel) _then) = __$SendOTPResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class __$SendOTPResponseModelCopyWithImpl<$Res>
    implements _$SendOTPResponseModelCopyWith<$Res> {
  __$SendOTPResponseModelCopyWithImpl(this._self, this._then);

  final _SendOTPResponseModel _self;
  final $Res Function(_SendOTPResponseModel) _then;

/// Create a copy of SendOTPResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_SendOTPResponseModel(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$VerifyOTPResponseModel {

 String get jwt; VerifiedUserModel? get user;
/// Create a copy of VerifyOTPResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyOTPResponseModelCopyWith<VerifyOTPResponseModel> get copyWith => _$VerifyOTPResponseModelCopyWithImpl<VerifyOTPResponseModel>(this as VerifyOTPResponseModel, _$identity);

  /// Serializes this VerifyOTPResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyOTPResponseModel&&(identical(other.jwt, jwt) || other.jwt == jwt)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,jwt,user);

@override
String toString() {
  return 'VerifyOTPResponseModel(jwt: $jwt, user: $user)';
}


}

/// @nodoc
abstract mixin class $VerifyOTPResponseModelCopyWith<$Res>  {
  factory $VerifyOTPResponseModelCopyWith(VerifyOTPResponseModel value, $Res Function(VerifyOTPResponseModel) _then) = _$VerifyOTPResponseModelCopyWithImpl;
@useResult
$Res call({
 String jwt, VerifiedUserModel? user
});


$VerifiedUserModelCopyWith<$Res>? get user;

}
/// @nodoc
class _$VerifyOTPResponseModelCopyWithImpl<$Res>
    implements $VerifyOTPResponseModelCopyWith<$Res> {
  _$VerifyOTPResponseModelCopyWithImpl(this._self, this._then);

  final VerifyOTPResponseModel _self;
  final $Res Function(VerifyOTPResponseModel) _then;

/// Create a copy of VerifyOTPResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? jwt = null,Object? user = freezed,}) {
  return _then(_self.copyWith(
jwt: null == jwt ? _self.jwt : jwt // ignore: cast_nullable_to_non_nullable
as String,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as VerifiedUserModel?,
  ));
}
/// Create a copy of VerifyOTPResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VerifiedUserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $VerifiedUserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [VerifyOTPResponseModel].
extension VerifyOTPResponseModelPatterns on VerifyOTPResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerifyOTPResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerifyOTPResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerifyOTPResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _VerifyOTPResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerifyOTPResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _VerifyOTPResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String jwt,  VerifiedUserModel? user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerifyOTPResponseModel() when $default != null:
return $default(_that.jwt,_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String jwt,  VerifiedUserModel? user)  $default,) {final _that = this;
switch (_that) {
case _VerifyOTPResponseModel():
return $default(_that.jwt,_that.user);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String jwt,  VerifiedUserModel? user)?  $default,) {final _that = this;
switch (_that) {
case _VerifyOTPResponseModel() when $default != null:
return $default(_that.jwt,_that.user);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VerifyOTPResponseModel implements VerifyOTPResponseModel {
  const _VerifyOTPResponseModel({required this.jwt, this.user});
  factory _VerifyOTPResponseModel.fromJson(Map<String, dynamic> json) => _$VerifyOTPResponseModelFromJson(json);

@override final  String jwt;
@override final  VerifiedUserModel? user;

/// Create a copy of VerifyOTPResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyOTPResponseModelCopyWith<_VerifyOTPResponseModel> get copyWith => __$VerifyOTPResponseModelCopyWithImpl<_VerifyOTPResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VerifyOTPResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyOTPResponseModel&&(identical(other.jwt, jwt) || other.jwt == jwt)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,jwt,user);

@override
String toString() {
  return 'VerifyOTPResponseModel(jwt: $jwt, user: $user)';
}


}

/// @nodoc
abstract mixin class _$VerifyOTPResponseModelCopyWith<$Res> implements $VerifyOTPResponseModelCopyWith<$Res> {
  factory _$VerifyOTPResponseModelCopyWith(_VerifyOTPResponseModel value, $Res Function(_VerifyOTPResponseModel) _then) = __$VerifyOTPResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String jwt, VerifiedUserModel? user
});


@override $VerifiedUserModelCopyWith<$Res>? get user;

}
/// @nodoc
class __$VerifyOTPResponseModelCopyWithImpl<$Res>
    implements _$VerifyOTPResponseModelCopyWith<$Res> {
  __$VerifyOTPResponseModelCopyWithImpl(this._self, this._then);

  final _VerifyOTPResponseModel _self;
  final $Res Function(_VerifyOTPResponseModel) _then;

/// Create a copy of VerifyOTPResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? jwt = null,Object? user = freezed,}) {
  return _then(_VerifyOTPResponseModel(
jwt: null == jwt ? _self.jwt : jwt // ignore: cast_nullable_to_non_nullable
as String,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as VerifiedUserModel?,
  ));
}

/// Create a copy of VerifyOTPResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VerifiedUserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $VerifiedUserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
mixin _$RegisterInitResponseModel {

@JsonKey(name: 'registration_id') String? get registrationId;@JsonKey(name: 'id') String? get id;// New field from /api/v1/register-user
 String? get message; bool get verified;@JsonKey(name: 'temporary_access_token') String? get accessToken;// Token from verify OTP
@JsonKey(name: 'phone_verified') bool? get phoneVerified;
/// Create a copy of RegisterInitResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterInitResponseModelCopyWith<RegisterInitResponseModel> get copyWith => _$RegisterInitResponseModelCopyWithImpl<RegisterInitResponseModel>(this as RegisterInitResponseModel, _$identity);

  /// Serializes this RegisterInitResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterInitResponseModel&&(identical(other.registrationId, registrationId) || other.registrationId == registrationId)&&(identical(other.id, id) || other.id == id)&&(identical(other.message, message) || other.message == message)&&(identical(other.verified, verified) || other.verified == verified)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.phoneVerified, phoneVerified) || other.phoneVerified == phoneVerified));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,registrationId,id,message,verified,accessToken,phoneVerified);

@override
String toString() {
  return 'RegisterInitResponseModel(registrationId: $registrationId, id: $id, message: $message, verified: $verified, accessToken: $accessToken, phoneVerified: $phoneVerified)';
}


}

/// @nodoc
abstract mixin class $RegisterInitResponseModelCopyWith<$Res>  {
  factory $RegisterInitResponseModelCopyWith(RegisterInitResponseModel value, $Res Function(RegisterInitResponseModel) _then) = _$RegisterInitResponseModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'registration_id') String? registrationId,@JsonKey(name: 'id') String? id, String? message, bool verified,@JsonKey(name: 'temporary_access_token') String? accessToken,@JsonKey(name: 'phone_verified') bool? phoneVerified
});




}
/// @nodoc
class _$RegisterInitResponseModelCopyWithImpl<$Res>
    implements $RegisterInitResponseModelCopyWith<$Res> {
  _$RegisterInitResponseModelCopyWithImpl(this._self, this._then);

  final RegisterInitResponseModel _self;
  final $Res Function(RegisterInitResponseModel) _then;

/// Create a copy of RegisterInitResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? registrationId = freezed,Object? id = freezed,Object? message = freezed,Object? verified = null,Object? accessToken = freezed,Object? phoneVerified = freezed,}) {
  return _then(_self.copyWith(
registrationId: freezed == registrationId ? _self.registrationId : registrationId // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,verified: null == verified ? _self.verified : verified // ignore: cast_nullable_to_non_nullable
as bool,accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,phoneVerified: freezed == phoneVerified ? _self.phoneVerified : phoneVerified // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [RegisterInitResponseModel].
extension RegisterInitResponseModelPatterns on RegisterInitResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisterInitResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterInitResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisterInitResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _RegisterInitResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisterInitResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _RegisterInitResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'registration_id')  String? registrationId, @JsonKey(name: 'id')  String? id,  String? message,  bool verified, @JsonKey(name: 'temporary_access_token')  String? accessToken, @JsonKey(name: 'phone_verified')  bool? phoneVerified)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterInitResponseModel() when $default != null:
return $default(_that.registrationId,_that.id,_that.message,_that.verified,_that.accessToken,_that.phoneVerified);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'registration_id')  String? registrationId, @JsonKey(name: 'id')  String? id,  String? message,  bool verified, @JsonKey(name: 'temporary_access_token')  String? accessToken, @JsonKey(name: 'phone_verified')  bool? phoneVerified)  $default,) {final _that = this;
switch (_that) {
case _RegisterInitResponseModel():
return $default(_that.registrationId,_that.id,_that.message,_that.verified,_that.accessToken,_that.phoneVerified);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'registration_id')  String? registrationId, @JsonKey(name: 'id')  String? id,  String? message,  bool verified, @JsonKey(name: 'temporary_access_token')  String? accessToken, @JsonKey(name: 'phone_verified')  bool? phoneVerified)?  $default,) {final _that = this;
switch (_that) {
case _RegisterInitResponseModel() when $default != null:
return $default(_that.registrationId,_that.id,_that.message,_that.verified,_that.accessToken,_that.phoneVerified);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RegisterInitResponseModel implements RegisterInitResponseModel {
  const _RegisterInitResponseModel({@JsonKey(name: 'registration_id') this.registrationId, @JsonKey(name: 'id') this.id, this.message, this.verified = false, @JsonKey(name: 'temporary_access_token') this.accessToken, @JsonKey(name: 'phone_verified') this.phoneVerified});
  factory _RegisterInitResponseModel.fromJson(Map<String, dynamic> json) => _$RegisterInitResponseModelFromJson(json);

@override@JsonKey(name: 'registration_id') final  String? registrationId;
@override@JsonKey(name: 'id') final  String? id;
// New field from /api/v1/register-user
@override final  String? message;
@override@JsonKey() final  bool verified;
@override@JsonKey(name: 'temporary_access_token') final  String? accessToken;
// Token from verify OTP
@override@JsonKey(name: 'phone_verified') final  bool? phoneVerified;

/// Create a copy of RegisterInitResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterInitResponseModelCopyWith<_RegisterInitResponseModel> get copyWith => __$RegisterInitResponseModelCopyWithImpl<_RegisterInitResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegisterInitResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterInitResponseModel&&(identical(other.registrationId, registrationId) || other.registrationId == registrationId)&&(identical(other.id, id) || other.id == id)&&(identical(other.message, message) || other.message == message)&&(identical(other.verified, verified) || other.verified == verified)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.phoneVerified, phoneVerified) || other.phoneVerified == phoneVerified));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,registrationId,id,message,verified,accessToken,phoneVerified);

@override
String toString() {
  return 'RegisterInitResponseModel(registrationId: $registrationId, id: $id, message: $message, verified: $verified, accessToken: $accessToken, phoneVerified: $phoneVerified)';
}


}

/// @nodoc
abstract mixin class _$RegisterInitResponseModelCopyWith<$Res> implements $RegisterInitResponseModelCopyWith<$Res> {
  factory _$RegisterInitResponseModelCopyWith(_RegisterInitResponseModel value, $Res Function(_RegisterInitResponseModel) _then) = __$RegisterInitResponseModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'registration_id') String? registrationId,@JsonKey(name: 'id') String? id, String? message, bool verified,@JsonKey(name: 'temporary_access_token') String? accessToken,@JsonKey(name: 'phone_verified') bool? phoneVerified
});




}
/// @nodoc
class __$RegisterInitResponseModelCopyWithImpl<$Res>
    implements _$RegisterInitResponseModelCopyWith<$Res> {
  __$RegisterInitResponseModelCopyWithImpl(this._self, this._then);

  final _RegisterInitResponseModel _self;
  final $Res Function(_RegisterInitResponseModel) _then;

/// Create a copy of RegisterInitResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? registrationId = freezed,Object? id = freezed,Object? message = freezed,Object? verified = null,Object? accessToken = freezed,Object? phoneVerified = freezed,}) {
  return _then(_RegisterInitResponseModel(
registrationId: freezed == registrationId ? _self.registrationId : registrationId // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,verified: null == verified ? _self.verified : verified // ignore: cast_nullable_to_non_nullable
as bool,accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,phoneVerified: freezed == phoneVerified ? _self.phoneVerified : phoneVerified // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
