// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeBlocEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeBlocEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeBlocEvent()';
}


}

/// @nodoc
class $HomeBlocEventCopyWith<$Res>  {
$HomeBlocEventCopyWith(HomeBlocEvent _, $Res Function(HomeBlocEvent) __);
}


/// Adds pattern-matching-related methods to [HomeBlocEvent].
extension HomeBlocEventPatterns on HomeBlocEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadHomeContentEvent value)?  loadCategories,TResult Function( LoadSlidersEvent value)?  loadSliders,TResult Function( LoadOffersEvent value)?  loadOffers,TResult Function( LoadStoriesEvent value)?  loadStories,TResult Function( LoadCategoryServicesEvent value)?  loadCategoryServices,TResult Function( LoadServiceDetailsEvent value)?  loadServiceDetails,TResult Function( LoadSearchContentEvent value)?  loadSearchContent,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadHomeContentEvent() when loadCategories != null:
return loadCategories(_that);case LoadSlidersEvent() when loadSliders != null:
return loadSliders(_that);case LoadOffersEvent() when loadOffers != null:
return loadOffers(_that);case LoadStoriesEvent() when loadStories != null:
return loadStories(_that);case LoadCategoryServicesEvent() when loadCategoryServices != null:
return loadCategoryServices(_that);case LoadServiceDetailsEvent() when loadServiceDetails != null:
return loadServiceDetails(_that);case LoadSearchContentEvent() when loadSearchContent != null:
return loadSearchContent(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadHomeContentEvent value)  loadCategories,required TResult Function( LoadSlidersEvent value)  loadSliders,required TResult Function( LoadOffersEvent value)  loadOffers,required TResult Function( LoadStoriesEvent value)  loadStories,required TResult Function( LoadCategoryServicesEvent value)  loadCategoryServices,required TResult Function( LoadServiceDetailsEvent value)  loadServiceDetails,required TResult Function( LoadSearchContentEvent value)  loadSearchContent,}){
final _that = this;
switch (_that) {
case LoadHomeContentEvent():
return loadCategories(_that);case LoadSlidersEvent():
return loadSliders(_that);case LoadOffersEvent():
return loadOffers(_that);case LoadStoriesEvent():
return loadStories(_that);case LoadCategoryServicesEvent():
return loadCategoryServices(_that);case LoadServiceDetailsEvent():
return loadServiceDetails(_that);case LoadSearchContentEvent():
return loadSearchContent(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadHomeContentEvent value)?  loadCategories,TResult? Function( LoadSlidersEvent value)?  loadSliders,TResult? Function( LoadOffersEvent value)?  loadOffers,TResult? Function( LoadStoriesEvent value)?  loadStories,TResult? Function( LoadCategoryServicesEvent value)?  loadCategoryServices,TResult? Function( LoadServiceDetailsEvent value)?  loadServiceDetails,TResult? Function( LoadSearchContentEvent value)?  loadSearchContent,}){
final _that = this;
switch (_that) {
case LoadHomeContentEvent() when loadCategories != null:
return loadCategories(_that);case LoadSlidersEvent() when loadSliders != null:
return loadSliders(_that);case LoadOffersEvent() when loadOffers != null:
return loadOffers(_that);case LoadStoriesEvent() when loadStories != null:
return loadStories(_that);case LoadCategoryServicesEvent() when loadCategoryServices != null:
return loadCategoryServices(_that);case LoadServiceDetailsEvent() when loadServiceDetails != null:
return loadServiceDetails(_that);case LoadSearchContentEvent() when loadSearchContent != null:
return loadSearchContent(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadCategories,TResult Function()?  loadSliders,TResult Function()?  loadOffers,TResult Function()?  loadStories,TResult Function( String categoryId)?  loadCategoryServices,TResult Function( GetServiceDetailsRequestModel request)?  loadServiceDetails,TResult Function( String qwery)?  loadSearchContent,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadHomeContentEvent() when loadCategories != null:
return loadCategories();case LoadSlidersEvent() when loadSliders != null:
return loadSliders();case LoadOffersEvent() when loadOffers != null:
return loadOffers();case LoadStoriesEvent() when loadStories != null:
return loadStories();case LoadCategoryServicesEvent() when loadCategoryServices != null:
return loadCategoryServices(_that.categoryId);case LoadServiceDetailsEvent() when loadServiceDetails != null:
return loadServiceDetails(_that.request);case LoadSearchContentEvent() when loadSearchContent != null:
return loadSearchContent(_that.qwery);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadCategories,required TResult Function()  loadSliders,required TResult Function()  loadOffers,required TResult Function()  loadStories,required TResult Function( String categoryId)  loadCategoryServices,required TResult Function( GetServiceDetailsRequestModel request)  loadServiceDetails,required TResult Function( String qwery)  loadSearchContent,}) {final _that = this;
switch (_that) {
case LoadHomeContentEvent():
return loadCategories();case LoadSlidersEvent():
return loadSliders();case LoadOffersEvent():
return loadOffers();case LoadStoriesEvent():
return loadStories();case LoadCategoryServicesEvent():
return loadCategoryServices(_that.categoryId);case LoadServiceDetailsEvent():
return loadServiceDetails(_that.request);case LoadSearchContentEvent():
return loadSearchContent(_that.qwery);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadCategories,TResult? Function()?  loadSliders,TResult? Function()?  loadOffers,TResult? Function()?  loadStories,TResult? Function( String categoryId)?  loadCategoryServices,TResult? Function( GetServiceDetailsRequestModel request)?  loadServiceDetails,TResult? Function( String qwery)?  loadSearchContent,}) {final _that = this;
switch (_that) {
case LoadHomeContentEvent() when loadCategories != null:
return loadCategories();case LoadSlidersEvent() when loadSliders != null:
return loadSliders();case LoadOffersEvent() when loadOffers != null:
return loadOffers();case LoadStoriesEvent() when loadStories != null:
return loadStories();case LoadCategoryServicesEvent() when loadCategoryServices != null:
return loadCategoryServices(_that.categoryId);case LoadServiceDetailsEvent() when loadServiceDetails != null:
return loadServiceDetails(_that.request);case LoadSearchContentEvent() when loadSearchContent != null:
return loadSearchContent(_that.qwery);case _:
  return null;

}
}

}

/// @nodoc


class LoadHomeContentEvent implements HomeBlocEvent {
  const LoadHomeContentEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadHomeContentEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeBlocEvent.loadCategories()';
}


}




/// @nodoc


class LoadSlidersEvent implements HomeBlocEvent {
  const LoadSlidersEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadSlidersEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeBlocEvent.loadSliders()';
}


}




/// @nodoc


class LoadOffersEvent implements HomeBlocEvent {
  const LoadOffersEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadOffersEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeBlocEvent.loadOffers()';
}


}




/// @nodoc


class LoadStoriesEvent implements HomeBlocEvent {
  const LoadStoriesEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadStoriesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeBlocEvent.loadStories()';
}


}




/// @nodoc


class LoadCategoryServicesEvent implements HomeBlocEvent {
  const LoadCategoryServicesEvent(this.categoryId);
  

 final  String categoryId;

/// Create a copy of HomeBlocEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadCategoryServicesEventCopyWith<LoadCategoryServicesEvent> get copyWith => _$LoadCategoryServicesEventCopyWithImpl<LoadCategoryServicesEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadCategoryServicesEvent&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}


@override
int get hashCode => Object.hash(runtimeType,categoryId);

@override
String toString() {
  return 'HomeBlocEvent.loadCategoryServices(categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class $LoadCategoryServicesEventCopyWith<$Res> implements $HomeBlocEventCopyWith<$Res> {
  factory $LoadCategoryServicesEventCopyWith(LoadCategoryServicesEvent value, $Res Function(LoadCategoryServicesEvent) _then) = _$LoadCategoryServicesEventCopyWithImpl;
@useResult
$Res call({
 String categoryId
});




}
/// @nodoc
class _$LoadCategoryServicesEventCopyWithImpl<$Res>
    implements $LoadCategoryServicesEventCopyWith<$Res> {
  _$LoadCategoryServicesEventCopyWithImpl(this._self, this._then);

  final LoadCategoryServicesEvent _self;
  final $Res Function(LoadCategoryServicesEvent) _then;

/// Create a copy of HomeBlocEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categoryId = null,}) {
  return _then(LoadCategoryServicesEvent(
null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LoadServiceDetailsEvent implements HomeBlocEvent {
  const LoadServiceDetailsEvent(this.request);
  

 final  GetServiceDetailsRequestModel request;

/// Create a copy of HomeBlocEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadServiceDetailsEventCopyWith<LoadServiceDetailsEvent> get copyWith => _$LoadServiceDetailsEventCopyWithImpl<LoadServiceDetailsEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadServiceDetailsEvent&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode => Object.hash(runtimeType,request);

@override
String toString() {
  return 'HomeBlocEvent.loadServiceDetails(request: $request)';
}


}

/// @nodoc
abstract mixin class $LoadServiceDetailsEventCopyWith<$Res> implements $HomeBlocEventCopyWith<$Res> {
  factory $LoadServiceDetailsEventCopyWith(LoadServiceDetailsEvent value, $Res Function(LoadServiceDetailsEvent) _then) = _$LoadServiceDetailsEventCopyWithImpl;
@useResult
$Res call({
 GetServiceDetailsRequestModel request
});


$GetServiceDetailsRequestModelCopyWith<$Res> get request;

}
/// @nodoc
class _$LoadServiceDetailsEventCopyWithImpl<$Res>
    implements $LoadServiceDetailsEventCopyWith<$Res> {
  _$LoadServiceDetailsEventCopyWithImpl(this._self, this._then);

  final LoadServiceDetailsEvent _self;
  final $Res Function(LoadServiceDetailsEvent) _then;

/// Create a copy of HomeBlocEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? request = null,}) {
  return _then(LoadServiceDetailsEvent(
null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as GetServiceDetailsRequestModel,
  ));
}

/// Create a copy of HomeBlocEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GetServiceDetailsRequestModelCopyWith<$Res> get request {
  
  return $GetServiceDetailsRequestModelCopyWith<$Res>(_self.request, (value) {
    return _then(_self.copyWith(request: value));
  });
}
}

/// @nodoc


class LoadSearchContentEvent implements HomeBlocEvent {
  const LoadSearchContentEvent(this.qwery);
  

 final  String qwery;

/// Create a copy of HomeBlocEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadSearchContentEventCopyWith<LoadSearchContentEvent> get copyWith => _$LoadSearchContentEventCopyWithImpl<LoadSearchContentEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadSearchContentEvent&&(identical(other.qwery, qwery) || other.qwery == qwery));
}


@override
int get hashCode => Object.hash(runtimeType,qwery);

@override
String toString() {
  return 'HomeBlocEvent.loadSearchContent(qwery: $qwery)';
}


}

/// @nodoc
abstract mixin class $LoadSearchContentEventCopyWith<$Res> implements $HomeBlocEventCopyWith<$Res> {
  factory $LoadSearchContentEventCopyWith(LoadSearchContentEvent value, $Res Function(LoadSearchContentEvent) _then) = _$LoadSearchContentEventCopyWithImpl;
@useResult
$Res call({
 String qwery
});




}
/// @nodoc
class _$LoadSearchContentEventCopyWithImpl<$Res>
    implements $LoadSearchContentEventCopyWith<$Res> {
  _$LoadSearchContentEventCopyWithImpl(this._self, this._then);

  final LoadSearchContentEvent _self;
  final $Res Function(LoadSearchContentEvent) _then;

/// Create a copy of HomeBlocEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? qwery = null,}) {
  return _then(LoadSearchContentEvent(
null == qwery ? _self.qwery : qwery // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
