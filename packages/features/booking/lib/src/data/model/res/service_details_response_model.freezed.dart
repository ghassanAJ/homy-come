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

 String get id; String get title; List<ServiceCategoryModel> get categories;@JsonKey(name: 'featured_option') ServiceOptionModel? get featuredOption; List<ServiceSectionModel> get sections;
/// Create a copy of ServiceDetailsResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceDetailsResponseModelCopyWith<ServiceDetailsResponseModel> get copyWith => _$ServiceDetailsResponseModelCopyWithImpl<ServiceDetailsResponseModel>(this as ServiceDetailsResponseModel, _$identity);

  /// Serializes this ServiceDetailsResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceDetailsResponseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.categories, categories)&&(identical(other.featuredOption, featuredOption) || other.featuredOption == featuredOption)&&const DeepCollectionEquality().equals(other.sections, sections));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,const DeepCollectionEquality().hash(categories),featuredOption,const DeepCollectionEquality().hash(sections));

@override
String toString() {
  return 'ServiceDetailsResponseModel(id: $id, title: $title, categories: $categories, featuredOption: $featuredOption, sections: $sections)';
}


}

/// @nodoc
abstract mixin class $ServiceDetailsResponseModelCopyWith<$Res>  {
  factory $ServiceDetailsResponseModelCopyWith(ServiceDetailsResponseModel value, $Res Function(ServiceDetailsResponseModel) _then) = _$ServiceDetailsResponseModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, List<ServiceCategoryModel> categories,@JsonKey(name: 'featured_option') ServiceOptionModel? featuredOption, List<ServiceSectionModel> sections
});


$ServiceOptionModelCopyWith<$Res>? get featuredOption;

}
/// @nodoc
class _$ServiceDetailsResponseModelCopyWithImpl<$Res>
    implements $ServiceDetailsResponseModelCopyWith<$Res> {
  _$ServiceDetailsResponseModelCopyWithImpl(this._self, this._then);

  final ServiceDetailsResponseModel _self;
  final $Res Function(ServiceDetailsResponseModel) _then;

/// Create a copy of ServiceDetailsResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? categories = null,Object? featuredOption = freezed,Object? sections = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<ServiceCategoryModel>,featuredOption: freezed == featuredOption ? _self.featuredOption : featuredOption // ignore: cast_nullable_to_non_nullable
as ServiceOptionModel?,sections: null == sections ? _self.sections : sections // ignore: cast_nullable_to_non_nullable
as List<ServiceSectionModel>,
  ));
}
/// Create a copy of ServiceDetailsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ServiceOptionModelCopyWith<$Res>? get featuredOption {
    if (_self.featuredOption == null) {
    return null;
  }

  return $ServiceOptionModelCopyWith<$Res>(_self.featuredOption!, (value) {
    return _then(_self.copyWith(featuredOption: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  List<ServiceCategoryModel> categories, @JsonKey(name: 'featured_option')  ServiceOptionModel? featuredOption,  List<ServiceSectionModel> sections)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceDetailsResponseModel() when $default != null:
return $default(_that.id,_that.title,_that.categories,_that.featuredOption,_that.sections);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  List<ServiceCategoryModel> categories, @JsonKey(name: 'featured_option')  ServiceOptionModel? featuredOption,  List<ServiceSectionModel> sections)  $default,) {final _that = this;
switch (_that) {
case _ServiceDetailsResponseModel():
return $default(_that.id,_that.title,_that.categories,_that.featuredOption,_that.sections);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  List<ServiceCategoryModel> categories, @JsonKey(name: 'featured_option')  ServiceOptionModel? featuredOption,  List<ServiceSectionModel> sections)?  $default,) {final _that = this;
switch (_that) {
case _ServiceDetailsResponseModel() when $default != null:
return $default(_that.id,_that.title,_that.categories,_that.featuredOption,_that.sections);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServiceDetailsResponseModel implements ServiceDetailsResponseModel {
  const _ServiceDetailsResponseModel({required this.id, required this.title, final  List<ServiceCategoryModel> categories = const [], @JsonKey(name: 'featured_option') this.featuredOption, final  List<ServiceSectionModel> sections = const []}): _categories = categories,_sections = sections;
  factory _ServiceDetailsResponseModel.fromJson(Map<String, dynamic> json) => _$ServiceDetailsResponseModelFromJson(json);

@override final  String id;
@override final  String title;
 final  List<ServiceCategoryModel> _categories;
@override@JsonKey() List<ServiceCategoryModel> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

@override@JsonKey(name: 'featured_option') final  ServiceOptionModel? featuredOption;
 final  List<ServiceSectionModel> _sections;
@override@JsonKey() List<ServiceSectionModel> get sections {
  if (_sections is EqualUnmodifiableListView) return _sections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sections);
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceDetailsResponseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.featuredOption, featuredOption) || other.featuredOption == featuredOption)&&const DeepCollectionEquality().equals(other._sections, _sections));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,const DeepCollectionEquality().hash(_categories),featuredOption,const DeepCollectionEquality().hash(_sections));

@override
String toString() {
  return 'ServiceDetailsResponseModel(id: $id, title: $title, categories: $categories, featuredOption: $featuredOption, sections: $sections)';
}


}

/// @nodoc
abstract mixin class _$ServiceDetailsResponseModelCopyWith<$Res> implements $ServiceDetailsResponseModelCopyWith<$Res> {
  factory _$ServiceDetailsResponseModelCopyWith(_ServiceDetailsResponseModel value, $Res Function(_ServiceDetailsResponseModel) _then) = __$ServiceDetailsResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, List<ServiceCategoryModel> categories,@JsonKey(name: 'featured_option') ServiceOptionModel? featuredOption, List<ServiceSectionModel> sections
});


@override $ServiceOptionModelCopyWith<$Res>? get featuredOption;

}
/// @nodoc
class __$ServiceDetailsResponseModelCopyWithImpl<$Res>
    implements _$ServiceDetailsResponseModelCopyWith<$Res> {
  __$ServiceDetailsResponseModelCopyWithImpl(this._self, this._then);

  final _ServiceDetailsResponseModel _self;
  final $Res Function(_ServiceDetailsResponseModel) _then;

/// Create a copy of ServiceDetailsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? categories = null,Object? featuredOption = freezed,Object? sections = null,}) {
  return _then(_ServiceDetailsResponseModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<ServiceCategoryModel>,featuredOption: freezed == featuredOption ? _self.featuredOption : featuredOption // ignore: cast_nullable_to_non_nullable
as ServiceOptionModel?,sections: null == sections ? _self._sections : sections // ignore: cast_nullable_to_non_nullable
as List<ServiceSectionModel>,
  ));
}

/// Create a copy of ServiceDetailsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ServiceOptionModelCopyWith<$Res>? get featuredOption {
    if (_self.featuredOption == null) {
    return null;
  }

  return $ServiceOptionModelCopyWith<$Res>(_self.featuredOption!, (value) {
    return _then(_self.copyWith(featuredOption: value));
  });
}
}

// dart format on
