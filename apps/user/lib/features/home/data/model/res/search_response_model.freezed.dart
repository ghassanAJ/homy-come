// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchResponseModel {

 List<String> get popularSearch; List<ServiceCategoryModel> get topCategories;
/// Create a copy of SearchResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchResponseModelCopyWith<SearchResponseModel> get copyWith => _$SearchResponseModelCopyWithImpl<SearchResponseModel>(this as SearchResponseModel, _$identity);

  /// Serializes this SearchResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchResponseModel&&const DeepCollectionEquality().equals(other.popularSearch, popularSearch)&&const DeepCollectionEquality().equals(other.topCategories, topCategories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(popularSearch),const DeepCollectionEquality().hash(topCategories));

@override
String toString() {
  return 'SearchResponseModel(popularSearch: $popularSearch, topCategories: $topCategories)';
}


}

/// @nodoc
abstract mixin class $SearchResponseModelCopyWith<$Res>  {
  factory $SearchResponseModelCopyWith(SearchResponseModel value, $Res Function(SearchResponseModel) _then) = _$SearchResponseModelCopyWithImpl;
@useResult
$Res call({
 List<String> popularSearch, List<ServiceCategoryModel> topCategories
});




}
/// @nodoc
class _$SearchResponseModelCopyWithImpl<$Res>
    implements $SearchResponseModelCopyWith<$Res> {
  _$SearchResponseModelCopyWithImpl(this._self, this._then);

  final SearchResponseModel _self;
  final $Res Function(SearchResponseModel) _then;

/// Create a copy of SearchResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? popularSearch = null,Object? topCategories = null,}) {
  return _then(_self.copyWith(
popularSearch: null == popularSearch ? _self.popularSearch : popularSearch // ignore: cast_nullable_to_non_nullable
as List<String>,topCategories: null == topCategories ? _self.topCategories : topCategories // ignore: cast_nullable_to_non_nullable
as List<ServiceCategoryModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchResponseModel].
extension SearchResponseModelPatterns on SearchResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _SearchResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _SearchResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> popularSearch,  List<ServiceCategoryModel> topCategories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchResponseModel() when $default != null:
return $default(_that.popularSearch,_that.topCategories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> popularSearch,  List<ServiceCategoryModel> topCategories)  $default,) {final _that = this;
switch (_that) {
case _SearchResponseModel():
return $default(_that.popularSearch,_that.topCategories);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> popularSearch,  List<ServiceCategoryModel> topCategories)?  $default,) {final _that = this;
switch (_that) {
case _SearchResponseModel() when $default != null:
return $default(_that.popularSearch,_that.topCategories);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchResponseModel implements SearchResponseModel {
  const _SearchResponseModel({final  List<String> popularSearch = const [], final  List<ServiceCategoryModel> topCategories = const []}): _popularSearch = popularSearch,_topCategories = topCategories;
  factory _SearchResponseModel.fromJson(Map<String, dynamic> json) => _$SearchResponseModelFromJson(json);

 final  List<String> _popularSearch;
@override@JsonKey() List<String> get popularSearch {
  if (_popularSearch is EqualUnmodifiableListView) return _popularSearch;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_popularSearch);
}

 final  List<ServiceCategoryModel> _topCategories;
@override@JsonKey() List<ServiceCategoryModel> get topCategories {
  if (_topCategories is EqualUnmodifiableListView) return _topCategories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topCategories);
}


/// Create a copy of SearchResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchResponseModelCopyWith<_SearchResponseModel> get copyWith => __$SearchResponseModelCopyWithImpl<_SearchResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchResponseModel&&const DeepCollectionEquality().equals(other._popularSearch, _popularSearch)&&const DeepCollectionEquality().equals(other._topCategories, _topCategories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_popularSearch),const DeepCollectionEquality().hash(_topCategories));

@override
String toString() {
  return 'SearchResponseModel(popularSearch: $popularSearch, topCategories: $topCategories)';
}


}

/// @nodoc
abstract mixin class _$SearchResponseModelCopyWith<$Res> implements $SearchResponseModelCopyWith<$Res> {
  factory _$SearchResponseModelCopyWith(_SearchResponseModel value, $Res Function(_SearchResponseModel) _then) = __$SearchResponseModelCopyWithImpl;
@override @useResult
$Res call({
 List<String> popularSearch, List<ServiceCategoryModel> topCategories
});




}
/// @nodoc
class __$SearchResponseModelCopyWithImpl<$Res>
    implements _$SearchResponseModelCopyWith<$Res> {
  __$SearchResponseModelCopyWithImpl(this._self, this._then);

  final _SearchResponseModel _self;
  final $Res Function(_SearchResponseModel) _then;

/// Create a copy of SearchResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? popularSearch = null,Object? topCategories = null,}) {
  return _then(_SearchResponseModel(
popularSearch: null == popularSearch ? _self._popularSearch : popularSearch // ignore: cast_nullable_to_non_nullable
as List<String>,topCategories: null == topCategories ? _self._topCategories : topCategories // ignore: cast_nullable_to_non_nullable
as List<ServiceCategoryModel>,
  ));
}


}

// dart format on
