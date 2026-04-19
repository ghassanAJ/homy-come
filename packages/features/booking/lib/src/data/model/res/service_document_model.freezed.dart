// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_document_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
AddOnServiceModel _$AddOnServiceModelFromJson(
  Map<String, dynamic> json
) {
    return _ServiceDocumentModel.fromJson(
      json
    );
}

/// @nodoc
mixin _$AddOnServiceModel {

 int get id; String get documentId;@JsonKey(name: 'duration_minutes') int get durationMinutes; InfoModel get info; ServicePriceModel get price; List<ServiceDetailsModel> get details;
/// Create a copy of AddOnServiceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddOnServiceModelCopyWith<AddOnServiceModel> get copyWith => _$AddOnServiceModelCopyWithImpl<AddOnServiceModel>(this as AddOnServiceModel, _$identity);

  /// Serializes this AddOnServiceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddOnServiceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.documentId, documentId) || other.documentId == documentId)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.info, info) || other.info == info)&&(identical(other.price, price) || other.price == price)&&const DeepCollectionEquality().equals(other.details, details));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,documentId,durationMinutes,info,price,const DeepCollectionEquality().hash(details));

@override
String toString() {
  return 'AddOnServiceModel(id: $id, documentId: $documentId, durationMinutes: $durationMinutes, info: $info, price: $price, details: $details)';
}


}

/// @nodoc
abstract mixin class $AddOnServiceModelCopyWith<$Res>  {
  factory $AddOnServiceModelCopyWith(AddOnServiceModel value, $Res Function(AddOnServiceModel) _then) = _$AddOnServiceModelCopyWithImpl;
@useResult
$Res call({
 int id, String documentId,@JsonKey(name: 'duration_minutes') int durationMinutes, InfoModel info, ServicePriceModel price, List<ServiceDetailsModel> details
});


$InfoModelCopyWith<$Res> get info;$ServicePriceModelCopyWith<$Res> get price;

}
/// @nodoc
class _$AddOnServiceModelCopyWithImpl<$Res>
    implements $AddOnServiceModelCopyWith<$Res> {
  _$AddOnServiceModelCopyWithImpl(this._self, this._then);

  final AddOnServiceModel _self;
  final $Res Function(AddOnServiceModel) _then;

/// Create a copy of AddOnServiceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? documentId = null,Object? durationMinutes = null,Object? info = null,Object? price = null,Object? details = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,documentId: null == documentId ? _self.documentId : documentId // ignore: cast_nullable_to_non_nullable
as String,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int,info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as InfoModel,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as ServicePriceModel,details: null == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as List<ServiceDetailsModel>,
  ));
}
/// Create a copy of AddOnServiceModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InfoModelCopyWith<$Res> get info {
  
  return $InfoModelCopyWith<$Res>(_self.info, (value) {
    return _then(_self.copyWith(info: value));
  });
}/// Create a copy of AddOnServiceModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ServicePriceModelCopyWith<$Res> get price {
  
  return $ServicePriceModelCopyWith<$Res>(_self.price, (value) {
    return _then(_self.copyWith(price: value));
  });
}
}


/// Adds pattern-matching-related methods to [AddOnServiceModel].
extension AddOnServiceModelPatterns on AddOnServiceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceDocumentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceDocumentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceDocumentModel value)  $default,){
final _that = this;
switch (_that) {
case _ServiceDocumentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceDocumentModel value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceDocumentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String documentId, @JsonKey(name: 'duration_minutes')  int durationMinutes,  InfoModel info,  ServicePriceModel price,  List<ServiceDetailsModel> details)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceDocumentModel() when $default != null:
return $default(_that.id,_that.documentId,_that.durationMinutes,_that.info,_that.price,_that.details);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String documentId, @JsonKey(name: 'duration_minutes')  int durationMinutes,  InfoModel info,  ServicePriceModel price,  List<ServiceDetailsModel> details)  $default,) {final _that = this;
switch (_that) {
case _ServiceDocumentModel():
return $default(_that.id,_that.documentId,_that.durationMinutes,_that.info,_that.price,_that.details);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String documentId, @JsonKey(name: 'duration_minutes')  int durationMinutes,  InfoModel info,  ServicePriceModel price,  List<ServiceDetailsModel> details)?  $default,) {final _that = this;
switch (_that) {
case _ServiceDocumentModel() when $default != null:
return $default(_that.id,_that.documentId,_that.durationMinutes,_that.info,_that.price,_that.details);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServiceDocumentModel implements AddOnServiceModel {
  const _ServiceDocumentModel({required this.id, required this.documentId, @JsonKey(name: 'duration_minutes') required this.durationMinutes, required this.info, required this.price, final  List<ServiceDetailsModel> details = const []}): _details = details;
  factory _ServiceDocumentModel.fromJson(Map<String, dynamic> json) => _$ServiceDocumentModelFromJson(json);

@override final  int id;
@override final  String documentId;
@override@JsonKey(name: 'duration_minutes') final  int durationMinutes;
@override final  InfoModel info;
@override final  ServicePriceModel price;
 final  List<ServiceDetailsModel> _details;
@override@JsonKey() List<ServiceDetailsModel> get details {
  if (_details is EqualUnmodifiableListView) return _details;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_details);
}


/// Create a copy of AddOnServiceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceDocumentModelCopyWith<_ServiceDocumentModel> get copyWith => __$ServiceDocumentModelCopyWithImpl<_ServiceDocumentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServiceDocumentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceDocumentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.documentId, documentId) || other.documentId == documentId)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.info, info) || other.info == info)&&(identical(other.price, price) || other.price == price)&&const DeepCollectionEquality().equals(other._details, _details));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,documentId,durationMinutes,info,price,const DeepCollectionEquality().hash(_details));

@override
String toString() {
  return 'AddOnServiceModel(id: $id, documentId: $documentId, durationMinutes: $durationMinutes, info: $info, price: $price, details: $details)';
}


}

/// @nodoc
abstract mixin class _$ServiceDocumentModelCopyWith<$Res> implements $AddOnServiceModelCopyWith<$Res> {
  factory _$ServiceDocumentModelCopyWith(_ServiceDocumentModel value, $Res Function(_ServiceDocumentModel) _then) = __$ServiceDocumentModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String documentId,@JsonKey(name: 'duration_minutes') int durationMinutes, InfoModel info, ServicePriceModel price, List<ServiceDetailsModel> details
});


@override $InfoModelCopyWith<$Res> get info;@override $ServicePriceModelCopyWith<$Res> get price;

}
/// @nodoc
class __$ServiceDocumentModelCopyWithImpl<$Res>
    implements _$ServiceDocumentModelCopyWith<$Res> {
  __$ServiceDocumentModelCopyWithImpl(this._self, this._then);

  final _ServiceDocumentModel _self;
  final $Res Function(_ServiceDocumentModel) _then;

/// Create a copy of AddOnServiceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? documentId = null,Object? durationMinutes = null,Object? info = null,Object? price = null,Object? details = null,}) {
  return _then(_ServiceDocumentModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,documentId: null == documentId ? _self.documentId : documentId // ignore: cast_nullable_to_non_nullable
as String,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int,info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as InfoModel,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as ServicePriceModel,details: null == details ? _self._details : details // ignore: cast_nullable_to_non_nullable
as List<ServiceDetailsModel>,
  ));
}

/// Create a copy of AddOnServiceModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InfoModelCopyWith<$Res> get info {
  
  return $InfoModelCopyWith<$Res>(_self.info, (value) {
    return _then(_self.copyWith(info: value));
  });
}/// Create a copy of AddOnServiceModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ServicePriceModelCopyWith<$Res> get price {
  
  return $ServicePriceModelCopyWith<$Res>(_self.price, (value) {
    return _then(_self.copyWith(price: value));
  });
}
}

// dart format on
