// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_details_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServiceDetailsResponseModel {

 String get id; int get rating;@JsonKey(name: 'reviews_count') int get reviewsCount; InfoModel get info; ServicePriceModel get price; List<AddOnCategoryModel> get categories;
/// Create a copy of ServiceDetailsResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceDetailsResponseModelCopyWith<ServiceDetailsResponseModel> get copyWith => _$ServiceDetailsResponseModelCopyWithImpl<ServiceDetailsResponseModel>(this as ServiceDetailsResponseModel, _$identity);

  /// Serializes this ServiceDetailsResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceDetailsResponseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewsCount, reviewsCount) || other.reviewsCount == reviewsCount)&&(identical(other.info, info) || other.info == info)&&(identical(other.price, price) || other.price == price)&&const DeepCollectionEquality().equals(other.categories, categories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,rating,reviewsCount,info,price,const DeepCollectionEquality().hash(categories));

@override
String toString() {
  return 'ServiceDetailsResponseModel(id: $id, rating: $rating, reviewsCount: $reviewsCount, info: $info, price: $price, categories: $categories)';
}


}

/// @nodoc
abstract mixin class $ServiceDetailsResponseModelCopyWith<$Res>  {
  factory $ServiceDetailsResponseModelCopyWith(ServiceDetailsResponseModel value, $Res Function(ServiceDetailsResponseModel) _then) = _$ServiceDetailsResponseModelCopyWithImpl;
@useResult
$Res call({
 String id, int rating,@JsonKey(name: 'reviews_count') int reviewsCount, InfoModel info, ServicePriceModel price, List<AddOnCategoryModel> categories
});


$InfoModelCopyWith<$Res> get info;$ServicePriceModelCopyWith<$Res> get price;

}
/// @nodoc
class _$ServiceDetailsResponseModelCopyWithImpl<$Res>
    implements $ServiceDetailsResponseModelCopyWith<$Res> {
  _$ServiceDetailsResponseModelCopyWithImpl(this._self, this._then);

  final ServiceDetailsResponseModel _self;
  final $Res Function(ServiceDetailsResponseModel) _then;

/// Create a copy of ServiceDetailsResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? rating = null,Object? reviewsCount = null,Object? info = null,Object? price = null,Object? categories = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,reviewsCount: null == reviewsCount ? _self.reviewsCount : reviewsCount // ignore: cast_nullable_to_non_nullable
as int,info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as InfoModel,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as ServicePriceModel,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<AddOnCategoryModel>,
  ));
}
/// Create a copy of ServiceDetailsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InfoModelCopyWith<$Res> get info {
  
  return $InfoModelCopyWith<$Res>(_self.info, (value) {
    return _then(_self.copyWith(info: value));
  });
}/// Create a copy of ServiceDetailsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ServicePriceModelCopyWith<$Res> get price {
  
  return $ServicePriceModelCopyWith<$Res>(_self.price, (value) {
    return _then(_self.copyWith(price: value));
  });
}
}


/// Adds pattern-matching-related methods to [ServiceDetailsResponseModel].
extension ServiceDetailsResponseModelPatterns on ServiceDetailsResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceDetailsResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceDetailsResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceDetailsResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _ServiceDetailsResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceDetailsResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceDetailsResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int rating, @JsonKey(name: 'reviews_count')  int reviewsCount,  InfoModel info,  ServicePriceModel price,  List<AddOnCategoryModel> categories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceDetailsResponseModel() when $default != null:
return $default(_that.id,_that.rating,_that.reviewsCount,_that.info,_that.price,_that.categories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int rating, @JsonKey(name: 'reviews_count')  int reviewsCount,  InfoModel info,  ServicePriceModel price,  List<AddOnCategoryModel> categories)  $default,) {final _that = this;
switch (_that) {
case _ServiceDetailsResponseModel():
return $default(_that.id,_that.rating,_that.reviewsCount,_that.info,_that.price,_that.categories);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int rating, @JsonKey(name: 'reviews_count')  int reviewsCount,  InfoModel info,  ServicePriceModel price,  List<AddOnCategoryModel> categories)?  $default,) {final _that = this;
switch (_that) {
case _ServiceDetailsResponseModel() when $default != null:
return $default(_that.id,_that.rating,_that.reviewsCount,_that.info,_that.price,_that.categories);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServiceDetailsResponseModel implements ServiceDetailsResponseModel {
  const _ServiceDetailsResponseModel({required this.id, required this.rating, @JsonKey(name: 'reviews_count') required this.reviewsCount, required this.info, required this.price, final  List<AddOnCategoryModel> categories = const []}): _categories = categories;
  factory _ServiceDetailsResponseModel.fromJson(Map<String, dynamic> json) => _$ServiceDetailsResponseModelFromJson(json);

@override final  String id;
@override final  int rating;
@override@JsonKey(name: 'reviews_count') final  int reviewsCount;
@override final  InfoModel info;
@override final  ServicePriceModel price;
 final  List<AddOnCategoryModel> _categories;
@override@JsonKey() List<AddOnCategoryModel> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}


/// Create a copy of ServiceDetailsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceDetailsResponseModelCopyWith<_ServiceDetailsResponseModel> get copyWith => __$ServiceDetailsResponseModelCopyWithImpl<_ServiceDetailsResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServiceDetailsResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceDetailsResponseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewsCount, reviewsCount) || other.reviewsCount == reviewsCount)&&(identical(other.info, info) || other.info == info)&&(identical(other.price, price) || other.price == price)&&const DeepCollectionEquality().equals(other._categories, _categories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,rating,reviewsCount,info,price,const DeepCollectionEquality().hash(_categories));

@override
String toString() {
  return 'ServiceDetailsResponseModel(id: $id, rating: $rating, reviewsCount: $reviewsCount, info: $info, price: $price, categories: $categories)';
}


}

/// @nodoc
abstract mixin class _$ServiceDetailsResponseModelCopyWith<$Res> implements $ServiceDetailsResponseModelCopyWith<$Res> {
  factory _$ServiceDetailsResponseModelCopyWith(_ServiceDetailsResponseModel value, $Res Function(_ServiceDetailsResponseModel) _then) = __$ServiceDetailsResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String id, int rating,@JsonKey(name: 'reviews_count') int reviewsCount, InfoModel info, ServicePriceModel price, List<AddOnCategoryModel> categories
});


@override $InfoModelCopyWith<$Res> get info;@override $ServicePriceModelCopyWith<$Res> get price;

}
/// @nodoc
class __$ServiceDetailsResponseModelCopyWithImpl<$Res>
    implements _$ServiceDetailsResponseModelCopyWith<$Res> {
  __$ServiceDetailsResponseModelCopyWithImpl(this._self, this._then);

  final _ServiceDetailsResponseModel _self;
  final $Res Function(_ServiceDetailsResponseModel) _then;

/// Create a copy of ServiceDetailsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? rating = null,Object? reviewsCount = null,Object? info = null,Object? price = null,Object? categories = null,}) {
  return _then(_ServiceDetailsResponseModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,reviewsCount: null == reviewsCount ? _self.reviewsCount : reviewsCount // ignore: cast_nullable_to_non_nullable
as int,info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as InfoModel,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as ServicePriceModel,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<AddOnCategoryModel>,
  ));
}

/// Create a copy of ServiceDetailsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InfoModelCopyWith<$Res> get info {
  
  return $InfoModelCopyWith<$Res>(_self.info, (value) {
    return _then(_self.copyWith(info: value));
  });
}/// Create a copy of ServiceDetailsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ServicePriceModelCopyWith<$Res> get price {
  
  return $ServicePriceModelCopyWith<$Res>(_self.price, (value) {
    return _then(_self.copyWith(price: value));
  });
}
}


/// @nodoc
mixin _$ServicePreviewResponseModel {

 String get id; InfoModel get info;@JsonKey(name: 'price') ServicePriceModel get priceModel; int get rating;@JsonKey(name: 'reviews_count') int get reviewsCount;
/// Create a copy of ServicePreviewResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServicePreviewResponseModelCopyWith<ServicePreviewResponseModel> get copyWith => _$ServicePreviewResponseModelCopyWithImpl<ServicePreviewResponseModel>(this as ServicePreviewResponseModel, _$identity);

  /// Serializes this ServicePreviewResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServicePreviewResponseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.info, info) || other.info == info)&&(identical(other.priceModel, priceModel) || other.priceModel == priceModel)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewsCount, reviewsCount) || other.reviewsCount == reviewsCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,info,priceModel,rating,reviewsCount);

@override
String toString() {
  return 'ServicePreviewResponseModel(id: $id, info: $info, priceModel: $priceModel, rating: $rating, reviewsCount: $reviewsCount)';
}


}

/// @nodoc
abstract mixin class $ServicePreviewResponseModelCopyWith<$Res>  {
  factory $ServicePreviewResponseModelCopyWith(ServicePreviewResponseModel value, $Res Function(ServicePreviewResponseModel) _then) = _$ServicePreviewResponseModelCopyWithImpl;
@useResult
$Res call({
 String id, InfoModel info,@JsonKey(name: 'price') ServicePriceModel priceModel, int rating,@JsonKey(name: 'reviews_count') int reviewsCount
});


$InfoModelCopyWith<$Res> get info;$ServicePriceModelCopyWith<$Res> get priceModel;

}
/// @nodoc
class _$ServicePreviewResponseModelCopyWithImpl<$Res>
    implements $ServicePreviewResponseModelCopyWith<$Res> {
  _$ServicePreviewResponseModelCopyWithImpl(this._self, this._then);

  final ServicePreviewResponseModel _self;
  final $Res Function(ServicePreviewResponseModel) _then;

/// Create a copy of ServicePreviewResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? info = null,Object? priceModel = null,Object? rating = null,Object? reviewsCount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as InfoModel,priceModel: null == priceModel ? _self.priceModel : priceModel // ignore: cast_nullable_to_non_nullable
as ServicePriceModel,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,reviewsCount: null == reviewsCount ? _self.reviewsCount : reviewsCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of ServicePreviewResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InfoModelCopyWith<$Res> get info {
  
  return $InfoModelCopyWith<$Res>(_self.info, (value) {
    return _then(_self.copyWith(info: value));
  });
}/// Create a copy of ServicePreviewResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ServicePriceModelCopyWith<$Res> get priceModel {
  
  return $ServicePriceModelCopyWith<$Res>(_self.priceModel, (value) {
    return _then(_self.copyWith(priceModel: value));
  });
}
}


/// Adds pattern-matching-related methods to [ServicePreviewResponseModel].
extension ServicePreviewResponseModelPatterns on ServicePreviewResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServicePreviewResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServicePreviewResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServicePreviewResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _ServicePreviewResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServicePreviewResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _ServicePreviewResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  InfoModel info, @JsonKey(name: 'price')  ServicePriceModel priceModel,  int rating, @JsonKey(name: 'reviews_count')  int reviewsCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServicePreviewResponseModel() when $default != null:
return $default(_that.id,_that.info,_that.priceModel,_that.rating,_that.reviewsCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  InfoModel info, @JsonKey(name: 'price')  ServicePriceModel priceModel,  int rating, @JsonKey(name: 'reviews_count')  int reviewsCount)  $default,) {final _that = this;
switch (_that) {
case _ServicePreviewResponseModel():
return $default(_that.id,_that.info,_that.priceModel,_that.rating,_that.reviewsCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  InfoModel info, @JsonKey(name: 'price')  ServicePriceModel priceModel,  int rating, @JsonKey(name: 'reviews_count')  int reviewsCount)?  $default,) {final _that = this;
switch (_that) {
case _ServicePreviewResponseModel() when $default != null:
return $default(_that.id,_that.info,_that.priceModel,_that.rating,_that.reviewsCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServicePreviewResponseModel implements ServicePreviewResponseModel {
  const _ServicePreviewResponseModel({required this.id, required this.info, @JsonKey(name: 'price') required this.priceModel, required this.rating, @JsonKey(name: 'reviews_count') required this.reviewsCount});
  factory _ServicePreviewResponseModel.fromJson(Map<String, dynamic> json) => _$ServicePreviewResponseModelFromJson(json);

@override final  String id;
@override final  InfoModel info;
@override@JsonKey(name: 'price') final  ServicePriceModel priceModel;
@override final  int rating;
@override@JsonKey(name: 'reviews_count') final  int reviewsCount;

/// Create a copy of ServicePreviewResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServicePreviewResponseModelCopyWith<_ServicePreviewResponseModel> get copyWith => __$ServicePreviewResponseModelCopyWithImpl<_ServicePreviewResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServicePreviewResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServicePreviewResponseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.info, info) || other.info == info)&&(identical(other.priceModel, priceModel) || other.priceModel == priceModel)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewsCount, reviewsCount) || other.reviewsCount == reviewsCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,info,priceModel,rating,reviewsCount);

@override
String toString() {
  return 'ServicePreviewResponseModel(id: $id, info: $info, priceModel: $priceModel, rating: $rating, reviewsCount: $reviewsCount)';
}


}

/// @nodoc
abstract mixin class _$ServicePreviewResponseModelCopyWith<$Res> implements $ServicePreviewResponseModelCopyWith<$Res> {
  factory _$ServicePreviewResponseModelCopyWith(_ServicePreviewResponseModel value, $Res Function(_ServicePreviewResponseModel) _then) = __$ServicePreviewResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String id, InfoModel info,@JsonKey(name: 'price') ServicePriceModel priceModel, int rating,@JsonKey(name: 'reviews_count') int reviewsCount
});


@override $InfoModelCopyWith<$Res> get info;@override $ServicePriceModelCopyWith<$Res> get priceModel;

}
/// @nodoc
class __$ServicePreviewResponseModelCopyWithImpl<$Res>
    implements _$ServicePreviewResponseModelCopyWith<$Res> {
  __$ServicePreviewResponseModelCopyWithImpl(this._self, this._then);

  final _ServicePreviewResponseModel _self;
  final $Res Function(_ServicePreviewResponseModel) _then;

/// Create a copy of ServicePreviewResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? info = null,Object? priceModel = null,Object? rating = null,Object? reviewsCount = null,}) {
  return _then(_ServicePreviewResponseModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as InfoModel,priceModel: null == priceModel ? _self.priceModel : priceModel // ignore: cast_nullable_to_non_nullable
as ServicePriceModel,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,reviewsCount: null == reviewsCount ? _self.reviewsCount : reviewsCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of ServicePreviewResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InfoModelCopyWith<$Res> get info {
  
  return $InfoModelCopyWith<$Res>(_self.info, (value) {
    return _then(_self.copyWith(info: value));
  });
}/// Create a copy of ServicePreviewResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ServicePriceModelCopyWith<$Res> get priceModel {
  
  return $ServicePriceModelCopyWith<$Res>(_self.priceModel, (value) {
    return _then(_self.copyWith(priceModel: value));
  });
}
}

// dart format on
