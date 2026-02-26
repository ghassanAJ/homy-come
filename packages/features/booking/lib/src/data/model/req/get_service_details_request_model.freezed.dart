// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_service_details_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetServiceDetailsRequestModel {

 String get serviceId;@JsonKey(name: 'category_id') String? get categoryId;@JsonKey(name: 'location_id') String? get locationId;
/// Create a copy of GetServiceDetailsRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetServiceDetailsRequestModelCopyWith<GetServiceDetailsRequestModel> get copyWith => _$GetServiceDetailsRequestModelCopyWithImpl<GetServiceDetailsRequestModel>(this as GetServiceDetailsRequestModel, _$identity);

  /// Serializes this GetServiceDetailsRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetServiceDetailsRequestModel&&(identical(other.serviceId, serviceId) || other.serviceId == serviceId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.locationId, locationId) || other.locationId == locationId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serviceId,categoryId,locationId);

@override
String toString() {
  return 'GetServiceDetailsRequestModel(serviceId: $serviceId, categoryId: $categoryId, locationId: $locationId)';
}


}

/// @nodoc
abstract mixin class $GetServiceDetailsRequestModelCopyWith<$Res>  {
  factory $GetServiceDetailsRequestModelCopyWith(GetServiceDetailsRequestModel value, $Res Function(GetServiceDetailsRequestModel) _then) = _$GetServiceDetailsRequestModelCopyWithImpl;
@useResult
$Res call({
 String serviceId,@JsonKey(name: 'category_id') String? categoryId,@JsonKey(name: 'location_id') String? locationId
});




}
/// @nodoc
class _$GetServiceDetailsRequestModelCopyWithImpl<$Res>
    implements $GetServiceDetailsRequestModelCopyWith<$Res> {
  _$GetServiceDetailsRequestModelCopyWithImpl(this._self, this._then);

  final GetServiceDetailsRequestModel _self;
  final $Res Function(GetServiceDetailsRequestModel) _then;

/// Create a copy of GetServiceDetailsRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? serviceId = null,Object? categoryId = freezed,Object? locationId = freezed,}) {
  return _then(_self.copyWith(
serviceId: null == serviceId ? _self.serviceId : serviceId // ignore: cast_nullable_to_non_nullable
as String,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,locationId: freezed == locationId ? _self.locationId : locationId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GetServiceDetailsRequestModel].
extension GetServiceDetailsRequestModelPatterns on GetServiceDetailsRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetServiceDetailsRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetServiceDetailsRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetServiceDetailsRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _GetServiceDetailsRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetServiceDetailsRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _GetServiceDetailsRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String serviceId, @JsonKey(name: 'category_id')  String? categoryId, @JsonKey(name: 'location_id')  String? locationId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetServiceDetailsRequestModel() when $default != null:
return $default(_that.serviceId,_that.categoryId,_that.locationId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String serviceId, @JsonKey(name: 'category_id')  String? categoryId, @JsonKey(name: 'location_id')  String? locationId)  $default,) {final _that = this;
switch (_that) {
case _GetServiceDetailsRequestModel():
return $default(_that.serviceId,_that.categoryId,_that.locationId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String serviceId, @JsonKey(name: 'category_id')  String? categoryId, @JsonKey(name: 'location_id')  String? locationId)?  $default,) {final _that = this;
switch (_that) {
case _GetServiceDetailsRequestModel() when $default != null:
return $default(_that.serviceId,_that.categoryId,_that.locationId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetServiceDetailsRequestModel implements GetServiceDetailsRequestModel {
  const _GetServiceDetailsRequestModel({required this.serviceId, @JsonKey(name: 'category_id') this.categoryId, @JsonKey(name: 'location_id') this.locationId});
  factory _GetServiceDetailsRequestModel.fromJson(Map<String, dynamic> json) => _$GetServiceDetailsRequestModelFromJson(json);

@override final  String serviceId;
@override@JsonKey(name: 'category_id') final  String? categoryId;
@override@JsonKey(name: 'location_id') final  String? locationId;

/// Create a copy of GetServiceDetailsRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetServiceDetailsRequestModelCopyWith<_GetServiceDetailsRequestModel> get copyWith => __$GetServiceDetailsRequestModelCopyWithImpl<_GetServiceDetailsRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetServiceDetailsRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetServiceDetailsRequestModel&&(identical(other.serviceId, serviceId) || other.serviceId == serviceId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.locationId, locationId) || other.locationId == locationId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serviceId,categoryId,locationId);

@override
String toString() {
  return 'GetServiceDetailsRequestModel(serviceId: $serviceId, categoryId: $categoryId, locationId: $locationId)';
}


}

/// @nodoc
abstract mixin class _$GetServiceDetailsRequestModelCopyWith<$Res> implements $GetServiceDetailsRequestModelCopyWith<$Res> {
  factory _$GetServiceDetailsRequestModelCopyWith(_GetServiceDetailsRequestModel value, $Res Function(_GetServiceDetailsRequestModel) _then) = __$GetServiceDetailsRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String serviceId,@JsonKey(name: 'category_id') String? categoryId,@JsonKey(name: 'location_id') String? locationId
});




}
/// @nodoc
class __$GetServiceDetailsRequestModelCopyWithImpl<$Res>
    implements _$GetServiceDetailsRequestModelCopyWith<$Res> {
  __$GetServiceDetailsRequestModelCopyWithImpl(this._self, this._then);

  final _GetServiceDetailsRequestModel _self;
  final $Res Function(_GetServiceDetailsRequestModel) _then;

/// Create a copy of GetServiceDetailsRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serviceId = null,Object? categoryId = freezed,Object? locationId = freezed,}) {
  return _then(_GetServiceDetailsRequestModel(
serviceId: null == serviceId ? _self.serviceId : serviceId // ignore: cast_nullable_to_non_nullable
as String,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,locationId: freezed == locationId ? _self.locationId : locationId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
