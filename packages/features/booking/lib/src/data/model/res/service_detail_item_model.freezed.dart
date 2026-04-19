// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_detail_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
ServiceDetailsModel _$ServiceDetailsModelFromJson(
  Map<String, dynamic> json
) {
    return _ServiceDetailItemModel.fromJson(
      json
    );
}

/// @nodoc
mixin _$ServiceDetailsModel {

 int? get id; String? get title; List<DetailPointModel> get points;
/// Create a copy of ServiceDetailsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceDetailsModelCopyWith<ServiceDetailsModel> get copyWith => _$ServiceDetailsModelCopyWithImpl<ServiceDetailsModel>(this as ServiceDetailsModel, _$identity);

  /// Serializes this ServiceDetailsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceDetailsModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.points, points));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,const DeepCollectionEquality().hash(points));

@override
String toString() {
  return 'ServiceDetailsModel(id: $id, title: $title, points: $points)';
}


}

/// @nodoc
abstract mixin class $ServiceDetailsModelCopyWith<$Res>  {
  factory $ServiceDetailsModelCopyWith(ServiceDetailsModel value, $Res Function(ServiceDetailsModel) _then) = _$ServiceDetailsModelCopyWithImpl;
@useResult
$Res call({
 int? id, String? title, List<DetailPointModel> points
});




}
/// @nodoc
class _$ServiceDetailsModelCopyWithImpl<$Res>
    implements $ServiceDetailsModelCopyWith<$Res> {
  _$ServiceDetailsModelCopyWithImpl(this._self, this._then);

  final ServiceDetailsModel _self;
  final $Res Function(ServiceDetailsModel) _then;

/// Create a copy of ServiceDetailsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = freezed,Object? points = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as List<DetailPointModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [ServiceDetailsModel].
extension ServiceDetailsModelPatterns on ServiceDetailsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceDetailItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceDetailItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceDetailItemModel value)  $default,){
final _that = this;
switch (_that) {
case _ServiceDetailItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceDetailItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceDetailItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? title,  List<DetailPointModel> points)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceDetailItemModel() when $default != null:
return $default(_that.id,_that.title,_that.points);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? title,  List<DetailPointModel> points)  $default,) {final _that = this;
switch (_that) {
case _ServiceDetailItemModel():
return $default(_that.id,_that.title,_that.points);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? title,  List<DetailPointModel> points)?  $default,) {final _that = this;
switch (_that) {
case _ServiceDetailItemModel() when $default != null:
return $default(_that.id,_that.title,_that.points);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServiceDetailItemModel implements ServiceDetailsModel {
  const _ServiceDetailItemModel({this.id, this.title, final  List<DetailPointModel> points = const []}): _points = points;
  factory _ServiceDetailItemModel.fromJson(Map<String, dynamic> json) => _$ServiceDetailItemModelFromJson(json);

@override final  int? id;
@override final  String? title;
 final  List<DetailPointModel> _points;
@override@JsonKey() List<DetailPointModel> get points {
  if (_points is EqualUnmodifiableListView) return _points;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_points);
}


/// Create a copy of ServiceDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceDetailItemModelCopyWith<_ServiceDetailItemModel> get copyWith => __$ServiceDetailItemModelCopyWithImpl<_ServiceDetailItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServiceDetailItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceDetailItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._points, _points));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,const DeepCollectionEquality().hash(_points));

@override
String toString() {
  return 'ServiceDetailsModel(id: $id, title: $title, points: $points)';
}


}

/// @nodoc
abstract mixin class _$ServiceDetailItemModelCopyWith<$Res> implements $ServiceDetailsModelCopyWith<$Res> {
  factory _$ServiceDetailItemModelCopyWith(_ServiceDetailItemModel value, $Res Function(_ServiceDetailItemModel) _then) = __$ServiceDetailItemModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? title, List<DetailPointModel> points
});




}
/// @nodoc
class __$ServiceDetailItemModelCopyWithImpl<$Res>
    implements _$ServiceDetailItemModelCopyWith<$Res> {
  __$ServiceDetailItemModelCopyWithImpl(this._self, this._then);

  final _ServiceDetailItemModel _self;
  final $Res Function(_ServiceDetailItemModel) _then;

/// Create a copy of ServiceDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = freezed,Object? points = null,}) {
  return _then(_ServiceDetailItemModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,points: null == points ? _self._points : points // ignore: cast_nullable_to_non_nullable
as List<DetailPointModel>,
  ));
}


}

// dart format on
