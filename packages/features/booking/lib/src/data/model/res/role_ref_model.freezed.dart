// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'role_ref_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RoleRefModel {

 String? get id;@JsonKey(name: 'documentId') String? get documentId; String? get name; String? get code; String? get description;
/// Create a copy of RoleRefModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoleRefModelCopyWith<RoleRefModel> get copyWith => _$RoleRefModelCopyWithImpl<RoleRefModel>(this as RoleRefModel, _$identity);

  /// Serializes this RoleRefModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoleRefModel&&(identical(other.id, id) || other.id == id)&&(identical(other.documentId, documentId) || other.documentId == documentId)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,documentId,name,code,description);

@override
String toString() {
  return 'RoleRefModel(id: $id, documentId: $documentId, name: $name, code: $code, description: $description)';
}


}

/// @nodoc
abstract mixin class $RoleRefModelCopyWith<$Res>  {
  factory $RoleRefModelCopyWith(RoleRefModel value, $Res Function(RoleRefModel) _then) = _$RoleRefModelCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'documentId') String? documentId, String? name, String? code, String? description
});




}
/// @nodoc
class _$RoleRefModelCopyWithImpl<$Res>
    implements $RoleRefModelCopyWith<$Res> {
  _$RoleRefModelCopyWithImpl(this._self, this._then);

  final RoleRefModel _self;
  final $Res Function(RoleRefModel) _then;

/// Create a copy of RoleRefModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? documentId = freezed,Object? name = freezed,Object? code = freezed,Object? description = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,documentId: freezed == documentId ? _self.documentId : documentId // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RoleRefModel].
extension RoleRefModelPatterns on RoleRefModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoleRefModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoleRefModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoleRefModel value)  $default,){
final _that = this;
switch (_that) {
case _RoleRefModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoleRefModel value)?  $default,){
final _that = this;
switch (_that) {
case _RoleRefModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'documentId')  String? documentId,  String? name,  String? code,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoleRefModel() when $default != null:
return $default(_that.id,_that.documentId,_that.name,_that.code,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'documentId')  String? documentId,  String? name,  String? code,  String? description)  $default,) {final _that = this;
switch (_that) {
case _RoleRefModel():
return $default(_that.id,_that.documentId,_that.name,_that.code,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'documentId')  String? documentId,  String? name,  String? code,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _RoleRefModel() when $default != null:
return $default(_that.id,_that.documentId,_that.name,_that.code,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RoleRefModel implements RoleRefModel {
  const _RoleRefModel({this.id, @JsonKey(name: 'documentId') this.documentId, this.name, this.code, this.description});
  factory _RoleRefModel.fromJson(Map<String, dynamic> json) => _$RoleRefModelFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'documentId') final  String? documentId;
@override final  String? name;
@override final  String? code;
@override final  String? description;

/// Create a copy of RoleRefModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoleRefModelCopyWith<_RoleRefModel> get copyWith => __$RoleRefModelCopyWithImpl<_RoleRefModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoleRefModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoleRefModel&&(identical(other.id, id) || other.id == id)&&(identical(other.documentId, documentId) || other.documentId == documentId)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,documentId,name,code,description);

@override
String toString() {
  return 'RoleRefModel(id: $id, documentId: $documentId, name: $name, code: $code, description: $description)';
}


}

/// @nodoc
abstract mixin class _$RoleRefModelCopyWith<$Res> implements $RoleRefModelCopyWith<$Res> {
  factory _$RoleRefModelCopyWith(_RoleRefModel value, $Res Function(_RoleRefModel) _then) = __$RoleRefModelCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'documentId') String? documentId, String? name, String? code, String? description
});




}
/// @nodoc
class __$RoleRefModelCopyWithImpl<$Res>
    implements _$RoleRefModelCopyWith<$Res> {
  __$RoleRefModelCopyWithImpl(this._self, this._then);

  final _RoleRefModel _self;
  final $Res Function(_RoleRefModel) _then;

/// Create a copy of RoleRefModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? documentId = freezed,Object? name = freezed,Object? code = freezed,Object? description = freezed,}) {
  return _then(_RoleRefModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,documentId: freezed == documentId ? _self.documentId : documentId // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
