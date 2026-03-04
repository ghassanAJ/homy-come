// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'driver_performance_metric_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DriverPerformanceMetricModel {

@JsonKey(unknownEnumValue: DriverPerformanceMetricType.completed) DriverPerformanceMetricType get type; int get percentage;@JsonKey(name: 'donut_ratio') double get donutRatio;
/// Create a copy of DriverPerformanceMetricModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DriverPerformanceMetricModelCopyWith<DriverPerformanceMetricModel> get copyWith => _$DriverPerformanceMetricModelCopyWithImpl<DriverPerformanceMetricModel>(this as DriverPerformanceMetricModel, _$identity);

  /// Serializes this DriverPerformanceMetricModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DriverPerformanceMetricModel&&(identical(other.type, type) || other.type == type)&&(identical(other.percentage, percentage) || other.percentage == percentage)&&(identical(other.donutRatio, donutRatio) || other.donutRatio == donutRatio));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,percentage,donutRatio);

@override
String toString() {
  return 'DriverPerformanceMetricModel(type: $type, percentage: $percentage, donutRatio: $donutRatio)';
}


}

/// @nodoc
abstract mixin class $DriverPerformanceMetricModelCopyWith<$Res>  {
  factory $DriverPerformanceMetricModelCopyWith(DriverPerformanceMetricModel value, $Res Function(DriverPerformanceMetricModel) _then) = _$DriverPerformanceMetricModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(unknownEnumValue: DriverPerformanceMetricType.completed) DriverPerformanceMetricType type, int percentage,@JsonKey(name: 'donut_ratio') double donutRatio
});




}
/// @nodoc
class _$DriverPerformanceMetricModelCopyWithImpl<$Res>
    implements $DriverPerformanceMetricModelCopyWith<$Res> {
  _$DriverPerformanceMetricModelCopyWithImpl(this._self, this._then);

  final DriverPerformanceMetricModel _self;
  final $Res Function(DriverPerformanceMetricModel) _then;

/// Create a copy of DriverPerformanceMetricModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? percentage = null,Object? donutRatio = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DriverPerformanceMetricType,percentage: null == percentage ? _self.percentage : percentage // ignore: cast_nullable_to_non_nullable
as int,donutRatio: null == donutRatio ? _self.donutRatio : donutRatio // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [DriverPerformanceMetricModel].
extension DriverPerformanceMetricModelPatterns on DriverPerformanceMetricModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DriverPerformanceMetricModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DriverPerformanceMetricModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DriverPerformanceMetricModel value)  $default,){
final _that = this;
switch (_that) {
case _DriverPerformanceMetricModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DriverPerformanceMetricModel value)?  $default,){
final _that = this;
switch (_that) {
case _DriverPerformanceMetricModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: DriverPerformanceMetricType.completed)  DriverPerformanceMetricType type,  int percentage, @JsonKey(name: 'donut_ratio')  double donutRatio)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DriverPerformanceMetricModel() when $default != null:
return $default(_that.type,_that.percentage,_that.donutRatio);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: DriverPerformanceMetricType.completed)  DriverPerformanceMetricType type,  int percentage, @JsonKey(name: 'donut_ratio')  double donutRatio)  $default,) {final _that = this;
switch (_that) {
case _DriverPerformanceMetricModel():
return $default(_that.type,_that.percentage,_that.donutRatio);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(unknownEnumValue: DriverPerformanceMetricType.completed)  DriverPerformanceMetricType type,  int percentage, @JsonKey(name: 'donut_ratio')  double donutRatio)?  $default,) {final _that = this;
switch (_that) {
case _DriverPerformanceMetricModel() when $default != null:
return $default(_that.type,_that.percentage,_that.donutRatio);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DriverPerformanceMetricModel implements DriverPerformanceMetricModel {
  const _DriverPerformanceMetricModel({@JsonKey(unknownEnumValue: DriverPerformanceMetricType.completed) this.type = DriverPerformanceMetricType.completed, this.percentage = 0, @JsonKey(name: 'donut_ratio') this.donutRatio = 0});
  factory _DriverPerformanceMetricModel.fromJson(Map<String, dynamic> json) => _$DriverPerformanceMetricModelFromJson(json);

@override@JsonKey(unknownEnumValue: DriverPerformanceMetricType.completed) final  DriverPerformanceMetricType type;
@override@JsonKey() final  int percentage;
@override@JsonKey(name: 'donut_ratio') final  double donutRatio;

/// Create a copy of DriverPerformanceMetricModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DriverPerformanceMetricModelCopyWith<_DriverPerformanceMetricModel> get copyWith => __$DriverPerformanceMetricModelCopyWithImpl<_DriverPerformanceMetricModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DriverPerformanceMetricModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DriverPerformanceMetricModel&&(identical(other.type, type) || other.type == type)&&(identical(other.percentage, percentage) || other.percentage == percentage)&&(identical(other.donutRatio, donutRatio) || other.donutRatio == donutRatio));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,percentage,donutRatio);

@override
String toString() {
  return 'DriverPerformanceMetricModel(type: $type, percentage: $percentage, donutRatio: $donutRatio)';
}


}

/// @nodoc
abstract mixin class _$DriverPerformanceMetricModelCopyWith<$Res> implements $DriverPerformanceMetricModelCopyWith<$Res> {
  factory _$DriverPerformanceMetricModelCopyWith(_DriverPerformanceMetricModel value, $Res Function(_DriverPerformanceMetricModel) _then) = __$DriverPerformanceMetricModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(unknownEnumValue: DriverPerformanceMetricType.completed) DriverPerformanceMetricType type, int percentage,@JsonKey(name: 'donut_ratio') double donutRatio
});




}
/// @nodoc
class __$DriverPerformanceMetricModelCopyWithImpl<$Res>
    implements _$DriverPerformanceMetricModelCopyWith<$Res> {
  __$DriverPerformanceMetricModelCopyWithImpl(this._self, this._then);

  final _DriverPerformanceMetricModel _self;
  final $Res Function(_DriverPerformanceMetricModel) _then;

/// Create a copy of DriverPerformanceMetricModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? percentage = null,Object? donutRatio = null,}) {
  return _then(_DriverPerformanceMetricModel(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DriverPerformanceMetricType,percentage: null == percentage ? _self.percentage : percentage // ignore: cast_nullable_to_non_nullable
as int,donutRatio: null == donutRatio ? _self.donutRatio : donutRatio // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
