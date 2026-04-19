// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_option_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServiceOptionModel {

 int get id; String get title;@JsonKey(name: 'duration_minutes') int get durationMinutes; String get description;@JsonKey(name: 'original_price') double get originalPrice;@JsonKey(name: 'discounted_price') double get discountedPrice; String get currency;@JsonKey(name: 'image_url') String? get imageUrl;
/// Create a copy of ServiceOptionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceOptionModelCopyWith<ServiceOptionModel> get copyWith => _$ServiceOptionModelCopyWithImpl<ServiceOptionModel>(this as ServiceOptionModel, _$identity);

  /// Serializes this ServiceOptionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceOptionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.description, description) || other.description == description)&&(identical(other.originalPrice, originalPrice) || other.originalPrice == originalPrice)&&(identical(other.discountedPrice, discountedPrice) || other.discountedPrice == discountedPrice)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,durationMinutes,description,originalPrice,discountedPrice,currency,imageUrl);

@override
String toString() {
  return 'ServiceOptionModel(id: $id, title: $title, durationMinutes: $durationMinutes, description: $description, originalPrice: $originalPrice, discountedPrice: $discountedPrice, currency: $currency, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $ServiceOptionModelCopyWith<$Res>  {
  factory $ServiceOptionModelCopyWith(ServiceOptionModel value, $Res Function(ServiceOptionModel) _then) = _$ServiceOptionModelCopyWithImpl;
@useResult
$Res call({
 int id, String title,@JsonKey(name: 'duration_minutes') int durationMinutes, String description,@JsonKey(name: 'original_price') double originalPrice,@JsonKey(name: 'discounted_price') double discountedPrice, String currency,@JsonKey(name: 'image_url') String? imageUrl
});




}
/// @nodoc
class _$ServiceOptionModelCopyWithImpl<$Res>
    implements $ServiceOptionModelCopyWith<$Res> {
  _$ServiceOptionModelCopyWithImpl(this._self, this._then);

  final ServiceOptionModel _self;
  final $Res Function(ServiceOptionModel) _then;

/// Create a copy of ServiceOptionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? durationMinutes = null,Object? description = null,Object? originalPrice = null,Object? discountedPrice = null,Object? currency = null,Object? imageUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,originalPrice: null == originalPrice ? _self.originalPrice : originalPrice // ignore: cast_nullable_to_non_nullable
as double,discountedPrice: null == discountedPrice ? _self.discountedPrice : discountedPrice // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ServiceOptionModel].
extension ServiceOptionModelPatterns on ServiceOptionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceOptionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceOptionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceOptionModel value)  $default,){
final _that = this;
switch (_that) {
case _ServiceOptionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceOptionModel value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceOptionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title, @JsonKey(name: 'duration_minutes')  int durationMinutes,  String description, @JsonKey(name: 'original_price')  double originalPrice, @JsonKey(name: 'discounted_price')  double discountedPrice,  String currency, @JsonKey(name: 'image_url')  String? imageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceOptionModel() when $default != null:
return $default(_that.id,_that.title,_that.durationMinutes,_that.description,_that.originalPrice,_that.discountedPrice,_that.currency,_that.imageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title, @JsonKey(name: 'duration_minutes')  int durationMinutes,  String description, @JsonKey(name: 'original_price')  double originalPrice, @JsonKey(name: 'discounted_price')  double discountedPrice,  String currency, @JsonKey(name: 'image_url')  String? imageUrl)  $default,) {final _that = this;
switch (_that) {
case _ServiceOptionModel():
return $default(_that.id,_that.title,_that.durationMinutes,_that.description,_that.originalPrice,_that.discountedPrice,_that.currency,_that.imageUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title, @JsonKey(name: 'duration_minutes')  int durationMinutes,  String description, @JsonKey(name: 'original_price')  double originalPrice, @JsonKey(name: 'discounted_price')  double discountedPrice,  String currency, @JsonKey(name: 'image_url')  String? imageUrl)?  $default,) {final _that = this;
switch (_that) {
case _ServiceOptionModel() when $default != null:
return $default(_that.id,_that.title,_that.durationMinutes,_that.description,_that.originalPrice,_that.discountedPrice,_that.currency,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServiceOptionModel implements ServiceOptionModel {
  const _ServiceOptionModel({required this.id, required this.title, @JsonKey(name: 'duration_minutes') required this.durationMinutes, required this.description, @JsonKey(name: 'original_price') required this.originalPrice, @JsonKey(name: 'discounted_price') required this.discountedPrice, this.currency = 'AED', @JsonKey(name: 'image_url') this.imageUrl});
  factory _ServiceOptionModel.fromJson(Map<String, dynamic> json) => _$ServiceOptionModelFromJson(json);

@override final  int id;
@override final  String title;
@override@JsonKey(name: 'duration_minutes') final  int durationMinutes;
@override final  String description;
@override@JsonKey(name: 'original_price') final  double originalPrice;
@override@JsonKey(name: 'discounted_price') final  double discountedPrice;
@override@JsonKey() final  String currency;
@override@JsonKey(name: 'image_url') final  String? imageUrl;

/// Create a copy of ServiceOptionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceOptionModelCopyWith<_ServiceOptionModel> get copyWith => __$ServiceOptionModelCopyWithImpl<_ServiceOptionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServiceOptionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceOptionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.description, description) || other.description == description)&&(identical(other.originalPrice, originalPrice) || other.originalPrice == originalPrice)&&(identical(other.discountedPrice, discountedPrice) || other.discountedPrice == discountedPrice)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,durationMinutes,description,originalPrice,discountedPrice,currency,imageUrl);

@override
String toString() {
  return 'ServiceOptionModel(id: $id, title: $title, durationMinutes: $durationMinutes, description: $description, originalPrice: $originalPrice, discountedPrice: $discountedPrice, currency: $currency, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$ServiceOptionModelCopyWith<$Res> implements $ServiceOptionModelCopyWith<$Res> {
  factory _$ServiceOptionModelCopyWith(_ServiceOptionModel value, $Res Function(_ServiceOptionModel) _then) = __$ServiceOptionModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String title,@JsonKey(name: 'duration_minutes') int durationMinutes, String description,@JsonKey(name: 'original_price') double originalPrice,@JsonKey(name: 'discounted_price') double discountedPrice, String currency,@JsonKey(name: 'image_url') String? imageUrl
});




}
/// @nodoc
class __$ServiceOptionModelCopyWithImpl<$Res>
    implements _$ServiceOptionModelCopyWith<$Res> {
  __$ServiceOptionModelCopyWithImpl(this._self, this._then);

  final _ServiceOptionModel _self;
  final $Res Function(_ServiceOptionModel) _then;

/// Create a copy of ServiceOptionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? durationMinutes = null,Object? description = null,Object? originalPrice = null,Object? discountedPrice = null,Object? currency = null,Object? imageUrl = freezed,}) {
  return _then(_ServiceOptionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,originalPrice: null == originalPrice ? _self.originalPrice : originalPrice // ignore: cast_nullable_to_non_nullable
as double,discountedPrice: null == discountedPrice ? _self.discountedPrice : discountedPrice // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
