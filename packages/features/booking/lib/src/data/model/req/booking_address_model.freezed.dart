// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_address_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookingAddressModel {

 String get id; double get latitude; double get longitude; String get name;
/// Create a copy of BookingAddressModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingAddressModelCopyWith<BookingAddressModel> get copyWith => _$BookingAddressModelCopyWithImpl<BookingAddressModel>(this as BookingAddressModel, _$identity);

  /// Serializes this BookingAddressModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingAddressModel&&(identical(other.id, id) || other.id == id)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,latitude,longitude,name);

@override
String toString() {
  return 'BookingAddressModel(id: $id, latitude: $latitude, longitude: $longitude, name: $name)';
}


}

/// @nodoc
abstract mixin class $BookingAddressModelCopyWith<$Res>  {
  factory $BookingAddressModelCopyWith(BookingAddressModel value, $Res Function(BookingAddressModel) _then) = _$BookingAddressModelCopyWithImpl;
@useResult
$Res call({
 String id, double latitude, double longitude, String name
});




}
/// @nodoc
class _$BookingAddressModelCopyWithImpl<$Res>
    implements $BookingAddressModelCopyWith<$Res> {
  _$BookingAddressModelCopyWithImpl(this._self, this._then);

  final BookingAddressModel _self;
  final $Res Function(BookingAddressModel) _then;

/// Create a copy of BookingAddressModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? latitude = null,Object? longitude = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BookingAddressModel].
extension BookingAddressModelPatterns on BookingAddressModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingAddressModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingAddressModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingAddressModel value)  $default,){
final _that = this;
switch (_that) {
case _BookingAddressModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingAddressModel value)?  $default,){
final _that = this;
switch (_that) {
case _BookingAddressModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  double latitude,  double longitude,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingAddressModel() when $default != null:
return $default(_that.id,_that.latitude,_that.longitude,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  double latitude,  double longitude,  String name)  $default,) {final _that = this;
switch (_that) {
case _BookingAddressModel():
return $default(_that.id,_that.latitude,_that.longitude,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  double latitude,  double longitude,  String name)?  $default,) {final _that = this;
switch (_that) {
case _BookingAddressModel() when $default != null:
return $default(_that.id,_that.latitude,_that.longitude,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookingAddressModel implements BookingAddressModel {
  const _BookingAddressModel({required this.id, required this.latitude, required this.longitude, required this.name});
  factory _BookingAddressModel.fromJson(Map<String, dynamic> json) => _$BookingAddressModelFromJson(json);

@override final  String id;
@override final  double latitude;
@override final  double longitude;
@override final  String name;

/// Create a copy of BookingAddressModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingAddressModelCopyWith<_BookingAddressModel> get copyWith => __$BookingAddressModelCopyWithImpl<_BookingAddressModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookingAddressModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingAddressModel&&(identical(other.id, id) || other.id == id)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,latitude,longitude,name);

@override
String toString() {
  return 'BookingAddressModel(id: $id, latitude: $latitude, longitude: $longitude, name: $name)';
}


}

/// @nodoc
abstract mixin class _$BookingAddressModelCopyWith<$Res> implements $BookingAddressModelCopyWith<$Res> {
  factory _$BookingAddressModelCopyWith(_BookingAddressModel value, $Res Function(_BookingAddressModel) _then) = __$BookingAddressModelCopyWithImpl;
@override @useResult
$Res call({
 String id, double latitude, double longitude, String name
});




}
/// @nodoc
class __$BookingAddressModelCopyWithImpl<$Res>
    implements _$BookingAddressModelCopyWith<$Res> {
  __$BookingAddressModelCopyWithImpl(this._self, this._then);

  final _BookingAddressModel _self;
  final $Res Function(_BookingAddressModel) _then;

/// Create a copy of BookingAddressModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? latitude = null,Object? longitude = null,Object? name = null,}) {
  return _then(_BookingAddressModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
