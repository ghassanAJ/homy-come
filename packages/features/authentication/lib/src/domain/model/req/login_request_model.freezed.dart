// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
LoginWithOTPRequestModel _$LoginWithOTPRequestModelFromJson(
  Map<String, dynamic> json
) {
        switch (json['type']) {
                  case 'email':
          return EmailOTPRequestModel.fromJson(
            json
          );
                case 'phoneNumber':
          return PhoneOTPRequestModel.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'type',
  'LoginWithOTPRequestModel',
  'Invalid union type "${json['type']}"!'
);
        }
      
}

/// @nodoc
mixin _$LoginWithOTPRequestModel {

@JsonKey(name: 'flow_type') String get flowType;@JsonKey(name: 'device_id') String get deviceId;
/// Create a copy of LoginWithOTPRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginWithOTPRequestModelCopyWith<LoginWithOTPRequestModel> get copyWith => _$LoginWithOTPRequestModelCopyWithImpl<LoginWithOTPRequestModel>(this as LoginWithOTPRequestModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginWithOTPRequestModel&&(identical(other.flowType, flowType) || other.flowType == flowType)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,flowType,deviceId);

@override
String toString() {
  return 'LoginWithOTPRequestModel(flowType: $flowType, deviceId: $deviceId)';
}


}

/// @nodoc
abstract mixin class $LoginWithOTPRequestModelCopyWith<$Res>  {
  factory $LoginWithOTPRequestModelCopyWith(LoginWithOTPRequestModel value, $Res Function(LoginWithOTPRequestModel) _then) = _$LoginWithOTPRequestModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'flow_type') String flowType,@JsonKey(name: 'device_id') String deviceId
});




}
/// @nodoc
class _$LoginWithOTPRequestModelCopyWithImpl<$Res>
    implements $LoginWithOTPRequestModelCopyWith<$Res> {
  _$LoginWithOTPRequestModelCopyWithImpl(this._self, this._then);

  final LoginWithOTPRequestModel _self;
  final $Res Function(LoginWithOTPRequestModel) _then;

/// Create a copy of LoginWithOTPRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? flowType = null,Object? deviceId = null,}) {
  return _then(_self.copyWith(
flowType: null == flowType ? _self.flowType : flowType // ignore: cast_nullable_to_non_nullable
as String,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LoginWithOTPRequestModel].
extension LoginWithOTPRequestModelPatterns on LoginWithOTPRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( EmailOTPRequestModel value)?  email,TResult Function( PhoneOTPRequestModel value)?  phoneNumber,required TResult orElse(),}){
final _that = this;
switch (_that) {
case EmailOTPRequestModel() when email != null:
return email(_that);case PhoneOTPRequestModel() when phoneNumber != null:
return phoneNumber(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( EmailOTPRequestModel value)  email,required TResult Function( PhoneOTPRequestModel value)  phoneNumber,}){
final _that = this;
switch (_that) {
case EmailOTPRequestModel():
return email(_that);case PhoneOTPRequestModel():
return phoneNumber(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( EmailOTPRequestModel value)?  email,TResult? Function( PhoneOTPRequestModel value)?  phoneNumber,}){
final _that = this;
switch (_that) {
case EmailOTPRequestModel() when email != null:
return email(_that);case PhoneOTPRequestModel() when phoneNumber != null:
return phoneNumber(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String email, @JsonKey(name: 'flow_type')  String flowType, @JsonKey(name: 'device_id')  String deviceId)?  email,TResult Function(@JsonKey(name: 'phone')  String phoneNumber, @JsonKey(name: 'flow_type')  String flowType, @JsonKey(name: 'device_id')  String deviceId)?  phoneNumber,required TResult orElse(),}) {final _that = this;
switch (_that) {
case EmailOTPRequestModel() when email != null:
return email(_that.email,_that.flowType,_that.deviceId);case PhoneOTPRequestModel() when phoneNumber != null:
return phoneNumber(_that.phoneNumber,_that.flowType,_that.deviceId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String email, @JsonKey(name: 'flow_type')  String flowType, @JsonKey(name: 'device_id')  String deviceId)  email,required TResult Function(@JsonKey(name: 'phone')  String phoneNumber, @JsonKey(name: 'flow_type')  String flowType, @JsonKey(name: 'device_id')  String deviceId)  phoneNumber,}) {final _that = this;
switch (_that) {
case EmailOTPRequestModel():
return email(_that.email,_that.flowType,_that.deviceId);case PhoneOTPRequestModel():
return phoneNumber(_that.phoneNumber,_that.flowType,_that.deviceId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String email, @JsonKey(name: 'flow_type')  String flowType, @JsonKey(name: 'device_id')  String deviceId)?  email,TResult? Function(@JsonKey(name: 'phone')  String phoneNumber, @JsonKey(name: 'flow_type')  String flowType, @JsonKey(name: 'device_id')  String deviceId)?  phoneNumber,}) {final _that = this;
switch (_that) {
case EmailOTPRequestModel() when email != null:
return email(_that.email,_that.flowType,_that.deviceId);case PhoneOTPRequestModel() when phoneNumber != null:
return phoneNumber(_that.phoneNumber,_that.flowType,_that.deviceId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(createToJson: false)

class EmailOTPRequestModel extends LoginWithOTPRequestModel {
  const EmailOTPRequestModel({required this.email, @JsonKey(name: 'flow_type') this.flowType = 'otp', @JsonKey(name: 'device_id') required this.deviceId, final  String? $type}): $type = $type ?? 'email',super._();
  factory EmailOTPRequestModel.fromJson(Map<String, dynamic> json) => _$EmailOTPRequestModelFromJson(json);

 final  String email;
@override@JsonKey(name: 'flow_type') final  String flowType;
@override@JsonKey(name: 'device_id') final  String deviceId;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of LoginWithOTPRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmailOTPRequestModelCopyWith<EmailOTPRequestModel> get copyWith => _$EmailOTPRequestModelCopyWithImpl<EmailOTPRequestModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmailOTPRequestModel&&(identical(other.email, email) || other.email == email)&&(identical(other.flowType, flowType) || other.flowType == flowType)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,flowType,deviceId);

@override
String toString() {
  return 'LoginWithOTPRequestModel.email(email: $email, flowType: $flowType, deviceId: $deviceId)';
}


}

/// @nodoc
abstract mixin class $EmailOTPRequestModelCopyWith<$Res> implements $LoginWithOTPRequestModelCopyWith<$Res> {
  factory $EmailOTPRequestModelCopyWith(EmailOTPRequestModel value, $Res Function(EmailOTPRequestModel) _then) = _$EmailOTPRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String email,@JsonKey(name: 'flow_type') String flowType,@JsonKey(name: 'device_id') String deviceId
});




}
/// @nodoc
class _$EmailOTPRequestModelCopyWithImpl<$Res>
    implements $EmailOTPRequestModelCopyWith<$Res> {
  _$EmailOTPRequestModelCopyWithImpl(this._self, this._then);

  final EmailOTPRequestModel _self;
  final $Res Function(EmailOTPRequestModel) _then;

/// Create a copy of LoginWithOTPRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? flowType = null,Object? deviceId = null,}) {
  return _then(EmailOTPRequestModel(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,flowType: null == flowType ? _self.flowType : flowType // ignore: cast_nullable_to_non_nullable
as String,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable(createToJson: false)

class PhoneOTPRequestModel extends LoginWithOTPRequestModel {
  const PhoneOTPRequestModel({@JsonKey(name: 'phone') required this.phoneNumber, @JsonKey(name: 'flow_type') this.flowType = 'otp', @JsonKey(name: 'device_id') required this.deviceId, final  String? $type}): $type = $type ?? 'phoneNumber',super._();
  factory PhoneOTPRequestModel.fromJson(Map<String, dynamic> json) => _$PhoneOTPRequestModelFromJson(json);

@JsonKey(name: 'phone') final  String phoneNumber;
@override@JsonKey(name: 'flow_type') final  String flowType;
@override@JsonKey(name: 'device_id') final  String deviceId;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of LoginWithOTPRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhoneOTPRequestModelCopyWith<PhoneOTPRequestModel> get copyWith => _$PhoneOTPRequestModelCopyWithImpl<PhoneOTPRequestModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhoneOTPRequestModel&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.flowType, flowType) || other.flowType == flowType)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phoneNumber,flowType,deviceId);

@override
String toString() {
  return 'LoginWithOTPRequestModel.phoneNumber(phoneNumber: $phoneNumber, flowType: $flowType, deviceId: $deviceId)';
}


}

/// @nodoc
abstract mixin class $PhoneOTPRequestModelCopyWith<$Res> implements $LoginWithOTPRequestModelCopyWith<$Res> {
  factory $PhoneOTPRequestModelCopyWith(PhoneOTPRequestModel value, $Res Function(PhoneOTPRequestModel) _then) = _$PhoneOTPRequestModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'phone') String phoneNumber,@JsonKey(name: 'flow_type') String flowType,@JsonKey(name: 'device_id') String deviceId
});




}
/// @nodoc
class _$PhoneOTPRequestModelCopyWithImpl<$Res>
    implements $PhoneOTPRequestModelCopyWith<$Res> {
  _$PhoneOTPRequestModelCopyWithImpl(this._self, this._then);

  final PhoneOTPRequestModel _self;
  final $Res Function(PhoneOTPRequestModel) _then;

/// Create a copy of LoginWithOTPRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phoneNumber = null,Object? flowType = null,Object? deviceId = null,}) {
  return _then(PhoneOTPRequestModel(
phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,flowType: null == flowType ? _self.flowType : flowType // ignore: cast_nullable_to_non_nullable
as String,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$LoginWithPinRequestModel {

 String get pin;// 6-digit PIN code
@JsonKey(name: 'device_id') String get deviceId;
/// Create a copy of LoginWithPinRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginWithPinRequestModelCopyWith<LoginWithPinRequestModel> get copyWith => _$LoginWithPinRequestModelCopyWithImpl<LoginWithPinRequestModel>(this as LoginWithPinRequestModel, _$identity);

  /// Serializes this LoginWithPinRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginWithPinRequestModel&&(identical(other.pin, pin) || other.pin == pin)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pin,deviceId);

@override
String toString() {
  return 'LoginWithPinRequestModel(pin: $pin, deviceId: $deviceId)';
}


}

/// @nodoc
abstract mixin class $LoginWithPinRequestModelCopyWith<$Res>  {
  factory $LoginWithPinRequestModelCopyWith(LoginWithPinRequestModel value, $Res Function(LoginWithPinRequestModel) _then) = _$LoginWithPinRequestModelCopyWithImpl;
@useResult
$Res call({
 String pin,@JsonKey(name: 'device_id') String deviceId
});




}
/// @nodoc
class _$LoginWithPinRequestModelCopyWithImpl<$Res>
    implements $LoginWithPinRequestModelCopyWith<$Res> {
  _$LoginWithPinRequestModelCopyWithImpl(this._self, this._then);

  final LoginWithPinRequestModel _self;
  final $Res Function(LoginWithPinRequestModel) _then;

/// Create a copy of LoginWithPinRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pin = null,Object? deviceId = null,}) {
  return _then(_self.copyWith(
pin: null == pin ? _self.pin : pin // ignore: cast_nullable_to_non_nullable
as String,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LoginWithPinRequestModel].
extension LoginWithPinRequestModelPatterns on LoginWithPinRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginWithPinRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginWithPinRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginWithPinRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _LoginWithPinRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginWithPinRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _LoginWithPinRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String pin, @JsonKey(name: 'device_id')  String deviceId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginWithPinRequestModel() when $default != null:
return $default(_that.pin,_that.deviceId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String pin, @JsonKey(name: 'device_id')  String deviceId)  $default,) {final _that = this;
switch (_that) {
case _LoginWithPinRequestModel():
return $default(_that.pin,_that.deviceId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String pin, @JsonKey(name: 'device_id')  String deviceId)?  $default,) {final _that = this;
switch (_that) {
case _LoginWithPinRequestModel() when $default != null:
return $default(_that.pin,_that.deviceId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginWithPinRequestModel implements LoginWithPinRequestModel {
  const _LoginWithPinRequestModel({required this.pin, @JsonKey(name: 'device_id') required this.deviceId});
  factory _LoginWithPinRequestModel.fromJson(Map<String, dynamic> json) => _$LoginWithPinRequestModelFromJson(json);

@override final  String pin;
// 6-digit PIN code
@override@JsonKey(name: 'device_id') final  String deviceId;

/// Create a copy of LoginWithPinRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginWithPinRequestModelCopyWith<_LoginWithPinRequestModel> get copyWith => __$LoginWithPinRequestModelCopyWithImpl<_LoginWithPinRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginWithPinRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginWithPinRequestModel&&(identical(other.pin, pin) || other.pin == pin)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pin,deviceId);

@override
String toString() {
  return 'LoginWithPinRequestModel(pin: $pin, deviceId: $deviceId)';
}


}

/// @nodoc
abstract mixin class _$LoginWithPinRequestModelCopyWith<$Res> implements $LoginWithPinRequestModelCopyWith<$Res> {
  factory _$LoginWithPinRequestModelCopyWith(_LoginWithPinRequestModel value, $Res Function(_LoginWithPinRequestModel) _then) = __$LoginWithPinRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String pin,@JsonKey(name: 'device_id') String deviceId
});




}
/// @nodoc
class __$LoginWithPinRequestModelCopyWithImpl<$Res>
    implements _$LoginWithPinRequestModelCopyWith<$Res> {
  __$LoginWithPinRequestModelCopyWithImpl(this._self, this._then);

  final _LoginWithPinRequestModel _self;
  final $Res Function(_LoginWithPinRequestModel) _then;

/// Create a copy of LoginWithPinRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pin = null,Object? deviceId = null,}) {
  return _then(_LoginWithPinRequestModel(
pin: null == pin ? _self.pin : pin // ignore: cast_nullable_to_non_nullable
as String,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
