// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'addon_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddOnCategoryModel {

 String get id; String get documentId; List<AddOnServiceModel> get services; InfoModel? get info;
/// Create a copy of AddOnCategoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddOnCategoryModelCopyWith<AddOnCategoryModel> get copyWith => _$AddOnCategoryModelCopyWithImpl<AddOnCategoryModel>(this as AddOnCategoryModel, _$identity);

  /// Serializes this AddOnCategoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddOnCategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.documentId, documentId) || other.documentId == documentId)&&const DeepCollectionEquality().equals(other.services, services)&&(identical(other.info, info) || other.info == info));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,documentId,const DeepCollectionEquality().hash(services),info);

@override
String toString() {
  return 'AddOnCategoryModel(id: $id, documentId: $documentId, services: $services, info: $info)';
}


}

/// @nodoc
abstract mixin class $AddOnCategoryModelCopyWith<$Res>  {
  factory $AddOnCategoryModelCopyWith(AddOnCategoryModel value, $Res Function(AddOnCategoryModel) _then) = _$AddOnCategoryModelCopyWithImpl;
@useResult
$Res call({
 String id, String documentId, List<AddOnServiceModel> services, InfoModel? info
});


$InfoModelCopyWith<$Res>? get info;

}
/// @nodoc
class _$AddOnCategoryModelCopyWithImpl<$Res>
    implements $AddOnCategoryModelCopyWith<$Res> {
  _$AddOnCategoryModelCopyWithImpl(this._self, this._then);

  final AddOnCategoryModel _self;
  final $Res Function(AddOnCategoryModel) _then;

/// Create a copy of AddOnCategoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? documentId = null,Object? services = null,Object? info = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,documentId: null == documentId ? _self.documentId : documentId // ignore: cast_nullable_to_non_nullable
as String,services: null == services ? _self.services : services // ignore: cast_nullable_to_non_nullable
as List<AddOnServiceModel>,info: freezed == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as InfoModel?,
  ));
}
/// Create a copy of AddOnCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InfoModelCopyWith<$Res>? get info {
    if (_self.info == null) {
    return null;
  }

  return $InfoModelCopyWith<$Res>(_self.info!, (value) {
    return _then(_self.copyWith(info: value));
  });
}
}


/// Adds pattern-matching-related methods to [AddOnCategoryModel].
extension AddOnCategoryModelPatterns on AddOnCategoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddOnCategoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddOnCategoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddOnCategoryModel value)  $default,){
final _that = this;
switch (_that) {
case _AddOnCategoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddOnCategoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _AddOnCategoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String documentId,  List<AddOnServiceModel> services,  InfoModel? info)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddOnCategoryModel() when $default != null:
return $default(_that.id,_that.documentId,_that.services,_that.info);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String documentId,  List<AddOnServiceModel> services,  InfoModel? info)  $default,) {final _that = this;
switch (_that) {
case _AddOnCategoryModel():
return $default(_that.id,_that.documentId,_that.services,_that.info);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String documentId,  List<AddOnServiceModel> services,  InfoModel? info)?  $default,) {final _that = this;
switch (_that) {
case _AddOnCategoryModel() when $default != null:
return $default(_that.id,_that.documentId,_that.services,_that.info);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AddOnCategoryModel implements AddOnCategoryModel {
  const _AddOnCategoryModel({required this.id, required this.documentId, final  List<AddOnServiceModel> services = const [], this.info}): _services = services;
  factory _AddOnCategoryModel.fromJson(Map<String, dynamic> json) => _$AddOnCategoryModelFromJson(json);

@override final  String id;
@override final  String documentId;
 final  List<AddOnServiceModel> _services;
@override@JsonKey() List<AddOnServiceModel> get services {
  if (_services is EqualUnmodifiableListView) return _services;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_services);
}

@override final  InfoModel? info;

/// Create a copy of AddOnCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddOnCategoryModelCopyWith<_AddOnCategoryModel> get copyWith => __$AddOnCategoryModelCopyWithImpl<_AddOnCategoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddOnCategoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddOnCategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.documentId, documentId) || other.documentId == documentId)&&const DeepCollectionEquality().equals(other._services, _services)&&(identical(other.info, info) || other.info == info));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,documentId,const DeepCollectionEquality().hash(_services),info);

@override
String toString() {
  return 'AddOnCategoryModel(id: $id, documentId: $documentId, services: $services, info: $info)';
}


}

/// @nodoc
abstract mixin class _$AddOnCategoryModelCopyWith<$Res> implements $AddOnCategoryModelCopyWith<$Res> {
  factory _$AddOnCategoryModelCopyWith(_AddOnCategoryModel value, $Res Function(_AddOnCategoryModel) _then) = __$AddOnCategoryModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String documentId, List<AddOnServiceModel> services, InfoModel? info
});


@override $InfoModelCopyWith<$Res>? get info;

}
/// @nodoc
class __$AddOnCategoryModelCopyWithImpl<$Res>
    implements _$AddOnCategoryModelCopyWith<$Res> {
  __$AddOnCategoryModelCopyWithImpl(this._self, this._then);

  final _AddOnCategoryModel _self;
  final $Res Function(_AddOnCategoryModel) _then;

/// Create a copy of AddOnCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? documentId = null,Object? services = null,Object? info = freezed,}) {
  return _then(_AddOnCategoryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,documentId: null == documentId ? _self.documentId : documentId // ignore: cast_nullable_to_non_nullable
as String,services: null == services ? _self._services : services // ignore: cast_nullable_to_non_nullable
as List<AddOnServiceModel>,info: freezed == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as InfoModel?,
  ));
}

/// Create a copy of AddOnCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InfoModelCopyWith<$Res>? get info {
    if (_self.info == null) {
    return null;
  }

  return $InfoModelCopyWith<$Res>(_self.info!, (value) {
    return _then(_self.copyWith(info: value));
  });
}
}

// dart format on
