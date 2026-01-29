// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SendOTPRequestModel {

 String? get phone; String? get email;@JsonKey(name: 'device_id') String get deviceId;
/// Create a copy of SendOTPRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendOTPRequestModelCopyWith<SendOTPRequestModel> get copyWith => _$SendOTPRequestModelCopyWithImpl<SendOTPRequestModel>(this as SendOTPRequestModel, _$identity);

  /// Serializes this SendOTPRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendOTPRequestModel&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phone,email,deviceId);

@override
String toString() {
  return 'SendOTPRequestModel(phone: $phone, email: $email, deviceId: $deviceId)';
}


}

/// @nodoc
abstract mixin class $SendOTPRequestModelCopyWith<$Res>  {
  factory $SendOTPRequestModelCopyWith(SendOTPRequestModel value, $Res Function(SendOTPRequestModel) _then) = _$SendOTPRequestModelCopyWithImpl;
@useResult
$Res call({
 String? phone, String? email,@JsonKey(name: 'device_id') String deviceId
});




}
/// @nodoc
class _$SendOTPRequestModelCopyWithImpl<$Res>
    implements $SendOTPRequestModelCopyWith<$Res> {
  _$SendOTPRequestModelCopyWithImpl(this._self, this._then);

  final SendOTPRequestModel _self;
  final $Res Function(SendOTPRequestModel) _then;

/// Create a copy of SendOTPRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phone = freezed,Object? email = freezed,Object? deviceId = null,}) {
  return _then(_self.copyWith(
phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SendOTPRequestModel].
extension SendOTPRequestModelPatterns on SendOTPRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SendOTPRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SendOTPRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SendOTPRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _SendOTPRequestModel():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SendOTPRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _SendOTPRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? phone,  String? email, @JsonKey(name: 'device_id')  String deviceId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SendOTPRequestModel() when $default != null:
return $default(_that.phone,_that.email,_that.deviceId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? phone,  String? email, @JsonKey(name: 'device_id')  String deviceId)  $default,) {final _that = this;
switch (_that) {
case _SendOTPRequestModel():
return $default(_that.phone,_that.email,_that.deviceId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? phone,  String? email, @JsonKey(name: 'device_id')  String deviceId)?  $default,) {final _that = this;
switch (_that) {
case _SendOTPRequestModel() when $default != null:
return $default(_that.phone,_that.email,_that.deviceId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SendOTPRequestModel implements SendOTPRequestModel {
  const _SendOTPRequestModel({this.phone, this.email, @JsonKey(name: 'device_id') required this.deviceId});
  factory _SendOTPRequestModel.fromJson(Map<String, dynamic> json) => _$SendOTPRequestModelFromJson(json);

@override final  String? phone;
@override final  String? email;
@override@JsonKey(name: 'device_id') final  String deviceId;

/// Create a copy of SendOTPRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendOTPRequestModelCopyWith<_SendOTPRequestModel> get copyWith => __$SendOTPRequestModelCopyWithImpl<_SendOTPRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SendOTPRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendOTPRequestModel&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phone,email,deviceId);

@override
String toString() {
  return 'SendOTPRequestModel(phone: $phone, email: $email, deviceId: $deviceId)';
}


}

/// @nodoc
abstract mixin class _$SendOTPRequestModelCopyWith<$Res> implements $SendOTPRequestModelCopyWith<$Res> {
  factory _$SendOTPRequestModelCopyWith(_SendOTPRequestModel value, $Res Function(_SendOTPRequestModel) _then) = __$SendOTPRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String? phone, String? email,@JsonKey(name: 'device_id') String deviceId
});




}
/// @nodoc
class __$SendOTPRequestModelCopyWithImpl<$Res>
    implements _$SendOTPRequestModelCopyWith<$Res> {
  __$SendOTPRequestModelCopyWithImpl(this._self, this._then);

  final _SendOTPRequestModel _self;
  final $Res Function(_SendOTPRequestModel) _then;

/// Create a copy of SendOTPRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phone = freezed,Object? email = freezed,Object? deviceId = null,}) {
  return _then(_SendOTPRequestModel(
phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ProfileDataModel {

@JsonKey(name: 'first_name') String get firstName;@JsonKey(name: 'last_name') String get lastName; String get dob;// DD/MM/YYYY format
 String? get email; String? get password; String? get username; String? get nickname;
/// Create a copy of ProfileDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileDataModelCopyWith<ProfileDataModel> get copyWith => _$ProfileDataModelCopyWithImpl<ProfileDataModel>(this as ProfileDataModel, _$identity);

  /// Serializes this ProfileDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileDataModel&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.dob, dob) || other.dob == dob)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.username, username) || other.username == username)&&(identical(other.nickname, nickname) || other.nickname == nickname));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,dob,email,password,username,nickname);

@override
String toString() {
  return 'ProfileDataModel(firstName: $firstName, lastName: $lastName, dob: $dob, email: $email, password: $password, username: $username, nickname: $nickname)';
}


}

/// @nodoc
abstract mixin class $ProfileDataModelCopyWith<$Res>  {
  factory $ProfileDataModelCopyWith(ProfileDataModel value, $Res Function(ProfileDataModel) _then) = _$ProfileDataModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'first_name') String firstName,@JsonKey(name: 'last_name') String lastName, String dob, String? email, String? password, String? username, String? nickname
});




}
/// @nodoc
class _$ProfileDataModelCopyWithImpl<$Res>
    implements $ProfileDataModelCopyWith<$Res> {
  _$ProfileDataModelCopyWithImpl(this._self, this._then);

  final ProfileDataModel _self;
  final $Res Function(ProfileDataModel) _then;

/// Create a copy of ProfileDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstName = null,Object? lastName = null,Object? dob = null,Object? email = freezed,Object? password = freezed,Object? username = freezed,Object? nickname = freezed,}) {
  return _then(_self.copyWith(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,dob: null == dob ? _self.dob : dob // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,nickname: freezed == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileDataModel].
extension ProfileDataModelPatterns on ProfileDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileDataModel value)  $default,){
final _that = this;
switch (_that) {
case _ProfileDataModel():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileDataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName,  String dob,  String? email,  String? password,  String? username,  String? nickname)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileDataModel() when $default != null:
return $default(_that.firstName,_that.lastName,_that.dob,_that.email,_that.password,_that.username,_that.nickname);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName,  String dob,  String? email,  String? password,  String? username,  String? nickname)  $default,) {final _that = this;
switch (_that) {
case _ProfileDataModel():
return $default(_that.firstName,_that.lastName,_that.dob,_that.email,_that.password,_that.username,_that.nickname);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName,  String dob,  String? email,  String? password,  String? username,  String? nickname)?  $default,) {final _that = this;
switch (_that) {
case _ProfileDataModel() when $default != null:
return $default(_that.firstName,_that.lastName,_that.dob,_that.email,_that.password,_that.username,_that.nickname);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileDataModel implements ProfileDataModel {
  const _ProfileDataModel({@JsonKey(name: 'first_name') required this.firstName, @JsonKey(name: 'last_name') required this.lastName, required this.dob, this.email, this.password, this.username, this.nickname});
  factory _ProfileDataModel.fromJson(Map<String, dynamic> json) => _$ProfileDataModelFromJson(json);

@override@JsonKey(name: 'first_name') final  String firstName;
@override@JsonKey(name: 'last_name') final  String lastName;
@override final  String dob;
// DD/MM/YYYY format
@override final  String? email;
@override final  String? password;
@override final  String? username;
@override final  String? nickname;

/// Create a copy of ProfileDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileDataModelCopyWith<_ProfileDataModel> get copyWith => __$ProfileDataModelCopyWithImpl<_ProfileDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileDataModel&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.dob, dob) || other.dob == dob)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.username, username) || other.username == username)&&(identical(other.nickname, nickname) || other.nickname == nickname));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,dob,email,password,username,nickname);

@override
String toString() {
  return 'ProfileDataModel(firstName: $firstName, lastName: $lastName, dob: $dob, email: $email, password: $password, username: $username, nickname: $nickname)';
}


}

/// @nodoc
abstract mixin class _$ProfileDataModelCopyWith<$Res> implements $ProfileDataModelCopyWith<$Res> {
  factory _$ProfileDataModelCopyWith(_ProfileDataModel value, $Res Function(_ProfileDataModel) _then) = __$ProfileDataModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'first_name') String firstName,@JsonKey(name: 'last_name') String lastName, String dob, String? email, String? password, String? username, String? nickname
});




}
/// @nodoc
class __$ProfileDataModelCopyWithImpl<$Res>
    implements _$ProfileDataModelCopyWith<$Res> {
  __$ProfileDataModelCopyWithImpl(this._self, this._then);

  final _ProfileDataModel _self;
  final $Res Function(_ProfileDataModel) _then;

/// Create a copy of ProfileDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstName = null,Object? lastName = null,Object? dob = null,Object? email = freezed,Object? password = freezed,Object? username = freezed,Object? nickname = freezed,}) {
  return _then(_ProfileDataModel(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,dob: null == dob ? _self.dob : dob // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,nickname: freezed == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$UnifiedVerifyOTPRequestModel {

 String get id;// Session ID from login response
 String get otp;
/// Create a copy of UnifiedVerifyOTPRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnifiedVerifyOTPRequestModelCopyWith<UnifiedVerifyOTPRequestModel> get copyWith => _$UnifiedVerifyOTPRequestModelCopyWithImpl<UnifiedVerifyOTPRequestModel>(this as UnifiedVerifyOTPRequestModel, _$identity);

  /// Serializes this UnifiedVerifyOTPRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnifiedVerifyOTPRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.otp, otp) || other.otp == otp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,otp);

@override
String toString() {
  return 'UnifiedVerifyOTPRequestModel(id: $id, otp: $otp)';
}


}

/// @nodoc
abstract mixin class $UnifiedVerifyOTPRequestModelCopyWith<$Res>  {
  factory $UnifiedVerifyOTPRequestModelCopyWith(UnifiedVerifyOTPRequestModel value, $Res Function(UnifiedVerifyOTPRequestModel) _then) = _$UnifiedVerifyOTPRequestModelCopyWithImpl;
@useResult
$Res call({
 String id, String otp
});




}
/// @nodoc
class _$UnifiedVerifyOTPRequestModelCopyWithImpl<$Res>
    implements $UnifiedVerifyOTPRequestModelCopyWith<$Res> {
  _$UnifiedVerifyOTPRequestModelCopyWithImpl(this._self, this._then);

  final UnifiedVerifyOTPRequestModel _self;
  final $Res Function(UnifiedVerifyOTPRequestModel) _then;

/// Create a copy of UnifiedVerifyOTPRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? otp = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UnifiedVerifyOTPRequestModel].
extension UnifiedVerifyOTPRequestModelPatterns on UnifiedVerifyOTPRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UnifiedVerifyOTPRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UnifiedVerifyOTPRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UnifiedVerifyOTPRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _UnifiedVerifyOTPRequestModel():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UnifiedVerifyOTPRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _UnifiedVerifyOTPRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String otp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UnifiedVerifyOTPRequestModel() when $default != null:
return $default(_that.id,_that.otp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String otp)  $default,) {final _that = this;
switch (_that) {
case _UnifiedVerifyOTPRequestModel():
return $default(_that.id,_that.otp);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String otp)?  $default,) {final _that = this;
switch (_that) {
case _UnifiedVerifyOTPRequestModel() when $default != null:
return $default(_that.id,_that.otp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UnifiedVerifyOTPRequestModel implements UnifiedVerifyOTPRequestModel {
  const _UnifiedVerifyOTPRequestModel({required this.id, required this.otp});
  factory _UnifiedVerifyOTPRequestModel.fromJson(Map<String, dynamic> json) => _$UnifiedVerifyOTPRequestModelFromJson(json);

@override final  String id;
// Session ID from login response
@override final  String otp;

/// Create a copy of UnifiedVerifyOTPRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnifiedVerifyOTPRequestModelCopyWith<_UnifiedVerifyOTPRequestModel> get copyWith => __$UnifiedVerifyOTPRequestModelCopyWithImpl<_UnifiedVerifyOTPRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UnifiedVerifyOTPRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnifiedVerifyOTPRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.otp, otp) || other.otp == otp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,otp);

@override
String toString() {
  return 'UnifiedVerifyOTPRequestModel(id: $id, otp: $otp)';
}


}

/// @nodoc
abstract mixin class _$UnifiedVerifyOTPRequestModelCopyWith<$Res> implements $UnifiedVerifyOTPRequestModelCopyWith<$Res> {
  factory _$UnifiedVerifyOTPRequestModelCopyWith(_UnifiedVerifyOTPRequestModel value, $Res Function(_UnifiedVerifyOTPRequestModel) _then) = __$UnifiedVerifyOTPRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String otp
});




}
/// @nodoc
class __$UnifiedVerifyOTPRequestModelCopyWithImpl<$Res>
    implements _$UnifiedVerifyOTPRequestModelCopyWith<$Res> {
  __$UnifiedVerifyOTPRequestModelCopyWithImpl(this._self, this._then);

  final _UnifiedVerifyOTPRequestModel _self;
  final $Res Function(_UnifiedVerifyOTPRequestModel) _then;

/// Create a copy of UnifiedVerifyOTPRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? otp = null,}) {
  return _then(_UnifiedVerifyOTPRequestModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SaveProfileRequestModel {

 String? get password;// Optional for passwordless flow
 String get username;@JsonKey(name: 'first_name') String get firstName;@JsonKey(name: 'last_name') String get lastName; String? get nickname; String get dob; String? get email; String? get phone;@JsonKey(name: 'device_id') String get deviceId;
/// Create a copy of SaveProfileRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaveProfileRequestModelCopyWith<SaveProfileRequestModel> get copyWith => _$SaveProfileRequestModelCopyWithImpl<SaveProfileRequestModel>(this as SaveProfileRequestModel, _$identity);

  /// Serializes this SaveProfileRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaveProfileRequestModel&&(identical(other.password, password) || other.password == password)&&(identical(other.username, username) || other.username == username)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.dob, dob) || other.dob == dob)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,password,username,firstName,lastName,nickname,dob,email,phone,deviceId);

@override
String toString() {
  return 'SaveProfileRequestModel(password: $password, username: $username, firstName: $firstName, lastName: $lastName, nickname: $nickname, dob: $dob, email: $email, phone: $phone, deviceId: $deviceId)';
}


}

/// @nodoc
abstract mixin class $SaveProfileRequestModelCopyWith<$Res>  {
  factory $SaveProfileRequestModelCopyWith(SaveProfileRequestModel value, $Res Function(SaveProfileRequestModel) _then) = _$SaveProfileRequestModelCopyWithImpl;
@useResult
$Res call({
 String? password, String username,@JsonKey(name: 'first_name') String firstName,@JsonKey(name: 'last_name') String lastName, String? nickname, String dob, String? email, String? phone,@JsonKey(name: 'device_id') String deviceId
});




}
/// @nodoc
class _$SaveProfileRequestModelCopyWithImpl<$Res>
    implements $SaveProfileRequestModelCopyWith<$Res> {
  _$SaveProfileRequestModelCopyWithImpl(this._self, this._then);

  final SaveProfileRequestModel _self;
  final $Res Function(SaveProfileRequestModel) _then;

/// Create a copy of SaveProfileRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? password = freezed,Object? username = null,Object? firstName = null,Object? lastName = null,Object? nickname = freezed,Object? dob = null,Object? email = freezed,Object? phone = freezed,Object? deviceId = null,}) {
  return _then(_self.copyWith(
password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,nickname: freezed == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String?,dob: null == dob ? _self.dob : dob // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SaveProfileRequestModel].
extension SaveProfileRequestModelPatterns on SaveProfileRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SaveProfileRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SaveProfileRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SaveProfileRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _SaveProfileRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SaveProfileRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _SaveProfileRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? password,  String username, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName,  String? nickname,  String dob,  String? email,  String? phone, @JsonKey(name: 'device_id')  String deviceId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SaveProfileRequestModel() when $default != null:
return $default(_that.password,_that.username,_that.firstName,_that.lastName,_that.nickname,_that.dob,_that.email,_that.phone,_that.deviceId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? password,  String username, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName,  String? nickname,  String dob,  String? email,  String? phone, @JsonKey(name: 'device_id')  String deviceId)  $default,) {final _that = this;
switch (_that) {
case _SaveProfileRequestModel():
return $default(_that.password,_that.username,_that.firstName,_that.lastName,_that.nickname,_that.dob,_that.email,_that.phone,_that.deviceId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? password,  String username, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName,  String? nickname,  String dob,  String? email,  String? phone, @JsonKey(name: 'device_id')  String deviceId)?  $default,) {final _that = this;
switch (_that) {
case _SaveProfileRequestModel() when $default != null:
return $default(_that.password,_that.username,_that.firstName,_that.lastName,_that.nickname,_that.dob,_that.email,_that.phone,_that.deviceId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SaveProfileRequestModel implements SaveProfileRequestModel {
  const _SaveProfileRequestModel({this.password, required this.username, @JsonKey(name: 'first_name') required this.firstName, @JsonKey(name: 'last_name') required this.lastName, this.nickname, required this.dob, this.email, this.phone, @JsonKey(name: 'device_id') required this.deviceId});
  factory _SaveProfileRequestModel.fromJson(Map<String, dynamic> json) => _$SaveProfileRequestModelFromJson(json);

@override final  String? password;
// Optional for passwordless flow
@override final  String username;
@override@JsonKey(name: 'first_name') final  String firstName;
@override@JsonKey(name: 'last_name') final  String lastName;
@override final  String? nickname;
@override final  String dob;
@override final  String? email;
@override final  String? phone;
@override@JsonKey(name: 'device_id') final  String deviceId;

/// Create a copy of SaveProfileRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaveProfileRequestModelCopyWith<_SaveProfileRequestModel> get copyWith => __$SaveProfileRequestModelCopyWithImpl<_SaveProfileRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SaveProfileRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaveProfileRequestModel&&(identical(other.password, password) || other.password == password)&&(identical(other.username, username) || other.username == username)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.dob, dob) || other.dob == dob)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,password,username,firstName,lastName,nickname,dob,email,phone,deviceId);

@override
String toString() {
  return 'SaveProfileRequestModel(password: $password, username: $username, firstName: $firstName, lastName: $lastName, nickname: $nickname, dob: $dob, email: $email, phone: $phone, deviceId: $deviceId)';
}


}

/// @nodoc
abstract mixin class _$SaveProfileRequestModelCopyWith<$Res> implements $SaveProfileRequestModelCopyWith<$Res> {
  factory _$SaveProfileRequestModelCopyWith(_SaveProfileRequestModel value, $Res Function(_SaveProfileRequestModel) _then) = __$SaveProfileRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String? password, String username,@JsonKey(name: 'first_name') String firstName,@JsonKey(name: 'last_name') String lastName, String? nickname, String dob, String? email, String? phone,@JsonKey(name: 'device_id') String deviceId
});




}
/// @nodoc
class __$SaveProfileRequestModelCopyWithImpl<$Res>
    implements _$SaveProfileRequestModelCopyWith<$Res> {
  __$SaveProfileRequestModelCopyWithImpl(this._self, this._then);

  final _SaveProfileRequestModel _self;
  final $Res Function(_SaveProfileRequestModel) _then;

/// Create a copy of SaveProfileRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? password = freezed,Object? username = null,Object? firstName = null,Object? lastName = null,Object? nickname = freezed,Object? dob = null,Object? email = freezed,Object? phone = freezed,Object? deviceId = null,}) {
  return _then(_SaveProfileRequestModel(
password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,nickname: freezed == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String?,dob: null == dob ? _self.dob : dob // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
