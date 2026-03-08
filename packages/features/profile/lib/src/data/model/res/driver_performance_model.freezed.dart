// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'driver_performance_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DriverPerformanceModel {

@JsonKey(name: 'orders_count') int get ordersCount;@JsonKey(fromJson: _driverPerformanceMetricsFromJson, toJson: _driverPerformanceMetricsToJson) List<DriverPerformanceMetricModel> get metrics;
/// Create a copy of DriverPerformanceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DriverPerformanceModelCopyWith<DriverPerformanceModel> get copyWith => _$DriverPerformanceModelCopyWithImpl<DriverPerformanceModel>(this as DriverPerformanceModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DriverPerformanceModel&&(identical(other.ordersCount, ordersCount) || other.ordersCount == ordersCount)&&const DeepCollectionEquality().equals(other.metrics, metrics));
}


@override
int get hashCode => Object.hash(runtimeType,ordersCount,const DeepCollectionEquality().hash(metrics));

@override
String toString() {
  return 'DriverPerformanceModel(ordersCount: $ordersCount, metrics: $metrics)';
}


}

/// @nodoc
abstract mixin class $DriverPerformanceModelCopyWith<$Res>  {
  factory $DriverPerformanceModelCopyWith(DriverPerformanceModel value, $Res Function(DriverPerformanceModel) _then) = _$DriverPerformanceModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'orders_count') int ordersCount,@JsonKey(fromJson: _driverPerformanceMetricsFromJson, toJson: _driverPerformanceMetricsToJson) List<DriverPerformanceMetricModel> metrics
});




}
/// @nodoc
class _$DriverPerformanceModelCopyWithImpl<$Res>
    implements $DriverPerformanceModelCopyWith<$Res> {
  _$DriverPerformanceModelCopyWithImpl(this._self, this._then);

  final DriverPerformanceModel _self;
  final $Res Function(DriverPerformanceModel) _then;

/// Create a copy of DriverPerformanceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ordersCount = null,Object? metrics = null,}) {
  return _then(_self.copyWith(
ordersCount: null == ordersCount ? _self.ordersCount : ordersCount // ignore: cast_nullable_to_non_nullable
as int,metrics: null == metrics ? _self.metrics : metrics // ignore: cast_nullable_to_non_nullable
as List<DriverPerformanceMetricModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [DriverPerformanceModel].
extension DriverPerformanceModelPatterns on DriverPerformanceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DriverPerformanceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DriverPerformanceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DriverPerformanceModel value)  $default,){
final _that = this;
switch (_that) {
case _DriverPerformanceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DriverPerformanceModel value)?  $default,){
final _that = this;
switch (_that) {
case _DriverPerformanceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'orders_count')  int ordersCount, @JsonKey(fromJson: _driverPerformanceMetricsFromJson, toJson: _driverPerformanceMetricsToJson)  List<DriverPerformanceMetricModel> metrics)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DriverPerformanceModel() when $default != null:
return $default(_that.ordersCount,_that.metrics);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'orders_count')  int ordersCount, @JsonKey(fromJson: _driverPerformanceMetricsFromJson, toJson: _driverPerformanceMetricsToJson)  List<DriverPerformanceMetricModel> metrics)  $default,) {final _that = this;
switch (_that) {
case _DriverPerformanceModel():
return $default(_that.ordersCount,_that.metrics);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'orders_count')  int ordersCount, @JsonKey(fromJson: _driverPerformanceMetricsFromJson, toJson: _driverPerformanceMetricsToJson)  List<DriverPerformanceMetricModel> metrics)?  $default,) {final _that = this;
switch (_that) {
case _DriverPerformanceModel() when $default != null:
return $default(_that.ordersCount,_that.metrics);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _DriverPerformanceModel implements DriverPerformanceModel {
  const _DriverPerformanceModel({@JsonKey(name: 'orders_count') this.ordersCount = 0, @JsonKey(fromJson: _driverPerformanceMetricsFromJson, toJson: _driverPerformanceMetricsToJson) final  List<DriverPerformanceMetricModel> metrics = const <DriverPerformanceMetricModel>[]}): _metrics = metrics;
  

@override@JsonKey(name: 'orders_count') final  int ordersCount;
 final  List<DriverPerformanceMetricModel> _metrics;
@override@JsonKey(fromJson: _driverPerformanceMetricsFromJson, toJson: _driverPerformanceMetricsToJson) List<DriverPerformanceMetricModel> get metrics {
  if (_metrics is EqualUnmodifiableListView) return _metrics;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_metrics);
}


/// Create a copy of DriverPerformanceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DriverPerformanceModelCopyWith<_DriverPerformanceModel> get copyWith => __$DriverPerformanceModelCopyWithImpl<_DriverPerformanceModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DriverPerformanceModel&&(identical(other.ordersCount, ordersCount) || other.ordersCount == ordersCount)&&const DeepCollectionEquality().equals(other._metrics, _metrics));
}


@override
int get hashCode => Object.hash(runtimeType,ordersCount,const DeepCollectionEquality().hash(_metrics));

@override
String toString() {
  return 'DriverPerformanceModel(ordersCount: $ordersCount, metrics: $metrics)';
}


}

/// @nodoc
abstract mixin class _$DriverPerformanceModelCopyWith<$Res> implements $DriverPerformanceModelCopyWith<$Res> {
  factory _$DriverPerformanceModelCopyWith(_DriverPerformanceModel value, $Res Function(_DriverPerformanceModel) _then) = __$DriverPerformanceModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'orders_count') int ordersCount,@JsonKey(fromJson: _driverPerformanceMetricsFromJson, toJson: _driverPerformanceMetricsToJson) List<DriverPerformanceMetricModel> metrics
});




}
/// @nodoc
class __$DriverPerformanceModelCopyWithImpl<$Res>
    implements _$DriverPerformanceModelCopyWith<$Res> {
  __$DriverPerformanceModelCopyWithImpl(this._self, this._then);

  final _DriverPerformanceModel _self;
  final $Res Function(_DriverPerformanceModel) _then;

/// Create a copy of DriverPerformanceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ordersCount = null,Object? metrics = null,}) {
  return _then(_DriverPerformanceModel(
ordersCount: null == ordersCount ? _self.ordersCount : ordersCount // ignore: cast_nullable_to_non_nullable
as int,metrics: null == metrics ? _self._metrics : metrics // ignore: cast_nullable_to_non_nullable
as List<DriverPerformanceMetricModel>,
  ));
}


}

// dart format on
