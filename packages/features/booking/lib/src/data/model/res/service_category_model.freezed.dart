// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServiceCategoryModel {

 String get id; String get name; int get servicesCount;@JsonKey(name: 'image_url') String? get imageUrl; List<ServicePreviewResponseModel> get servicePreviews;
/// Create a copy of ServiceCategoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceCategoryModelCopyWith<ServiceCategoryModel> get copyWith => _$ServiceCategoryModelCopyWithImpl<ServiceCategoryModel>(this as ServiceCategoryModel, _$identity);

  /// Serializes this ServiceCategoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceCategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.servicesCount, servicesCount) || other.servicesCount == servicesCount)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&const DeepCollectionEquality().equals(other.servicePreviews, servicePreviews));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,servicesCount,imageUrl,const DeepCollectionEquality().hash(servicePreviews));

@override
String toString() {
  return 'ServiceCategoryModel(id: $id, name: $name, servicesCount: $servicesCount, imageUrl: $imageUrl, servicePreviews: $servicePreviews)';
}


}

/// @nodoc
abstract mixin class $ServiceCategoryModelCopyWith<$Res>  {
  factory $ServiceCategoryModelCopyWith(ServiceCategoryModel value, $Res Function(ServiceCategoryModel) _then) = _$ServiceCategoryModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, int servicesCount,@JsonKey(name: 'image_url') String? imageUrl, List<ServicePreviewResponseModel> servicePreviews
});




}
/// @nodoc
class _$ServiceCategoryModelCopyWithImpl<$Res>
    implements $ServiceCategoryModelCopyWith<$Res> {
  _$ServiceCategoryModelCopyWithImpl(this._self, this._then);

  final ServiceCategoryModel _self;
  final $Res Function(ServiceCategoryModel) _then;

/// Create a copy of ServiceCategoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? servicesCount = null,Object? imageUrl = freezed,Object? servicePreviews = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,servicesCount: null == servicesCount ? _self.servicesCount : servicesCount // ignore: cast_nullable_to_non_nullable
as int,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,servicePreviews: null == servicePreviews ? _self.servicePreviews : servicePreviews // ignore: cast_nullable_to_non_nullable
as List<ServicePreviewResponseModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [ServiceCategoryModel].
extension ServiceCategoryModelPatterns on ServiceCategoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceCategoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceCategoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceCategoryModel value)  $default,){
final _that = this;
switch (_that) {
case _ServiceCategoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceCategoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceCategoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  int servicesCount, @JsonKey(name: 'image_url')  String? imageUrl,  List<ServicePreviewResponseModel> servicePreviews)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceCategoryModel() when $default != null:
return $default(_that.id,_that.name,_that.servicesCount,_that.imageUrl,_that.servicePreviews);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  int servicesCount, @JsonKey(name: 'image_url')  String? imageUrl,  List<ServicePreviewResponseModel> servicePreviews)  $default,) {final _that = this;
switch (_that) {
case _ServiceCategoryModel():
return $default(_that.id,_that.name,_that.servicesCount,_that.imageUrl,_that.servicePreviews);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  int servicesCount, @JsonKey(name: 'image_url')  String? imageUrl,  List<ServicePreviewResponseModel> servicePreviews)?  $default,) {final _that = this;
switch (_that) {
case _ServiceCategoryModel() when $default != null:
return $default(_that.id,_that.name,_that.servicesCount,_that.imageUrl,_that.servicePreviews);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServiceCategoryModel implements ServiceCategoryModel {
  const _ServiceCategoryModel({required this.id, required this.name, required this.servicesCount, @JsonKey(name: 'image_url') this.imageUrl, final  List<ServicePreviewResponseModel> servicePreviews = const []}): _servicePreviews = servicePreviews;
  factory _ServiceCategoryModel.fromJson(Map<String, dynamic> json) => _$ServiceCategoryModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  int servicesCount;
@override@JsonKey(name: 'image_url') final  String? imageUrl;
 final  List<ServicePreviewResponseModel> _servicePreviews;
@override@JsonKey() List<ServicePreviewResponseModel> get servicePreviews {
  if (_servicePreviews is EqualUnmodifiableListView) return _servicePreviews;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_servicePreviews);
}


/// Create a copy of ServiceCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceCategoryModelCopyWith<_ServiceCategoryModel> get copyWith => __$ServiceCategoryModelCopyWithImpl<_ServiceCategoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServiceCategoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceCategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.servicesCount, servicesCount) || other.servicesCount == servicesCount)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&const DeepCollectionEquality().equals(other._servicePreviews, _servicePreviews));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,servicesCount,imageUrl,const DeepCollectionEquality().hash(_servicePreviews));

@override
String toString() {
  return 'ServiceCategoryModel(id: $id, name: $name, servicesCount: $servicesCount, imageUrl: $imageUrl, servicePreviews: $servicePreviews)';
}


}

/// @nodoc
abstract mixin class _$ServiceCategoryModelCopyWith<$Res> implements $ServiceCategoryModelCopyWith<$Res> {
  factory _$ServiceCategoryModelCopyWith(_ServiceCategoryModel value, $Res Function(_ServiceCategoryModel) _then) = __$ServiceCategoryModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, int servicesCount,@JsonKey(name: 'image_url') String? imageUrl, List<ServicePreviewResponseModel> servicePreviews
});




}
/// @nodoc
class __$ServiceCategoryModelCopyWithImpl<$Res>
    implements _$ServiceCategoryModelCopyWith<$Res> {
  __$ServiceCategoryModelCopyWithImpl(this._self, this._then);

  final _ServiceCategoryModel _self;
  final $Res Function(_ServiceCategoryModel) _then;

/// Create a copy of ServiceCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? servicesCount = null,Object? imageUrl = freezed,Object? servicePreviews = null,}) {
  return _then(_ServiceCategoryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,servicesCount: null == servicesCount ? _self.servicesCount : servicesCount // ignore: cast_nullable_to_non_nullable
as int,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,servicePreviews: null == servicePreviews ? _self._servicePreviews : servicePreviews // ignore: cast_nullable_to_non_nullable
as List<ServicePreviewResponseModel>,
  ));
}


}

// dart format on
