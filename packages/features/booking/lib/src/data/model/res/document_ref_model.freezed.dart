// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'document_ref_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DocumentRefModel {

 String? get id;@JsonKey(name: 'documentId') String? get documentId;
/// Create a copy of DocumentRefModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DocumentRefModelCopyWith<DocumentRefModel> get copyWith => _$DocumentRefModelCopyWithImpl<DocumentRefModel>(this as DocumentRefModel, _$identity);

  /// Serializes this DocumentRefModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentRefModel&&(identical(other.id, id) || other.id == id)&&(identical(other.documentId, documentId) || other.documentId == documentId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,documentId);

@override
String toString() {
  return 'DocumentRefModel(id: $id, documentId: $documentId)';
}


}

/// @nodoc
abstract mixin class $DocumentRefModelCopyWith<$Res>  {
  factory $DocumentRefModelCopyWith(DocumentRefModel value, $Res Function(DocumentRefModel) _then) = _$DocumentRefModelCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'documentId') String? documentId
});




}
/// @nodoc
class _$DocumentRefModelCopyWithImpl<$Res>
    implements $DocumentRefModelCopyWith<$Res> {
  _$DocumentRefModelCopyWithImpl(this._self, this._then);

  final DocumentRefModel _self;
  final $Res Function(DocumentRefModel) _then;

/// Create a copy of DocumentRefModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? documentId = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,documentId: freezed == documentId ? _self.documentId : documentId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DocumentRefModel].
extension DocumentRefModelPatterns on DocumentRefModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DocumentRefModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DocumentRefModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DocumentRefModel value)  $default,){
final _that = this;
switch (_that) {
case _DocumentRefModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DocumentRefModel value)?  $default,){
final _that = this;
switch (_that) {
case _DocumentRefModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'documentId')  String? documentId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DocumentRefModel() when $default != null:
return $default(_that.id,_that.documentId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'documentId')  String? documentId)  $default,) {final _that = this;
switch (_that) {
case _DocumentRefModel():
return $default(_that.id,_that.documentId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'documentId')  String? documentId)?  $default,) {final _that = this;
switch (_that) {
case _DocumentRefModel() when $default != null:
return $default(_that.id,_that.documentId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DocumentRefModel implements DocumentRefModel {
  const _DocumentRefModel({this.id, @JsonKey(name: 'documentId') this.documentId});
  factory _DocumentRefModel.fromJson(Map<String, dynamic> json) => _$DocumentRefModelFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'documentId') final  String? documentId;

/// Create a copy of DocumentRefModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DocumentRefModelCopyWith<_DocumentRefModel> get copyWith => __$DocumentRefModelCopyWithImpl<_DocumentRefModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DocumentRefModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DocumentRefModel&&(identical(other.id, id) || other.id == id)&&(identical(other.documentId, documentId) || other.documentId == documentId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,documentId);

@override
String toString() {
  return 'DocumentRefModel(id: $id, documentId: $documentId)';
}


}

/// @nodoc
abstract mixin class _$DocumentRefModelCopyWith<$Res> implements $DocumentRefModelCopyWith<$Res> {
  factory _$DocumentRefModelCopyWith(_DocumentRefModel value, $Res Function(_DocumentRefModel) _then) = __$DocumentRefModelCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'documentId') String? documentId
});




}
/// @nodoc
class __$DocumentRefModelCopyWithImpl<$Res>
    implements _$DocumentRefModelCopyWith<$Res> {
  __$DocumentRefModelCopyWithImpl(this._self, this._then);

  final _DocumentRefModel _self;
  final $Res Function(_DocumentRefModel) _then;

/// Create a copy of DocumentRefModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? documentId = freezed,}) {
  return _then(_DocumentRefModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,documentId: freezed == documentId ? _self.documentId : documentId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
