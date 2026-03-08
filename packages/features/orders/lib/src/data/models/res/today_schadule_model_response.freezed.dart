// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'today_schadule_model_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TodaySchaduleModelResponse {

 int get id; String get time; String get date; String get address; ProviderModel get cleanerInfo;
/// Create a copy of TodaySchaduleModelResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodaySchaduleModelResponseCopyWith<TodaySchaduleModelResponse> get copyWith => _$TodaySchaduleModelResponseCopyWithImpl<TodaySchaduleModelResponse>(this as TodaySchaduleModelResponse, _$identity);

  /// Serializes this TodaySchaduleModelResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodaySchaduleModelResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.time, time) || other.time == time)&&(identical(other.date, date) || other.date == date)&&(identical(other.address, address) || other.address == address)&&(identical(other.cleanerInfo, cleanerInfo) || other.cleanerInfo == cleanerInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,time,date,address,cleanerInfo);

@override
String toString() {
  return 'TodaySchaduleModelResponse(id: $id, time: $time, date: $date, address: $address, cleanerInfo: $cleanerInfo)';
}


}

/// @nodoc
abstract mixin class $TodaySchaduleModelResponseCopyWith<$Res>  {
  factory $TodaySchaduleModelResponseCopyWith(TodaySchaduleModelResponse value, $Res Function(TodaySchaduleModelResponse) _then) = _$TodaySchaduleModelResponseCopyWithImpl;
@useResult
$Res call({
 int id, String time, String date, String address, ProviderModel cleanerInfo
});


$ProviderModelCopyWith<$Res> get cleanerInfo;

}
/// @nodoc
class _$TodaySchaduleModelResponseCopyWithImpl<$Res>
    implements $TodaySchaduleModelResponseCopyWith<$Res> {
  _$TodaySchaduleModelResponseCopyWithImpl(this._self, this._then);

  final TodaySchaduleModelResponse _self;
  final $Res Function(TodaySchaduleModelResponse) _then;

/// Create a copy of TodaySchaduleModelResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? time = null,Object? date = null,Object? address = null,Object? cleanerInfo = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,cleanerInfo: null == cleanerInfo ? _self.cleanerInfo : cleanerInfo // ignore: cast_nullable_to_non_nullable
as ProviderModel,
  ));
}
/// Create a copy of TodaySchaduleModelResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProviderModelCopyWith<$Res> get cleanerInfo {
  
  return $ProviderModelCopyWith<$Res>(_self.cleanerInfo, (value) {
    return _then(_self.copyWith(cleanerInfo: value));
  });
}
}


/// Adds pattern-matching-related methods to [TodaySchaduleModelResponse].
extension TodaySchaduleModelResponsePatterns on TodaySchaduleModelResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TodaySchaduleModelResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TodaySchaduleModelResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TodaySchaduleModelResponse value)  $default,){
final _that = this;
switch (_that) {
case _TodaySchaduleModelResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TodaySchaduleModelResponse value)?  $default,){
final _that = this;
switch (_that) {
case _TodaySchaduleModelResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String time,  String date,  String address,  ProviderModel cleanerInfo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TodaySchaduleModelResponse() when $default != null:
return $default(_that.id,_that.time,_that.date,_that.address,_that.cleanerInfo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String time,  String date,  String address,  ProviderModel cleanerInfo)  $default,) {final _that = this;
switch (_that) {
case _TodaySchaduleModelResponse():
return $default(_that.id,_that.time,_that.date,_that.address,_that.cleanerInfo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String time,  String date,  String address,  ProviderModel cleanerInfo)?  $default,) {final _that = this;
switch (_that) {
case _TodaySchaduleModelResponse() when $default != null:
return $default(_that.id,_that.time,_that.date,_that.address,_that.cleanerInfo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TodaySchaduleModelResponse implements TodaySchaduleModelResponse {
   _TodaySchaduleModelResponse({required this.id, required this.time, required this.date, required this.address, required this.cleanerInfo});
  factory _TodaySchaduleModelResponse.fromJson(Map<String, dynamic> json) => _$TodaySchaduleModelResponseFromJson(json);

@override final  int id;
@override final  String time;
@override final  String date;
@override final  String address;
@override final  ProviderModel cleanerInfo;

/// Create a copy of TodaySchaduleModelResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TodaySchaduleModelResponseCopyWith<_TodaySchaduleModelResponse> get copyWith => __$TodaySchaduleModelResponseCopyWithImpl<_TodaySchaduleModelResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TodaySchaduleModelResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TodaySchaduleModelResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.time, time) || other.time == time)&&(identical(other.date, date) || other.date == date)&&(identical(other.address, address) || other.address == address)&&(identical(other.cleanerInfo, cleanerInfo) || other.cleanerInfo == cleanerInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,time,date,address,cleanerInfo);

@override
String toString() {
  return 'TodaySchaduleModelResponse(id: $id, time: $time, date: $date, address: $address, cleanerInfo: $cleanerInfo)';
}


}

/// @nodoc
abstract mixin class _$TodaySchaduleModelResponseCopyWith<$Res> implements $TodaySchaduleModelResponseCopyWith<$Res> {
  factory _$TodaySchaduleModelResponseCopyWith(_TodaySchaduleModelResponse value, $Res Function(_TodaySchaduleModelResponse) _then) = __$TodaySchaduleModelResponseCopyWithImpl;
@override @useResult
$Res call({
 int id, String time, String date, String address, ProviderModel cleanerInfo
});


@override $ProviderModelCopyWith<$Res> get cleanerInfo;

}
/// @nodoc
class __$TodaySchaduleModelResponseCopyWithImpl<$Res>
    implements _$TodaySchaduleModelResponseCopyWith<$Res> {
  __$TodaySchaduleModelResponseCopyWithImpl(this._self, this._then);

  final _TodaySchaduleModelResponse _self;
  final $Res Function(_TodaySchaduleModelResponse) _then;

/// Create a copy of TodaySchaduleModelResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? time = null,Object? date = null,Object? address = null,Object? cleanerInfo = null,}) {
  return _then(_TodaySchaduleModelResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,cleanerInfo: null == cleanerInfo ? _self.cleanerInfo : cleanerInfo // ignore: cast_nullable_to_non_nullable
as ProviderModel,
  ));
}

/// Create a copy of TodaySchaduleModelResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProviderModelCopyWith<$Res> get cleanerInfo {
  
  return $ProviderModelCopyWith<$Res>(_self.cleanerInfo, (value) {
    return _then(_self.copyWith(cleanerInfo: value));
  });
}
}

// dart format on
