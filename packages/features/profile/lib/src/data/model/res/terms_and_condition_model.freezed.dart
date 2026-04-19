// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'terms_and_condition_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TermsAndConditionModel {

 String get description;
/// Create a copy of TermsAndConditionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TermsAndConditionModelCopyWith<TermsAndConditionModel> get copyWith => _$TermsAndConditionModelCopyWithImpl<TermsAndConditionModel>(this as TermsAndConditionModel, _$identity);

  /// Serializes this TermsAndConditionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TermsAndConditionModel&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,description);

@override
String toString() {
  return 'TermsAndConditionModel(description: $description)';
}


}

/// @nodoc
abstract mixin class $TermsAndConditionModelCopyWith<$Res>  {
  factory $TermsAndConditionModelCopyWith(TermsAndConditionModel value, $Res Function(TermsAndConditionModel) _then) = _$TermsAndConditionModelCopyWithImpl;
@useResult
$Res call({
 String description
});




}
/// @nodoc
class _$TermsAndConditionModelCopyWithImpl<$Res>
    implements $TermsAndConditionModelCopyWith<$Res> {
  _$TermsAndConditionModelCopyWithImpl(this._self, this._then);

  final TermsAndConditionModel _self;
  final $Res Function(TermsAndConditionModel) _then;

/// Create a copy of TermsAndConditionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? description = null,}) {
  return _then(_self.copyWith(
description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TermsAndConditionModel].
extension TermsAndConditionModelPatterns on TermsAndConditionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TermsAndConditionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TermsAndConditionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TermsAndConditionModel value)  $default,){
final _that = this;
switch (_that) {
case _TermsAndConditionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TermsAndConditionModel value)?  $default,){
final _that = this;
switch (_that) {
case _TermsAndConditionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TermsAndConditionModel() when $default != null:
return $default(_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String description)  $default,) {final _that = this;
switch (_that) {
case _TermsAndConditionModel():
return $default(_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String description)?  $default,) {final _that = this;
switch (_that) {
case _TermsAndConditionModel() when $default != null:
return $default(_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TermsAndConditionModel implements TermsAndConditionModel {
  const _TermsAndConditionModel({this.description = ''});
  factory _TermsAndConditionModel.fromJson(Map<String, dynamic> json) => _$TermsAndConditionModelFromJson(json);

@override@JsonKey() final  String description;

/// Create a copy of TermsAndConditionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TermsAndConditionModelCopyWith<_TermsAndConditionModel> get copyWith => __$TermsAndConditionModelCopyWithImpl<_TermsAndConditionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TermsAndConditionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TermsAndConditionModel&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,description);

@override
String toString() {
  return 'TermsAndConditionModel(description: $description)';
}


}

/// @nodoc
abstract mixin class _$TermsAndConditionModelCopyWith<$Res> implements $TermsAndConditionModelCopyWith<$Res> {
  factory _$TermsAndConditionModelCopyWith(_TermsAndConditionModel value, $Res Function(_TermsAndConditionModel) _then) = __$TermsAndConditionModelCopyWithImpl;
@override @useResult
$Res call({
 String description
});




}
/// @nodoc
class __$TermsAndConditionModelCopyWithImpl<$Res>
    implements _$TermsAndConditionModelCopyWith<$Res> {
  __$TermsAndConditionModelCopyWithImpl(this._self, this._then);

  final _TermsAndConditionModel _self;
  final $Res Function(_TermsAndConditionModel) _then;

/// Create a copy of TermsAndConditionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? description = null,}) {
  return _then(_TermsAndConditionModel(
description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
