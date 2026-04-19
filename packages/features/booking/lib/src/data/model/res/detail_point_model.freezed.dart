// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_point_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DetailPointModel {

 String? get id; String? get text;
/// Create a copy of DetailPointModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetailPointModelCopyWith<DetailPointModel> get copyWith => _$DetailPointModelCopyWithImpl<DetailPointModel>(this as DetailPointModel, _$identity);

  /// Serializes this DetailPointModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetailPointModel&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,text);

@override
String toString() {
  return 'DetailPointModel(id: $id, text: $text)';
}


}

/// @nodoc
abstract mixin class $DetailPointModelCopyWith<$Res>  {
  factory $DetailPointModelCopyWith(DetailPointModel value, $Res Function(DetailPointModel) _then) = _$DetailPointModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? text
});




}
/// @nodoc
class _$DetailPointModelCopyWithImpl<$Res>
    implements $DetailPointModelCopyWith<$Res> {
  _$DetailPointModelCopyWithImpl(this._self, this._then);

  final DetailPointModel _self;
  final $Res Function(DetailPointModel) _then;

/// Create a copy of DetailPointModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? text = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DetailPointModel].
extension DetailPointModelPatterns on DetailPointModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DetailPointModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DetailPointModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DetailPointModel value)  $default,){
final _that = this;
switch (_that) {
case _DetailPointModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DetailPointModel value)?  $default,){
final _that = this;
switch (_that) {
case _DetailPointModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? text)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DetailPointModel() when $default != null:
return $default(_that.id,_that.text);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? text)  $default,) {final _that = this;
switch (_that) {
case _DetailPointModel():
return $default(_that.id,_that.text);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? text)?  $default,) {final _that = this;
switch (_that) {
case _DetailPointModel() when $default != null:
return $default(_that.id,_that.text);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DetailPointModel implements DetailPointModel {
  const _DetailPointModel({this.id, this.text});
  factory _DetailPointModel.fromJson(Map<String, dynamic> json) => _$DetailPointModelFromJson(json);

@override final  String? id;
@override final  String? text;

/// Create a copy of DetailPointModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetailPointModelCopyWith<_DetailPointModel> get copyWith => __$DetailPointModelCopyWithImpl<_DetailPointModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DetailPointModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DetailPointModel&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,text);

@override
String toString() {
  return 'DetailPointModel(id: $id, text: $text)';
}


}

/// @nodoc
abstract mixin class _$DetailPointModelCopyWith<$Res> implements $DetailPointModelCopyWith<$Res> {
  factory _$DetailPointModelCopyWith(_DetailPointModel value, $Res Function(_DetailPointModel) _then) = __$DetailPointModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? text
});




}
/// @nodoc
class __$DetailPointModelCopyWithImpl<$Res>
    implements _$DetailPointModelCopyWith<$Res> {
  __$DetailPointModelCopyWithImpl(this._self, this._then);

  final _DetailPointModel _self;
  final $Res Function(_DetailPointModel) _then;

/// Create a copy of DetailPointModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? text = freezed,}) {
  return _then(_DetailPointModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
