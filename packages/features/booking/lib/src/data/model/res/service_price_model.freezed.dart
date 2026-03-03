// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_price_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServicePriceModel {

 String? get id;@JsonKey(name: 'current_price') num? get currentPrice;@JsonKey(name: 'new_price') num? get newPrice; String? get currency;
/// Create a copy of ServicePriceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServicePriceModelCopyWith<ServicePriceModel> get copyWith => _$ServicePriceModelCopyWithImpl<ServicePriceModel>(this as ServicePriceModel, _$identity);

  /// Serializes this ServicePriceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServicePriceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.currentPrice, currentPrice) || other.currentPrice == currentPrice)&&(identical(other.newPrice, newPrice) || other.newPrice == newPrice)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,currentPrice,newPrice,currency);

@override
String toString() {
  return 'ServicePriceModel(id: $id, currentPrice: $currentPrice, newPrice: $newPrice, currency: $currency)';
}


}

/// @nodoc
abstract mixin class $ServicePriceModelCopyWith<$Res>  {
  factory $ServicePriceModelCopyWith(ServicePriceModel value, $Res Function(ServicePriceModel) _then) = _$ServicePriceModelCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'current_price') num? currentPrice,@JsonKey(name: 'new_price') num? newPrice, String? currency
});




}
/// @nodoc
class _$ServicePriceModelCopyWithImpl<$Res>
    implements $ServicePriceModelCopyWith<$Res> {
  _$ServicePriceModelCopyWithImpl(this._self, this._then);

  final ServicePriceModel _self;
  final $Res Function(ServicePriceModel) _then;

/// Create a copy of ServicePriceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? currentPrice = freezed,Object? newPrice = freezed,Object? currency = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,currentPrice: freezed == currentPrice ? _self.currentPrice : currentPrice // ignore: cast_nullable_to_non_nullable
as num?,newPrice: freezed == newPrice ? _self.newPrice : newPrice // ignore: cast_nullable_to_non_nullable
as num?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ServicePriceModel].
extension ServicePriceModelPatterns on ServicePriceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServicePriceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServicePriceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServicePriceModel value)  $default,){
final _that = this;
switch (_that) {
case _ServicePriceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServicePriceModel value)?  $default,){
final _that = this;
switch (_that) {
case _ServicePriceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'current_price')  num? currentPrice, @JsonKey(name: 'new_price')  num? newPrice,  String? currency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServicePriceModel() when $default != null:
return $default(_that.id,_that.currentPrice,_that.newPrice,_that.currency);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'current_price')  num? currentPrice, @JsonKey(name: 'new_price')  num? newPrice,  String? currency)  $default,) {final _that = this;
switch (_that) {
case _ServicePriceModel():
return $default(_that.id,_that.currentPrice,_that.newPrice,_that.currency);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'current_price')  num? currentPrice, @JsonKey(name: 'new_price')  num? newPrice,  String? currency)?  $default,) {final _that = this;
switch (_that) {
case _ServicePriceModel() when $default != null:
return $default(_that.id,_that.currentPrice,_that.newPrice,_that.currency);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServicePriceModel implements ServicePriceModel {
  const _ServicePriceModel({this.id, @JsonKey(name: 'current_price') this.currentPrice, @JsonKey(name: 'new_price') this.newPrice, this.currency});
  factory _ServicePriceModel.fromJson(Map<String, dynamic> json) => _$ServicePriceModelFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'current_price') final  num? currentPrice;
@override@JsonKey(name: 'new_price') final  num? newPrice;
@override final  String? currency;

/// Create a copy of ServicePriceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServicePriceModelCopyWith<_ServicePriceModel> get copyWith => __$ServicePriceModelCopyWithImpl<_ServicePriceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServicePriceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServicePriceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.currentPrice, currentPrice) || other.currentPrice == currentPrice)&&(identical(other.newPrice, newPrice) || other.newPrice == newPrice)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,currentPrice,newPrice,currency);

@override
String toString() {
  return 'ServicePriceModel(id: $id, currentPrice: $currentPrice, newPrice: $newPrice, currency: $currency)';
}


}

/// @nodoc
abstract mixin class _$ServicePriceModelCopyWith<$Res> implements $ServicePriceModelCopyWith<$Res> {
  factory _$ServicePriceModelCopyWith(_ServicePriceModel value, $Res Function(_ServicePriceModel) _then) = __$ServicePriceModelCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'current_price') num? currentPrice,@JsonKey(name: 'new_price') num? newPrice, String? currency
});




}
/// @nodoc
class __$ServicePriceModelCopyWithImpl<$Res>
    implements _$ServicePriceModelCopyWith<$Res> {
  __$ServicePriceModelCopyWithImpl(this._self, this._then);

  final _ServicePriceModel _self;
  final $Res Function(_ServicePriceModel) _then;

/// Create a copy of ServicePriceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? currentPrice = freezed,Object? newPrice = freezed,Object? currency = freezed,}) {
  return _then(_ServicePriceModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,currentPrice: freezed == currentPrice ? _self.currentPrice : currentPrice // ignore: cast_nullable_to_non_nullable
as num?,newPrice: freezed == newPrice ? _self.newPrice : newPrice // ignore: cast_nullable_to_non_nullable
as num?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
