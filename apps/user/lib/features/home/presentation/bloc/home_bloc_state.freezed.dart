// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeBlocState {

 HomeBlocStatus get status; bool get categoriesLoading; bool get slidersLoading; bool get offersLoading; bool get searchContentLoading; bool get serviceDetailsLoading; List<ServiceCategoryModel> get categories; List<ServicePreviewResponseModel> get categoryServices; List<OfferModel> get offers; List<OfferModel> get sliders; SearchResponseModel? get searchContent; ServiceDetailsResponseModel? get serviceDetails; APIException? get error;
/// Create a copy of HomeBlocState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeBlocStateCopyWith<HomeBlocState> get copyWith => _$HomeBlocStateCopyWithImpl<HomeBlocState>(this as HomeBlocState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeBlocState&&(identical(other.status, status) || other.status == status)&&(identical(other.categoriesLoading, categoriesLoading) || other.categoriesLoading == categoriesLoading)&&(identical(other.slidersLoading, slidersLoading) || other.slidersLoading == slidersLoading)&&(identical(other.offersLoading, offersLoading) || other.offersLoading == offersLoading)&&(identical(other.searchContentLoading, searchContentLoading) || other.searchContentLoading == searchContentLoading)&&(identical(other.serviceDetailsLoading, serviceDetailsLoading) || other.serviceDetailsLoading == serviceDetailsLoading)&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.categoryServices, categoryServices)&&const DeepCollectionEquality().equals(other.offers, offers)&&const DeepCollectionEquality().equals(other.sliders, sliders)&&(identical(other.searchContent, searchContent) || other.searchContent == searchContent)&&(identical(other.serviceDetails, serviceDetails) || other.serviceDetails == serviceDetails)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,status,categoriesLoading,slidersLoading,offersLoading,searchContentLoading,serviceDetailsLoading,const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(categoryServices),const DeepCollectionEquality().hash(offers),const DeepCollectionEquality().hash(sliders),searchContent,serviceDetails,error);

@override
String toString() {
  return 'HomeBlocState(status: $status, categoriesLoading: $categoriesLoading, slidersLoading: $slidersLoading, offersLoading: $offersLoading, searchContentLoading: $searchContentLoading, serviceDetailsLoading: $serviceDetailsLoading, categories: $categories, categoryServices: $categoryServices, offers: $offers, sliders: $sliders, searchContent: $searchContent, serviceDetails: $serviceDetails, error: $error)';
}


}

/// @nodoc
abstract mixin class $HomeBlocStateCopyWith<$Res>  {
  factory $HomeBlocStateCopyWith(HomeBlocState value, $Res Function(HomeBlocState) _then) = _$HomeBlocStateCopyWithImpl;
@useResult
$Res call({
 HomeBlocStatus status, bool categoriesLoading, bool slidersLoading, bool offersLoading, bool searchContentLoading, bool serviceDetailsLoading, List<ServiceCategoryModel> categories, List<ServicePreviewResponseModel> categoryServices, List<OfferModel> offers, List<OfferModel> sliders, SearchResponseModel? searchContent, ServiceDetailsResponseModel? serviceDetails, APIException? error
});


$SearchResponseModelCopyWith<$Res>? get searchContent;$ServiceDetailsResponseModelCopyWith<$Res>? get serviceDetails;

}
/// @nodoc
class _$HomeBlocStateCopyWithImpl<$Res>
    implements $HomeBlocStateCopyWith<$Res> {
  _$HomeBlocStateCopyWithImpl(this._self, this._then);

  final HomeBlocState _self;
  final $Res Function(HomeBlocState) _then;

/// Create a copy of HomeBlocState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? categoriesLoading = null,Object? slidersLoading = null,Object? offersLoading = null,Object? searchContentLoading = null,Object? serviceDetailsLoading = null,Object? categories = null,Object? categoryServices = null,Object? offers = null,Object? sliders = null,Object? searchContent = freezed,Object? serviceDetails = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HomeBlocStatus,categoriesLoading: null == categoriesLoading ? _self.categoriesLoading : categoriesLoading // ignore: cast_nullable_to_non_nullable
as bool,slidersLoading: null == slidersLoading ? _self.slidersLoading : slidersLoading // ignore: cast_nullable_to_non_nullable
as bool,offersLoading: null == offersLoading ? _self.offersLoading : offersLoading // ignore: cast_nullable_to_non_nullable
as bool,searchContentLoading: null == searchContentLoading ? _self.searchContentLoading : searchContentLoading // ignore: cast_nullable_to_non_nullable
as bool,serviceDetailsLoading: null == serviceDetailsLoading ? _self.serviceDetailsLoading : serviceDetailsLoading // ignore: cast_nullable_to_non_nullable
as bool,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<ServiceCategoryModel>,categoryServices: null == categoryServices ? _self.categoryServices : categoryServices // ignore: cast_nullable_to_non_nullable
as List<ServicePreviewResponseModel>,offers: null == offers ? _self.offers : offers // ignore: cast_nullable_to_non_nullable
as List<OfferModel>,sliders: null == sliders ? _self.sliders : sliders // ignore: cast_nullable_to_non_nullable
as List<OfferModel>,searchContent: freezed == searchContent ? _self.searchContent : searchContent // ignore: cast_nullable_to_non_nullable
as SearchResponseModel?,serviceDetails: freezed == serviceDetails ? _self.serviceDetails : serviceDetails // ignore: cast_nullable_to_non_nullable
as ServiceDetailsResponseModel?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as APIException?,
  ));
}
/// Create a copy of HomeBlocState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchResponseModelCopyWith<$Res>? get searchContent {
    if (_self.searchContent == null) {
    return null;
  }

  return $SearchResponseModelCopyWith<$Res>(_self.searchContent!, (value) {
    return _then(_self.copyWith(searchContent: value));
  });
}/// Create a copy of HomeBlocState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ServiceDetailsResponseModelCopyWith<$Res>? get serviceDetails {
    if (_self.serviceDetails == null) {
    return null;
  }

  return $ServiceDetailsResponseModelCopyWith<$Res>(_self.serviceDetails!, (value) {
    return _then(_self.copyWith(serviceDetails: value));
  });
}
}


/// Adds pattern-matching-related methods to [HomeBlocState].
extension HomeBlocStatePatterns on HomeBlocState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _HomeBlocState value)?  initial,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeBlocState() when initial != null:
return initial(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _HomeBlocState value)  initial,}){
final _that = this;
switch (_that) {
case _HomeBlocState():
return initial(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _HomeBlocState value)?  initial,}){
final _that = this;
switch (_that) {
case _HomeBlocState() when initial != null:
return initial(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( HomeBlocStatus status,  bool categoriesLoading,  bool slidersLoading,  bool offersLoading,  bool searchContentLoading,  bool serviceDetailsLoading,  List<ServiceCategoryModel> categories,  List<ServicePreviewResponseModel> categoryServices,  List<OfferModel> offers,  List<OfferModel> sliders,  SearchResponseModel? searchContent,  ServiceDetailsResponseModel? serviceDetails,  APIException? error)?  initial,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeBlocState() when initial != null:
return initial(_that.status,_that.categoriesLoading,_that.slidersLoading,_that.offersLoading,_that.searchContentLoading,_that.serviceDetailsLoading,_that.categories,_that.categoryServices,_that.offers,_that.sliders,_that.searchContent,_that.serviceDetails,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( HomeBlocStatus status,  bool categoriesLoading,  bool slidersLoading,  bool offersLoading,  bool searchContentLoading,  bool serviceDetailsLoading,  List<ServiceCategoryModel> categories,  List<ServicePreviewResponseModel> categoryServices,  List<OfferModel> offers,  List<OfferModel> sliders,  SearchResponseModel? searchContent,  ServiceDetailsResponseModel? serviceDetails,  APIException? error)  initial,}) {final _that = this;
switch (_that) {
case _HomeBlocState():
return initial(_that.status,_that.categoriesLoading,_that.slidersLoading,_that.offersLoading,_that.searchContentLoading,_that.serviceDetailsLoading,_that.categories,_that.categoryServices,_that.offers,_that.sliders,_that.searchContent,_that.serviceDetails,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( HomeBlocStatus status,  bool categoriesLoading,  bool slidersLoading,  bool offersLoading,  bool searchContentLoading,  bool serviceDetailsLoading,  List<ServiceCategoryModel> categories,  List<ServicePreviewResponseModel> categoryServices,  List<OfferModel> offers,  List<OfferModel> sliders,  SearchResponseModel? searchContent,  ServiceDetailsResponseModel? serviceDetails,  APIException? error)?  initial,}) {final _that = this;
switch (_that) {
case _HomeBlocState() when initial != null:
return initial(_that.status,_that.categoriesLoading,_that.slidersLoading,_that.offersLoading,_that.searchContentLoading,_that.serviceDetailsLoading,_that.categories,_that.categoryServices,_that.offers,_that.sliders,_that.searchContent,_that.serviceDetails,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _HomeBlocState implements HomeBlocState {
  const _HomeBlocState({this.status = HomeBlocStatus.initial, this.categoriesLoading = false, this.slidersLoading = false, this.offersLoading = false, this.searchContentLoading = false, this.serviceDetailsLoading = false, final  List<ServiceCategoryModel> categories = const [], final  List<ServicePreviewResponseModel> categoryServices = const [], final  List<OfferModel> offers = const [], final  List<OfferModel> sliders = const [], this.searchContent, this.serviceDetails, this.error}): _categories = categories,_categoryServices = categoryServices,_offers = offers,_sliders = sliders;
  

@override@JsonKey() final  HomeBlocStatus status;
@override@JsonKey() final  bool categoriesLoading;
@override@JsonKey() final  bool slidersLoading;
@override@JsonKey() final  bool offersLoading;
@override@JsonKey() final  bool searchContentLoading;
@override@JsonKey() final  bool serviceDetailsLoading;
 final  List<ServiceCategoryModel> _categories;
@override@JsonKey() List<ServiceCategoryModel> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<ServicePreviewResponseModel> _categoryServices;
@override@JsonKey() List<ServicePreviewResponseModel> get categoryServices {
  if (_categoryServices is EqualUnmodifiableListView) return _categoryServices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categoryServices);
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

@override final  SearchResponseModel? searchContent;
@override final  ServiceDetailsResponseModel? serviceDetails;
@override final  APIException? error;

/// Create a copy of HomeBlocState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeBlocStateCopyWith<_HomeBlocState> get copyWith => __$HomeBlocStateCopyWithImpl<_HomeBlocState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeBlocState&&(identical(other.status, status) || other.status == status)&&(identical(other.categoriesLoading, categoriesLoading) || other.categoriesLoading == categoriesLoading)&&(identical(other.slidersLoading, slidersLoading) || other.slidersLoading == slidersLoading)&&(identical(other.offersLoading, offersLoading) || other.offersLoading == offersLoading)&&(identical(other.searchContentLoading, searchContentLoading) || other.searchContentLoading == searchContentLoading)&&(identical(other.serviceDetailsLoading, serviceDetailsLoading) || other.serviceDetailsLoading == serviceDetailsLoading)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._categoryServices, _categoryServices)&&const DeepCollectionEquality().equals(other._offers, _offers)&&const DeepCollectionEquality().equals(other._sliders, _sliders)&&(identical(other.searchContent, searchContent) || other.searchContent == searchContent)&&(identical(other.serviceDetails, serviceDetails) || other.serviceDetails == serviceDetails)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,status,categoriesLoading,slidersLoading,offersLoading,searchContentLoading,serviceDetailsLoading,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_categoryServices),const DeepCollectionEquality().hash(_offers),const DeepCollectionEquality().hash(_sliders),searchContent,serviceDetails,error);

@override
String toString() {
  return 'HomeBlocState.initial(status: $status, categoriesLoading: $categoriesLoading, slidersLoading: $slidersLoading, offersLoading: $offersLoading, searchContentLoading: $searchContentLoading, serviceDetailsLoading: $serviceDetailsLoading, categories: $categories, categoryServices: $categoryServices, offers: $offers, sliders: $sliders, searchContent: $searchContent, serviceDetails: $serviceDetails, error: $error)';
}


}

/// @nodoc
abstract mixin class _$HomeBlocStateCopyWith<$Res> implements $HomeBlocStateCopyWith<$Res> {
  factory _$HomeBlocStateCopyWith(_HomeBlocState value, $Res Function(_HomeBlocState) _then) = __$HomeBlocStateCopyWithImpl;
@override @useResult
$Res call({
 HomeBlocStatus status, bool categoriesLoading, bool slidersLoading, bool offersLoading, bool searchContentLoading, bool serviceDetailsLoading, List<ServiceCategoryModel> categories, List<ServicePreviewResponseModel> categoryServices, List<OfferModel> offers, List<OfferModel> sliders, SearchResponseModel? searchContent, ServiceDetailsResponseModel? serviceDetails, APIException? error
});


@override $SearchResponseModelCopyWith<$Res>? get searchContent;@override $ServiceDetailsResponseModelCopyWith<$Res>? get serviceDetails;

}
/// @nodoc
class __$HomeBlocStateCopyWithImpl<$Res>
    implements _$HomeBlocStateCopyWith<$Res> {
  __$HomeBlocStateCopyWithImpl(this._self, this._then);

  final _HomeBlocState _self;
  final $Res Function(_HomeBlocState) _then;

/// Create a copy of HomeBlocState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? categoriesLoading = null,Object? slidersLoading = null,Object? offersLoading = null,Object? searchContentLoading = null,Object? serviceDetailsLoading = null,Object? categories = null,Object? categoryServices = null,Object? offers = null,Object? sliders = null,Object? searchContent = freezed,Object? serviceDetails = freezed,Object? error = freezed,}) {
  return _then(_HomeBlocState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HomeBlocStatus,categoriesLoading: null == categoriesLoading ? _self.categoriesLoading : categoriesLoading // ignore: cast_nullable_to_non_nullable
as bool,slidersLoading: null == slidersLoading ? _self.slidersLoading : slidersLoading // ignore: cast_nullable_to_non_nullable
as bool,offersLoading: null == offersLoading ? _self.offersLoading : offersLoading // ignore: cast_nullable_to_non_nullable
as bool,searchContentLoading: null == searchContentLoading ? _self.searchContentLoading : searchContentLoading // ignore: cast_nullable_to_non_nullable
as bool,serviceDetailsLoading: null == serviceDetailsLoading ? _self.serviceDetailsLoading : serviceDetailsLoading // ignore: cast_nullable_to_non_nullable
as bool,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<ServiceCategoryModel>,categoryServices: null == categoryServices ? _self._categoryServices : categoryServices // ignore: cast_nullable_to_non_nullable
as List<ServicePreviewResponseModel>,offers: null == offers ? _self._offers : offers // ignore: cast_nullable_to_non_nullable
as List<OfferModel>,sliders: null == sliders ? _self._sliders : sliders // ignore: cast_nullable_to_non_nullable
as List<OfferModel>,searchContent: freezed == searchContent ? _self.searchContent : searchContent // ignore: cast_nullable_to_non_nullable
as SearchResponseModel?,serviceDetails: freezed == serviceDetails ? _self.serviceDetails : serviceDetails // ignore: cast_nullable_to_non_nullable
as ServiceDetailsResponseModel?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as APIException?,
  ));
}

/// Create a copy of HomeBlocState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchResponseModelCopyWith<$Res>? get searchContent {
    if (_self.searchContent == null) {
    return null;
  }

  return $SearchResponseModelCopyWith<$Res>(_self.searchContent!, (value) {
    return _then(_self.copyWith(searchContent: value));
  });
}/// Create a copy of HomeBlocState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ServiceDetailsResponseModelCopyWith<$Res>? get serviceDetails {
    if (_self.serviceDetails == null) {
    return null;
  }

  return $ServiceDetailsResponseModelCopyWith<$Res>(_self.serviceDetails!, (value) {
    return _then(_self.copyWith(serviceDetails: value));
  });
}
}

// dart format on
