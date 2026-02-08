// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BaseState<T> {

 BaseCubitStatus get status; T? get data; APIException? get error;
/// Create a copy of BaseState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BaseStateCopyWith<T, BaseState<T>> get copyWith => _$BaseStateCopyWithImpl<T, BaseState<T>>(this as BaseState<T>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BaseState<T>&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(data),error);

@override
String toString() {
  return 'BaseState<$T>(status: $status, data: $data, error: $error)';
}


}

/// @nodoc
abstract mixin class $BaseStateCopyWith<T,$Res>  {
  factory $BaseStateCopyWith(BaseState<T> value, $Res Function(BaseState<T>) _then) = _$BaseStateCopyWithImpl;
@useResult
$Res call({
 BaseCubitStatus status, T? data, APIException? error
});




}
/// @nodoc
class _$BaseStateCopyWithImpl<T,$Res>
    implements $BaseStateCopyWith<T, $Res> {
  _$BaseStateCopyWithImpl(this._self, this._then);

  final BaseState<T> _self;
  final $Res Function(BaseState<T>) _then;

/// Create a copy of BaseState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BaseCubitStatus,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as APIException?,
  ));
}

}


/// Adds pattern-matching-related methods to [BaseState].
extension BaseStatePatterns<T> on BaseState<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BaseState<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BaseState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BaseState<T> value)  $default,){
final _that = this;
switch (_that) {
case _BaseState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BaseState<T> value)?  $default,){
final _that = this;
switch (_that) {
case _BaseState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BaseCubitStatus status,  T? data,  APIException? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BaseState() when $default != null:
return $default(_that.status,_that.data,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BaseCubitStatus status,  T? data,  APIException? error)  $default,) {final _that = this;
switch (_that) {
case _BaseState():
return $default(_that.status,_that.data,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BaseCubitStatus status,  T? data,  APIException? error)?  $default,) {final _that = this;
switch (_that) {
case _BaseState() when $default != null:
return $default(_that.status,_that.data,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _BaseState<T> extends BaseState<T> {
  const _BaseState({this.status = BaseCubitStatus.initial, this.data, this.error}): super._();
  

@override@JsonKey() final  BaseCubitStatus status;
@override final  T? data;
@override final  APIException? error;

/// Create a copy of BaseState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BaseStateCopyWith<T, _BaseState<T>> get copyWith => __$BaseStateCopyWithImpl<T, _BaseState<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BaseState<T>&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(data),error);

@override
String toString() {
  return 'BaseState<$T>(status: $status, data: $data, error: $error)';
}


}

/// @nodoc
abstract mixin class _$BaseStateCopyWith<T,$Res> implements $BaseStateCopyWith<T, $Res> {
  factory _$BaseStateCopyWith(_BaseState<T> value, $Res Function(_BaseState<T>) _then) = __$BaseStateCopyWithImpl;
@override @useResult
$Res call({
 BaseCubitStatus status, T? data, APIException? error
});




}
/// @nodoc
class __$BaseStateCopyWithImpl<T,$Res>
    implements _$BaseStateCopyWith<T, $Res> {
  __$BaseStateCopyWithImpl(this._self, this._then);

  final _BaseState<T> _self;
  final $Res Function(_BaseState<T>) _then;

/// Create a copy of BaseState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = freezed,Object? error = freezed,}) {
  return _then(_BaseState<T>(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BaseCubitStatus,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as APIException?,
  ));
}


}

// dart format on
