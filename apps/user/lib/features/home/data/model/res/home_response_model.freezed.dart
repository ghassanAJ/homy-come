// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeResponseModel {

 List<ServiceCategoryModel> get categories; List<OfferModel> get offers; List<OfferModel> get sliders;
/// Create a copy of HomeResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeResponseModelCopyWith<HomeResponseModel> get copyWith => _$HomeResponseModelCopyWithImpl<HomeResponseModel>(this as HomeResponseModel, _$identity);

  /// Serializes this HomeResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeResponseModel&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.offers, offers)&&const DeepCollectionEquality().equals(other.sliders, sliders));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(offers),const DeepCollectionEquality().hash(sliders));

@override
String toString() {
  return 'HomeResponseModel(categories: $categories, offers: $offers, sliders: $sliders)';
}


}

/// @nodoc
abstract mixin class $HomeResponseModelCopyWith<$Res>  {
  factory $HomeResponseModelCopyWith(HomeResponseModel value, $Res Function(HomeResponseModel) _then) = _$HomeResponseModelCopyWithImpl;
@useResult
$Res call({
 List<ServiceCategoryModel> categories, List<OfferModel> offers, List<OfferModel> sliders
});




}
/// @nodoc
class _$HomeResponseModelCopyWithImpl<$Res>
    implements $HomeResponseModelCopyWith<$Res> {
  _$HomeResponseModelCopyWithImpl(this._self, this._then);

  final HomeResponseModel _self;
  final $Res Function(HomeResponseModel) _then;

/// Create a copy of HomeResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categories = null,Object? offers = null,Object? sliders = null,}) {
  return _then(_self.copyWith(
categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<ServiceCategoryModel>,offers: null == offers ? _self.offers : offers // ignore: cast_nullable_to_non_nullable
as List<OfferModel>,sliders: null == sliders ? _self.sliders : sliders // ignore: cast_nullable_to_non_nullable
as List<OfferModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeResponseModel].
extension HomeResponseModelPatterns on HomeResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _HomeResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _HomeResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ServiceCategoryModel> categories,  List<OfferModel> offers,  List<OfferModel> sliders)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeResponseModel() when $default != null:
return $default(_that.categories,_that.offers,_that.sliders);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ServiceCategoryModel> categories,  List<OfferModel> offers,  List<OfferModel> sliders)  $default,) {final _that = this;
switch (_that) {
case _HomeResponseModel():
return $default(_that.categories,_that.offers,_that.sliders);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ServiceCategoryModel> categories,  List<OfferModel> offers,  List<OfferModel> sliders)?  $default,) {final _that = this;
switch (_that) {
case _HomeResponseModel() when $default != null:
return $default(_that.categories,_that.offers,_that.sliders);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeResponseModel implements HomeResponseModel {
  const _HomeResponseModel({final  List<ServiceCategoryModel> categories = const [], final  List<OfferModel> offers = const [], final  List<OfferModel> sliders = const []}): _categories = categories,_offers = offers,_sliders = sliders;
  factory _HomeResponseModel.fromJson(Map<String, dynamic> json) => _$HomeResponseModelFromJson(json);

 final  List<ServiceCategoryModel> _categories;
@override@JsonKey() List<ServiceCategoryModel> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<OfferModel> _offers;
@override@JsonKey() List<OfferModel> get offers {
  if (_offers is EqualUnmodifiableListView) return _offers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_offers);
}

 final  List<OfferModel> _sliders;
@override@JsonKey() List<OfferModel> get sliders {
  if (_sliders is EqualUnmodifiableListView) return _sliders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sliders);
}


/// Create a copy of HomeResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeResponseModelCopyWith<_HomeResponseModel> get copyWith => __$HomeResponseModelCopyWithImpl<_HomeResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeResponseModel&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._offers, _offers)&&const DeepCollectionEquality().equals(other._sliders, _sliders));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_offers),const DeepCollectionEquality().hash(_sliders));

@override
String toString() {
  return 'HomeResponseModel(categories: $categories, offers: $offers, sliders: $sliders)';
}


}

/// @nodoc
abstract mixin class _$HomeResponseModelCopyWith<$Res> implements $HomeResponseModelCopyWith<$Res> {
  factory _$HomeResponseModelCopyWith(_HomeResponseModel value, $Res Function(_HomeResponseModel) _then) = __$HomeResponseModelCopyWithImpl;
@override @useResult
$Res call({
 List<ServiceCategoryModel> categories, List<OfferModel> offers, List<OfferModel> sliders
});




}
/// @nodoc
class __$HomeResponseModelCopyWithImpl<$Res>
    implements _$HomeResponseModelCopyWith<$Res> {
  __$HomeResponseModelCopyWithImpl(this._self, this._then);

  final _HomeResponseModel _self;
  final $Res Function(_HomeResponseModel) _then;

/// Create a copy of HomeResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categories = null,Object? offers = null,Object? sliders = null,}) {
  return _then(_HomeResponseModel(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<ServiceCategoryModel>,offers: null == offers ? _self._offers : offers // ignore: cast_nullable_to_non_nullable
as List<OfferModel>,sliders: null == sliders ? _self._sliders : sliders // ignore: cast_nullable_to_non_nullable
as List<OfferModel>,
  ));
}


}


/// @nodoc
mixin _$OfferModel {

 List<ServiceCategoryModel> get categories; List<OfferModel> get offers;// ignore: invalid_annotation_target - freezed uses JsonKey on factory params
@JsonKey(name: 'image_url') String? get imageUrl;// ignore: invalid_annotation_target
@JsonKey(name: 'aspect_ratio') double? get aspectRatio;
/// Create a copy of OfferModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OfferModelCopyWith<OfferModel> get copyWith => _$OfferModelCopyWithImpl<OfferModel>(this as OfferModel, _$identity);

  /// Serializes this OfferModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OfferModel&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.offers, offers)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.aspectRatio, aspectRatio) || other.aspectRatio == aspectRatio));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(offers),imageUrl,aspectRatio);

@override
String toString() {
  return 'OfferModel(categories: $categories, offers: $offers, imageUrl: $imageUrl, aspectRatio: $aspectRatio)';
}


}

/// @nodoc
abstract mixin class $OfferModelCopyWith<$Res>  {
  factory $OfferModelCopyWith(OfferModel value, $Res Function(OfferModel) _then) = _$OfferModelCopyWithImpl;
@useResult
$Res call({
 List<ServiceCategoryModel> categories, List<OfferModel> offers,@JsonKey(name: 'image_url') String? imageUrl,@JsonKey(name: 'aspect_ratio') double? aspectRatio
});




}
/// @nodoc
class _$OfferModelCopyWithImpl<$Res>
    implements $OfferModelCopyWith<$Res> {
  _$OfferModelCopyWithImpl(this._self, this._then);

  final OfferModel _self;
  final $Res Function(OfferModel) _then;

/// Create a copy of OfferModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categories = null,Object? offers = null,Object? imageUrl = freezed,Object? aspectRatio = freezed,}) {
  return _then(_self.copyWith(
categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<ServiceCategoryModel>,offers: null == offers ? _self.offers : offers // ignore: cast_nullable_to_non_nullable
as List<OfferModel>,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,aspectRatio: freezed == aspectRatio ? _self.aspectRatio : aspectRatio // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [OfferModel].
extension OfferModelPatterns on OfferModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OfferModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OfferModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OfferModel value)  $default,){
final _that = this;
switch (_that) {
case _OfferModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OfferModel value)?  $default,){
final _that = this;
switch (_that) {
case _OfferModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ServiceCategoryModel> categories,  List<OfferModel> offers, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'aspect_ratio')  double? aspectRatio)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OfferModel() when $default != null:
return $default(_that.categories,_that.offers,_that.imageUrl,_that.aspectRatio);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ServiceCategoryModel> categories,  List<OfferModel> offers, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'aspect_ratio')  double? aspectRatio)  $default,) {final _that = this;
switch (_that) {
case _OfferModel():
return $default(_that.categories,_that.offers,_that.imageUrl,_that.aspectRatio);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ServiceCategoryModel> categories,  List<OfferModel> offers, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'aspect_ratio')  double? aspectRatio)?  $default,) {final _that = this;
switch (_that) {
case _OfferModel() when $default != null:
return $default(_that.categories,_that.offers,_that.imageUrl,_that.aspectRatio);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OfferModel implements OfferModel {
  const _OfferModel({final  List<ServiceCategoryModel> categories = const [], final  List<OfferModel> offers = const [], @JsonKey(name: 'image_url') this.imageUrl, @JsonKey(name: 'aspect_ratio') this.aspectRatio}): _categories = categories,_offers = offers;
  factory _OfferModel.fromJson(Map<String, dynamic> json) => _$OfferModelFromJson(json);

 final  List<ServiceCategoryModel> _categories;
@override@JsonKey() List<ServiceCategoryModel> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<OfferModel> _offers;
@override@JsonKey() List<OfferModel> get offers {
  if (_offers is EqualUnmodifiableListView) return _offers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_offers);
}

// ignore: invalid_annotation_target - freezed uses JsonKey on factory params
@override@JsonKey(name: 'image_url') final  String? imageUrl;
// ignore: invalid_annotation_target
@override@JsonKey(name: 'aspect_ratio') final  double? aspectRatio;

/// Create a copy of OfferModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OfferModelCopyWith<_OfferModel> get copyWith => __$OfferModelCopyWithImpl<_OfferModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OfferModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OfferModel&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._offers, _offers)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.aspectRatio, aspectRatio) || other.aspectRatio == aspectRatio));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_offers),imageUrl,aspectRatio);

@override
String toString() {
  return 'OfferModel(categories: $categories, offers: $offers, imageUrl: $imageUrl, aspectRatio: $aspectRatio)';
}


}

/// @nodoc
abstract mixin class _$OfferModelCopyWith<$Res> implements $OfferModelCopyWith<$Res> {
  factory _$OfferModelCopyWith(_OfferModel value, $Res Function(_OfferModel) _then) = __$OfferModelCopyWithImpl;
@override @useResult
$Res call({
 List<ServiceCategoryModel> categories, List<OfferModel> offers,@JsonKey(name: 'image_url') String? imageUrl,@JsonKey(name: 'aspect_ratio') double? aspectRatio
});




}
/// @nodoc
class __$OfferModelCopyWithImpl<$Res>
    implements _$OfferModelCopyWith<$Res> {
  __$OfferModelCopyWithImpl(this._self, this._then);

  final _OfferModel _self;
  final $Res Function(_OfferModel) _then;

/// Create a copy of OfferModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categories = null,Object? offers = null,Object? imageUrl = freezed,Object? aspectRatio = freezed,}) {
  return _then(_OfferModel(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<ServiceCategoryModel>,offers: null == offers ? _self._offers : offers // ignore: cast_nullable_to_non_nullable
as List<OfferModel>,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,aspectRatio: freezed == aspectRatio ? _self.aspectRatio : aspectRatio // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
