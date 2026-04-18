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

 int get id; String get documentId; InfoModel get info; int get servicesCount; List<ServicePreviewResponseModel> get services;
/// Create a copy of ServiceCategoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceCategoryModelCopyWith<ServiceCategoryModel> get copyWith => _$ServiceCategoryModelCopyWithImpl<ServiceCategoryModel>(this as ServiceCategoryModel, _$identity);

  /// Serializes this ServiceCategoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceCategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.documentId, documentId) || other.documentId == documentId)&&(identical(other.info, info) || other.info == info)&&(identical(other.servicesCount, servicesCount) || other.servicesCount == servicesCount)&&const DeepCollectionEquality().equals(other.services, services));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,documentId,info,servicesCount,const DeepCollectionEquality().hash(services));

@override
String toString() {
  return 'ServiceCategoryModel(id: $id, documentId: $documentId, info: $info, servicesCount: $servicesCount, services: $services)';
}


}

/// @nodoc
abstract mixin class $ServiceCategoryModelCopyWith<$Res>  {
  factory $ServiceCategoryModelCopyWith(ServiceCategoryModel value, $Res Function(ServiceCategoryModel) _then) = _$ServiceCategoryModelCopyWithImpl;
@useResult
$Res call({
 int id, String documentId, InfoModel info, int servicesCount, List<ServicePreviewResponseModel> services
});


$InfoModelCopyWith<$Res> get info;

}
/// @nodoc
class _$ServiceCategoryModelCopyWithImpl<$Res>
    implements $ServiceCategoryModelCopyWith<$Res> {
  _$ServiceCategoryModelCopyWithImpl(this._self, this._then);

  final ServiceCategoryModel _self;
  final $Res Function(ServiceCategoryModel) _then;

/// Create a copy of ServiceCategoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? documentId = null,Object? info = null,Object? servicesCount = null,Object? services = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,documentId: null == documentId ? _self.documentId : documentId // ignore: cast_nullable_to_non_nullable
as String,info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as InfoModel,servicesCount: null == servicesCount ? _self.servicesCount : servicesCount // ignore: cast_nullable_to_non_nullable
as int,services: null == services ? _self.services : services // ignore: cast_nullable_to_non_nullable
as List<ServicePreviewResponseModel>,
  ));
}
/// Create a copy of ServiceCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InfoModelCopyWith<$Res> get info {
  
  return $InfoModelCopyWith<$Res>(_self.info, (value) {
    return _then(_self.copyWith(info: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String documentId,  InfoModel info,  int servicesCount,  List<ServicePreviewResponseModel> services)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceCategoryModel() when $default != null:
return $default(_that.id,_that.documentId,_that.info,_that.servicesCount,_that.services);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String documentId,  InfoModel info,  int servicesCount,  List<ServicePreviewResponseModel> services)  $default,) {final _that = this;
switch (_that) {
case _ServiceCategoryModel():
return $default(_that.id,_that.documentId,_that.info,_that.servicesCount,_that.services);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String documentId,  InfoModel info,  int servicesCount,  List<ServicePreviewResponseModel> services)?  $default,) {final _that = this;
switch (_that) {
case _ServiceCategoryModel() when $default != null:
return $default(_that.id,_that.documentId,_that.info,_that.servicesCount,_that.services);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServiceCategoryModel implements ServiceCategoryModel {
  const _ServiceCategoryModel({required this.id, required this.documentId, required this.info, this.servicesCount = 0, final  List<ServicePreviewResponseModel> services = const []}): _services = services;
  factory _ServiceCategoryModel.fromJson(Map<String, dynamic> json) => _$ServiceCategoryModelFromJson(json);

@override final  int id;
@override final  String documentId;
@override final  InfoModel info;
@override@JsonKey() final  int servicesCount;
 final  List<ServicePreviewResponseModel> _services;
@override@JsonKey() List<ServicePreviewResponseModel> get services {
  if (_services is EqualUnmodifiableListView) return _services;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_services);
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceCategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.documentId, documentId) || other.documentId == documentId)&&(identical(other.info, info) || other.info == info)&&(identical(other.servicesCount, servicesCount) || other.servicesCount == servicesCount)&&const DeepCollectionEquality().equals(other._services, _services));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,documentId,info,servicesCount,const DeepCollectionEquality().hash(_services));

@override
String toString() {
  return 'ServiceCategoryModel(id: $id, documentId: $documentId, info: $info, servicesCount: $servicesCount, services: $services)';
}


}

/// @nodoc
abstract mixin class _$ServiceCategoryModelCopyWith<$Res> implements $ServiceCategoryModelCopyWith<$Res> {
  factory _$ServiceCategoryModelCopyWith(_ServiceCategoryModel value, $Res Function(_ServiceCategoryModel) _then) = __$ServiceCategoryModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String documentId, InfoModel info, int servicesCount, List<ServicePreviewResponseModel> services
});


@override $InfoModelCopyWith<$Res> get info;

}
/// @nodoc
class __$ServiceCategoryModelCopyWithImpl<$Res>
    implements _$ServiceCategoryModelCopyWith<$Res> {
  __$ServiceCategoryModelCopyWithImpl(this._self, this._then);

  final _ServiceCategoryModel _self;
  final $Res Function(_ServiceCategoryModel) _then;

/// Create a copy of ServiceCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? documentId = null,Object? info = null,Object? servicesCount = null,Object? services = null,}) {
  return _then(_ServiceCategoryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,documentId: null == documentId ? _self.documentId : documentId // ignore: cast_nullable_to_non_nullable
as String,info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as InfoModel,servicesCount: null == servicesCount ? _self.servicesCount : servicesCount // ignore: cast_nullable_to_non_nullable
as int,services: null == services ? _self._services : services // ignore: cast_nullable_to_non_nullable
as List<ServicePreviewResponseModel>,
  ));
}

/// Create a copy of ServiceCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InfoModelCopyWith<$Res> get info {
  
  return $InfoModelCopyWith<$Res>(_self.info, (value) {
    return _then(_self.copyWith(info: value));
  });
}
}

// dart format on
