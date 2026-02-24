// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_section_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServiceSectionModel {

 String get title;@JsonKey(name: 'banner_image_url') String? get bannerImageUrl; List<ServiceOptionModel> get options;
/// Create a copy of ServiceSectionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceSectionModelCopyWith<ServiceSectionModel> get copyWith => _$ServiceSectionModelCopyWithImpl<ServiceSectionModel>(this as ServiceSectionModel, _$identity);

  /// Serializes this ServiceSectionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceSectionModel&&(identical(other.title, title) || other.title == title)&&(identical(other.bannerImageUrl, bannerImageUrl) || other.bannerImageUrl == bannerImageUrl)&&const DeepCollectionEquality().equals(other.options, options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,bannerImageUrl,const DeepCollectionEquality().hash(options));

@override
String toString() {
  return 'ServiceSectionModel(title: $title, bannerImageUrl: $bannerImageUrl, options: $options)';
}


}

/// @nodoc
abstract mixin class $ServiceSectionModelCopyWith<$Res>  {
  factory $ServiceSectionModelCopyWith(ServiceSectionModel value, $Res Function(ServiceSectionModel) _then) = _$ServiceSectionModelCopyWithImpl;
@useResult
$Res call({
 String title,@JsonKey(name: 'banner_image_url') String? bannerImageUrl, List<ServiceOptionModel> options
});




}
/// @nodoc
class _$ServiceSectionModelCopyWithImpl<$Res>
    implements $ServiceSectionModelCopyWith<$Res> {
  _$ServiceSectionModelCopyWithImpl(this._self, this._then);

  final ServiceSectionModel _self;
  final $Res Function(ServiceSectionModel) _then;

/// Create a copy of ServiceSectionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? bannerImageUrl = freezed,Object? options = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,bannerImageUrl: freezed == bannerImageUrl ? _self.bannerImageUrl : bannerImageUrl // ignore: cast_nullable_to_non_nullable
as String?,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<ServiceOptionModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [ServiceSectionModel].
extension ServiceSectionModelPatterns on ServiceSectionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceSectionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceSectionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceSectionModel value)  $default,){
final _that = this;
switch (_that) {
case _ServiceSectionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceSectionModel value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceSectionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title, @JsonKey(name: 'banner_image_url')  String? bannerImageUrl,  List<ServiceOptionModel> options)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceSectionModel() when $default != null:
return $default(_that.title,_that.bannerImageUrl,_that.options);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title, @JsonKey(name: 'banner_image_url')  String? bannerImageUrl,  List<ServiceOptionModel> options)  $default,) {final _that = this;
switch (_that) {
case _ServiceSectionModel():
return $default(_that.title,_that.bannerImageUrl,_that.options);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title, @JsonKey(name: 'banner_image_url')  String? bannerImageUrl,  List<ServiceOptionModel> options)?  $default,) {final _that = this;
switch (_that) {
case _ServiceSectionModel() when $default != null:
return $default(_that.title,_that.bannerImageUrl,_that.options);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServiceSectionModel implements ServiceSectionModel {
  const _ServiceSectionModel({required this.title, @JsonKey(name: 'banner_image_url') this.bannerImageUrl, final  List<ServiceOptionModel> options = const []}): _options = options;
  factory _ServiceSectionModel.fromJson(Map<String, dynamic> json) => _$ServiceSectionModelFromJson(json);

@override final  String title;
@override@JsonKey(name: 'banner_image_url') final  String? bannerImageUrl;
 final  List<ServiceOptionModel> _options;
@override@JsonKey() List<ServiceOptionModel> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}


/// Create a copy of ServiceSectionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceSectionModelCopyWith<_ServiceSectionModel> get copyWith => __$ServiceSectionModelCopyWithImpl<_ServiceSectionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServiceSectionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceSectionModel&&(identical(other.title, title) || other.title == title)&&(identical(other.bannerImageUrl, bannerImageUrl) || other.bannerImageUrl == bannerImageUrl)&&const DeepCollectionEquality().equals(other._options, _options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,bannerImageUrl,const DeepCollectionEquality().hash(_options));

@override
String toString() {
  return 'ServiceSectionModel(title: $title, bannerImageUrl: $bannerImageUrl, options: $options)';
}


}

/// @nodoc
abstract mixin class _$ServiceSectionModelCopyWith<$Res> implements $ServiceSectionModelCopyWith<$Res> {
  factory _$ServiceSectionModelCopyWith(_ServiceSectionModel value, $Res Function(_ServiceSectionModel) _then) = __$ServiceSectionModelCopyWithImpl;
@override @useResult
$Res call({
 String title,@JsonKey(name: 'banner_image_url') String? bannerImageUrl, List<ServiceOptionModel> options
});




}
/// @nodoc
class __$ServiceSectionModelCopyWithImpl<$Res>
    implements _$ServiceSectionModelCopyWith<$Res> {
  __$ServiceSectionModelCopyWithImpl(this._self, this._then);

  final _ServiceSectionModel _self;
  final $Res Function(_ServiceSectionModel) _then;

/// Create a copy of ServiceSectionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? bannerImageUrl = freezed,Object? options = null,}) {
  return _then(_ServiceSectionModel(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,bannerImageUrl: freezed == bannerImageUrl ? _self.bannerImageUrl : bannerImageUrl // ignore: cast_nullable_to_non_nullable
as String?,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<ServiceOptionModel>,
  ));
}


}

// dart format on
