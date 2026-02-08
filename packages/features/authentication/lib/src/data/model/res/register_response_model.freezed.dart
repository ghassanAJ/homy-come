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

 String get id;// Session ID for OTP verification
 String get message;@JsonKey(name: 'user_type') String? get userType;
/// Create a copy of SendOTPResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendOTPResponseModelCopyWith<SendOTPResponseModel> get copyWith => _$SendOTPResponseModelCopyWithImpl<SendOTPResponseModel>(this as SendOTPResponseModel, _$identity);

  /// Serializes this SendOTPResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendOTPResponseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.message, message) || other.message == message)&&(identical(other.userType, userType) || other.userType == userType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,message,userType);

@override
String toString() {
  return 'SendOTPResponseModel(id: $id, message: $message, userType: $userType)';
}


}

/// @nodoc
abstract mixin class $SendOTPResponseModelCopyWith<$Res>  {
  factory $SendOTPResponseModelCopyWith(SendOTPResponseModel value, $Res Function(SendOTPResponseModel) _then) = _$SendOTPResponseModelCopyWithImpl;
@useResult
$Res call({
 String id, String message,@JsonKey(name: 'user_type') String? userType
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? message = null,Object? userType = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,userType: freezed == userType ? _self.userType : userType // ignore: cast_nullable_to_non_nullable
as String?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String message, @JsonKey(name: 'user_type')  String? userType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SendOTPResponseModel() when $default != null:
return $default(_that.id,_that.message,_that.userType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String message, @JsonKey(name: 'user_type')  String? userType)  $default,) {final _that = this;
switch (_that) {
case _SendOTPResponseModel():
return $default(_that.id,_that.message,_that.userType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String message, @JsonKey(name: 'user_type')  String? userType)?  $default,) {final _that = this;
switch (_that) {
case _SendOTPResponseModel() when $default != null:
return $default(_that.id,_that.message,_that.userType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SendOTPResponseModel implements SendOTPResponseModel {
  const _SendOTPResponseModel({required this.id, required this.message, @JsonKey(name: 'user_type') this.userType});
  factory _SendOTPResponseModel.fromJson(Map<String, dynamic> json) => _$SendOTPResponseModelFromJson(json);

@override final  String id;
// Session ID for OTP verification
@override final  String message;
@override@JsonKey(name: 'user_type') final  String? userType;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendOTPResponseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.message, message) || other.message == message)&&(identical(other.userType, userType) || other.userType == userType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,message,userType);

@override
String toString() {
  return 'SendOTPResponseModel(id: $id, message: $message, userType: $userType)';
}


}

/// @nodoc
abstract mixin class _$SendOTPResponseModelCopyWith<$Res> implements $SendOTPResponseModelCopyWith<$Res> {
  factory _$SendOTPResponseModelCopyWith(_SendOTPResponseModel value, $Res Function(_SendOTPResponseModel) _then) = __$SendOTPResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String message,@JsonKey(name: 'user_type') String? userType
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? message = null,Object? userType = freezed,}) {
  return _then(_SendOTPResponseModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,userType: freezed == userType ? _self.userType : userType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$VerifyOTPResponseModel {

 String get id;@JsonKey(name: 'phone_verified') bool? get phoneVerified;@JsonKey(name: 'email_verified') bool? get emailVerified; String get message; UserModel? get user;// Present when login/registration is complete
 TokenModel? get tokens;// Present when login/registration is complete
@JsonKey(name: 'redirect_url') String? get redirectUrl;
/// Create a copy of VerifyOTPResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyOTPResponseModelCopyWith<VerifyOTPResponseModel> get copyWith => _$VerifyOTPResponseModelCopyWithImpl<VerifyOTPResponseModel>(this as VerifyOTPResponseModel, _$identity);

  /// Serializes this VerifyOTPResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyOTPResponseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.phoneVerified, phoneVerified) || other.phoneVerified == phoneVerified)&&(identical(other.emailVerified, emailVerified) || other.emailVerified == emailVerified)&&(identical(other.message, message) || other.message == message)&&(identical(other.user, user) || other.user == user)&&(identical(other.tokens, tokens) || other.tokens == tokens)&&(identical(other.redirectUrl, redirectUrl) || other.redirectUrl == redirectUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,phoneVerified,emailVerified,message,user,tokens,redirectUrl);

@override
String toString() {
  return 'VerifyOTPResponseModel(id: $id, phoneVerified: $phoneVerified, emailVerified: $emailVerified, message: $message, user: $user, tokens: $tokens, redirectUrl: $redirectUrl)';
}


}

/// @nodoc
abstract mixin class $VerifyOTPResponseModelCopyWith<$Res>  {
  factory $VerifyOTPResponseModelCopyWith(VerifyOTPResponseModel value, $Res Function(VerifyOTPResponseModel) _then) = _$VerifyOTPResponseModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'phone_verified') bool? phoneVerified,@JsonKey(name: 'email_verified') bool? emailVerified, String message, UserModel? user, TokenModel? tokens,@JsonKey(name: 'redirect_url') String? redirectUrl
});


$TokenModelCopyWith<$Res>? get tokens;

}
/// @nodoc
class _$VerifyOTPResponseModelCopyWithImpl<$Res>
    implements $VerifyOTPResponseModelCopyWith<$Res> {
  _$VerifyOTPResponseModelCopyWithImpl(this._self, this._then);

  final VerifyOTPResponseModel _self;
  final $Res Function(VerifyOTPResponseModel) _then;

/// Create a copy of VerifyOTPResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? phoneVerified = freezed,Object? emailVerified = freezed,Object? message = null,Object? user = freezed,Object? tokens = freezed,Object? redirectUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,phoneVerified: freezed == phoneVerified ? _self.phoneVerified : phoneVerified // ignore: cast_nullable_to_non_nullable
as bool?,emailVerified: freezed == emailVerified ? _self.emailVerified : emailVerified // ignore: cast_nullable_to_non_nullable
as bool?,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,tokens: freezed == tokens ? _self.tokens : tokens // ignore: cast_nullable_to_non_nullable
as TokenModel?,redirectUrl: freezed == redirectUrl ? _self.redirectUrl : redirectUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of VerifyOTPResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TokenModelCopyWith<$Res>? get tokens {
    if (_self.tokens == null) {
    return null;
  }

  return $TokenModelCopyWith<$Res>(_self.tokens!, (value) {
    return _then(_self.copyWith(tokens: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'phone_verified')  bool? phoneVerified, @JsonKey(name: 'email_verified')  bool? emailVerified,  String message,  UserModel? user,  TokenModel? tokens, @JsonKey(name: 'redirect_url')  String? redirectUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerifyOTPResponseModel() when $default != null:
return $default(_that.id,_that.phoneVerified,_that.emailVerified,_that.message,_that.user,_that.tokens,_that.redirectUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'phone_verified')  bool? phoneVerified, @JsonKey(name: 'email_verified')  bool? emailVerified,  String message,  UserModel? user,  TokenModel? tokens, @JsonKey(name: 'redirect_url')  String? redirectUrl)  $default,) {final _that = this;
switch (_that) {
case _VerifyOTPResponseModel():
return $default(_that.id,_that.phoneVerified,_that.emailVerified,_that.message,_that.user,_that.tokens,_that.redirectUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'phone_verified')  bool? phoneVerified, @JsonKey(name: 'email_verified')  bool? emailVerified,  String message,  UserModel? user,  TokenModel? tokens, @JsonKey(name: 'redirect_url')  String? redirectUrl)?  $default,) {final _that = this;
switch (_that) {
case _VerifyOTPResponseModel() when $default != null:
return $default(_that.id,_that.phoneVerified,_that.emailVerified,_that.message,_that.user,_that.tokens,_that.redirectUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VerifyOTPResponseModel implements VerifyOTPResponseModel {
  const _VerifyOTPResponseModel({required this.id, @JsonKey(name: 'phone_verified') this.phoneVerified, @JsonKey(name: 'email_verified') this.emailVerified, required this.message, this.user, this.tokens, @JsonKey(name: 'redirect_url') this.redirectUrl});
  factory _VerifyOTPResponseModel.fromJson(Map<String, dynamic> json) => _$VerifyOTPResponseModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'phone_verified') final  bool? phoneVerified;
@override@JsonKey(name: 'email_verified') final  bool? emailVerified;
@override final  String message;
@override final  UserModel? user;
// Present when login/registration is complete
@override final  TokenModel? tokens;
// Present when login/registration is complete
@override@JsonKey(name: 'redirect_url') final  String? redirectUrl;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyOTPResponseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.phoneVerified, phoneVerified) || other.phoneVerified == phoneVerified)&&(identical(other.emailVerified, emailVerified) || other.emailVerified == emailVerified)&&(identical(other.message, message) || other.message == message)&&(identical(other.user, user) || other.user == user)&&(identical(other.tokens, tokens) || other.tokens == tokens)&&(identical(other.redirectUrl, redirectUrl) || other.redirectUrl == redirectUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,phoneVerified,emailVerified,message,user,tokens,redirectUrl);

@override
String toString() {
  return 'VerifyOTPResponseModel(id: $id, phoneVerified: $phoneVerified, emailVerified: $emailVerified, message: $message, user: $user, tokens: $tokens, redirectUrl: $redirectUrl)';
}


}

/// @nodoc
abstract mixin class _$VerifyOTPResponseModelCopyWith<$Res> implements $VerifyOTPResponseModelCopyWith<$Res> {
  factory _$VerifyOTPResponseModelCopyWith(_VerifyOTPResponseModel value, $Res Function(_VerifyOTPResponseModel) _then) = __$VerifyOTPResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'phone_verified') bool? phoneVerified,@JsonKey(name: 'email_verified') bool? emailVerified, String message, UserModel? user, TokenModel? tokens,@JsonKey(name: 'redirect_url') String? redirectUrl
});


@override $TokenModelCopyWith<$Res>? get tokens;

}
/// @nodoc
class __$VerifyOTPResponseModelCopyWithImpl<$Res>
    implements _$VerifyOTPResponseModelCopyWith<$Res> {
  __$VerifyOTPResponseModelCopyWithImpl(this._self, this._then);

  final _VerifyOTPResponseModel _self;
  final $Res Function(_VerifyOTPResponseModel) _then;

/// Create a copy of VerifyOTPResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? phoneVerified = freezed,Object? emailVerified = freezed,Object? message = null,Object? user = freezed,Object? tokens = freezed,Object? redirectUrl = freezed,}) {
  return _then(_VerifyOTPResponseModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,phoneVerified: freezed == phoneVerified ? _self.phoneVerified : phoneVerified // ignore: cast_nullable_to_non_nullable
as bool?,emailVerified: freezed == emailVerified ? _self.emailVerified : emailVerified // ignore: cast_nullable_to_non_nullable
as bool?,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,tokens: freezed == tokens ? _self.tokens : tokens // ignore: cast_nullable_to_non_nullable
as TokenModel?,redirectUrl: freezed == redirectUrl ? _self.redirectUrl : redirectUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of VerifyOTPResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TokenModelCopyWith<$Res>? get tokens {
    if (_self.tokens == null) {
    return null;
  }

  return $TokenModelCopyWith<$Res>(_self.tokens!, (value) {
    return _then(_self.copyWith(tokens: value));
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
