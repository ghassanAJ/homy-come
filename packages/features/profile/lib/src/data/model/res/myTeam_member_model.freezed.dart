// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'myTeam_member_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MyteamMemberModel {

 int get id;@JsonKey(name: 'name_member') String get nameMember; String get phone; String get imageUrl; dynamic get status;
/// Create a copy of MyteamMemberModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyteamMemberModelCopyWith<MyteamMemberModel> get copyWith => _$MyteamMemberModelCopyWithImpl<MyteamMemberModel>(this as MyteamMemberModel, _$identity);

  /// Serializes this MyteamMemberModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyteamMemberModel&&(identical(other.id, id) || other.id == id)&&(identical(other.nameMember, nameMember) || other.nameMember == nameMember)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&const DeepCollectionEquality().equals(other.status, status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nameMember,phone,imageUrl,const DeepCollectionEquality().hash(status));

@override
String toString() {
  return 'MyteamMemberModel(id: $id, nameMember: $nameMember, phone: $phone, imageUrl: $imageUrl, status: $status)';
}


}

/// @nodoc
abstract mixin class $MyteamMemberModelCopyWith<$Res>  {
  factory $MyteamMemberModelCopyWith(MyteamMemberModel value, $Res Function(MyteamMemberModel) _then) = _$MyteamMemberModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'name_member') String nameMember, String phone, String imageUrl, dynamic status
});




}
/// @nodoc
class _$MyteamMemberModelCopyWithImpl<$Res>
    implements $MyteamMemberModelCopyWith<$Res> {
  _$MyteamMemberModelCopyWithImpl(this._self, this._then);

  final MyteamMemberModel _self;
  final $Res Function(MyteamMemberModel) _then;

/// Create a copy of MyteamMemberModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? nameMember = null,Object? phone = null,Object? imageUrl = null,Object? status = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,nameMember: null == nameMember ? _self.nameMember : nameMember // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// Adds pattern-matching-related methods to [MyteamMemberModel].
extension MyteamMemberModelPatterns on MyteamMemberModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyteamMemberModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyteamMemberModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyteamMemberModel value)  $default,){
final _that = this;
switch (_that) {
case _MyteamMemberModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyteamMemberModel value)?  $default,){
final _that = this;
switch (_that) {
case _MyteamMemberModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'name_member')  String nameMember,  String phone,  String imageUrl,  dynamic status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyteamMemberModel() when $default != null:
return $default(_that.id,_that.nameMember,_that.phone,_that.imageUrl,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'name_member')  String nameMember,  String phone,  String imageUrl,  dynamic status)  $default,) {final _that = this;
switch (_that) {
case _MyteamMemberModel():
return $default(_that.id,_that.nameMember,_that.phone,_that.imageUrl,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'name_member')  String nameMember,  String phone,  String imageUrl,  dynamic status)?  $default,) {final _that = this;
switch (_that) {
case _MyteamMemberModel() when $default != null:
return $default(_that.id,_that.nameMember,_that.phone,_that.imageUrl,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MyteamMemberModel implements MyteamMemberModel {
   _MyteamMemberModel({required this.id, @JsonKey(name: 'name_member') required this.nameMember, required this.phone, required this.imageUrl, required this.status});
  factory _MyteamMemberModel.fromJson(Map<String, dynamic> json) => _$MyteamMemberModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'name_member') final  String nameMember;
@override final  String phone;
@override final  String imageUrl;
@override final  dynamic status;

/// Create a copy of MyteamMemberModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyteamMemberModelCopyWith<_MyteamMemberModel> get copyWith => __$MyteamMemberModelCopyWithImpl<_MyteamMemberModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MyteamMemberModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyteamMemberModel&&(identical(other.id, id) || other.id == id)&&(identical(other.nameMember, nameMember) || other.nameMember == nameMember)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&const DeepCollectionEquality().equals(other.status, status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nameMember,phone,imageUrl,const DeepCollectionEquality().hash(status));

@override
String toString() {
  return 'MyteamMemberModel(id: $id, nameMember: $nameMember, phone: $phone, imageUrl: $imageUrl, status: $status)';
}


}

/// @nodoc
abstract mixin class _$MyteamMemberModelCopyWith<$Res> implements $MyteamMemberModelCopyWith<$Res> {
  factory _$MyteamMemberModelCopyWith(_MyteamMemberModel value, $Res Function(_MyteamMemberModel) _then) = __$MyteamMemberModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'name_member') String nameMember, String phone, String imageUrl, dynamic status
});




}
/// @nodoc
class __$MyteamMemberModelCopyWithImpl<$Res>
    implements _$MyteamMemberModelCopyWith<$Res> {
  __$MyteamMemberModelCopyWithImpl(this._self, this._then);

  final _MyteamMemberModel _self;
  final $Res Function(_MyteamMemberModel) _then;

/// Create a copy of MyteamMemberModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? nameMember = null,Object? phone = null,Object? imageUrl = null,Object? status = freezed,}) {
  return _then(_MyteamMemberModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,nameMember: null == nameMember ? _self.nameMember : nameMember // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

// dart format on
