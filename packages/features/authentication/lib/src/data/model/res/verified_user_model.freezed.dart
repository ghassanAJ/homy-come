// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verified_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VerifiedUserModel {

 int get id;@JsonKey(name: 'documentId') String get documentId; String get phone;@JsonKey(name: 'otp_code') String? get otpCode;@JsonKey(name: 'role_type') String get roleType;@JsonKey(name: 'profile_picture') String? get profilePicture; String? get name; String? get address;
/// Create a copy of VerifiedUserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifiedUserModelCopyWith<VerifiedUserModel> get copyWith => _$VerifiedUserModelCopyWithImpl<VerifiedUserModel>(this as VerifiedUserModel, _$identity);

  /// Serializes this VerifiedUserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifiedUserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.documentId, documentId) || other.documentId == documentId)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.otpCode, otpCode) || other.otpCode == otpCode)&&(identical(other.roleType, roleType) || other.roleType == roleType)&&(identical(other.profilePicture, profilePicture) || other.profilePicture == profilePicture)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,documentId,phone,otpCode,roleType,profilePicture,name,address);

@override
String toString() {
  return 'VerifiedUserModel(id: $id, documentId: $documentId, phone: $phone, otpCode: $otpCode, roleType: $roleType, profilePicture: $profilePicture, name: $name, address: $address)';
}


}

/// @nodoc
abstract mixin class $VerifiedUserModelCopyWith<$Res>  {
  factory $VerifiedUserModelCopyWith(VerifiedUserModel value, $Res Function(VerifiedUserModel) _then) = _$VerifiedUserModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'documentId') String documentId, String phone,@JsonKey(name: 'otp_code') String? otpCode,@JsonKey(name: 'role_type') String roleType,@JsonKey(name: 'profile_picture') String? profilePicture, String? name, String? address
});




}
/// @nodoc
class _$VerifiedUserModelCopyWithImpl<$Res>
    implements $VerifiedUserModelCopyWith<$Res> {
  _$VerifiedUserModelCopyWithImpl(this._self, this._then);

  final VerifiedUserModel _self;
  final $Res Function(VerifiedUserModel) _then;

/// Create a copy of VerifiedUserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? documentId = null,Object? phone = null,Object? otpCode = freezed,Object? roleType = null,Object? profilePicture = freezed,Object? name = freezed,Object? address = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,documentId: null == documentId ? _self.documentId : documentId // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,otpCode: freezed == otpCode ? _self.otpCode : otpCode // ignore: cast_nullable_to_non_nullable
as String?,roleType: null == roleType ? _self.roleType : roleType // ignore: cast_nullable_to_non_nullable
as String,profilePicture: freezed == profilePicture ? _self.profilePicture : profilePicture // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [VerifiedUserModel].
extension VerifiedUserModelPatterns on VerifiedUserModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerifiedUserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerifiedUserModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerifiedUserModel value)  $default,){
final _that = this;
switch (_that) {
case _VerifiedUserModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerifiedUserModel value)?  $default,){
final _that = this;
switch (_that) {
case _VerifiedUserModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'documentId')  String documentId,  String phone, @JsonKey(name: 'otp_code')  String? otpCode, @JsonKey(name: 'role_type')  String roleType, @JsonKey(name: 'profile_picture')  String? profilePicture,  String? name,  String? address)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerifiedUserModel() when $default != null:
return $default(_that.id,_that.documentId,_that.phone,_that.otpCode,_that.roleType,_that.profilePicture,_that.name,_that.address);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'documentId')  String documentId,  String phone, @JsonKey(name: 'otp_code')  String? otpCode, @JsonKey(name: 'role_type')  String roleType, @JsonKey(name: 'profile_picture')  String? profilePicture,  String? name,  String? address)  $default,) {final _that = this;
switch (_that) {
case _VerifiedUserModel():
return $default(_that.id,_that.documentId,_that.phone,_that.otpCode,_that.roleType,_that.profilePicture,_that.name,_that.address);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'documentId')  String documentId,  String phone, @JsonKey(name: 'otp_code')  String? otpCode, @JsonKey(name: 'role_type')  String roleType, @JsonKey(name: 'profile_picture')  String? profilePicture,  String? name,  String? address)?  $default,) {final _that = this;
switch (_that) {
case _VerifiedUserModel() when $default != null:
return $default(_that.id,_that.documentId,_that.phone,_that.otpCode,_that.roleType,_that.profilePicture,_that.name,_that.address);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VerifiedUserModel implements VerifiedUserModel {
  const _VerifiedUserModel({required this.id, @JsonKey(name: 'documentId') required this.documentId, required this.phone, @JsonKey(name: 'otp_code') this.otpCode, @JsonKey(name: 'role_type') required this.roleType, @JsonKey(name: 'profile_picture') this.profilePicture, this.name, this.address});
  factory _VerifiedUserModel.fromJson(Map<String, dynamic> json) => _$VerifiedUserModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'documentId') final  String documentId;
@override final  String phone;
@override@JsonKey(name: 'otp_code') final  String? otpCode;
@override@JsonKey(name: 'role_type') final  String roleType;
@override@JsonKey(name: 'profile_picture') final  String? profilePicture;
@override final  String? name;
@override final  String? address;

/// Create a copy of VerifiedUserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifiedUserModelCopyWith<_VerifiedUserModel> get copyWith => __$VerifiedUserModelCopyWithImpl<_VerifiedUserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VerifiedUserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifiedUserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.documentId, documentId) || other.documentId == documentId)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.otpCode, otpCode) || other.otpCode == otpCode)&&(identical(other.roleType, roleType) || other.roleType == roleType)&&(identical(other.profilePicture, profilePicture) || other.profilePicture == profilePicture)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,documentId,phone,otpCode,roleType,profilePicture,name,address);

@override
String toString() {
  return 'VerifiedUserModel(id: $id, documentId: $documentId, phone: $phone, otpCode: $otpCode, roleType: $roleType, profilePicture: $profilePicture, name: $name, address: $address)';
}


}

/// @nodoc
abstract mixin class _$VerifiedUserModelCopyWith<$Res> implements $VerifiedUserModelCopyWith<$Res> {
  factory _$VerifiedUserModelCopyWith(_VerifiedUserModel value, $Res Function(_VerifiedUserModel) _then) = __$VerifiedUserModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'documentId') String documentId, String phone,@JsonKey(name: 'otp_code') String? otpCode,@JsonKey(name: 'role_type') String roleType,@JsonKey(name: 'profile_picture') String? profilePicture, String? name, String? address
});




}
/// @nodoc
class __$VerifiedUserModelCopyWithImpl<$Res>
    implements _$VerifiedUserModelCopyWith<$Res> {
  __$VerifiedUserModelCopyWithImpl(this._self, this._then);

  final _VerifiedUserModel _self;
  final $Res Function(_VerifiedUserModel) _then;

/// Create a copy of VerifiedUserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? documentId = null,Object? phone = null,Object? otpCode = freezed,Object? roleType = null,Object? profilePicture = freezed,Object? name = freezed,Object? address = freezed,}) {
  return _then(_VerifiedUserModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,documentId: null == documentId ? _self.documentId : documentId // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,otpCode: freezed == otpCode ? _self.otpCode : otpCode // ignore: cast_nullable_to_non_nullable
as String?,roleType: null == roleType ? _self.roleType : roleType // ignore: cast_nullable_to_non_nullable
as String,profilePicture: freezed == profilePicture ? _self.profilePicture : profilePicture // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
