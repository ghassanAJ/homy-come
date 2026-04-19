// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_model_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookingModelResponse {

 int get id;@JsonKey(name: 'service_type') String get serviceType; String get status; ProviderModel get provider; String get date; String get time; String get address;
/// Create a copy of BookingModelResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingModelResponseCopyWith<BookingModelResponse> get copyWith => _$BookingModelResponseCopyWithImpl<BookingModelResponse>(this as BookingModelResponse, _$identity);

  /// Serializes this BookingModelResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingModelResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.serviceType, serviceType) || other.serviceType == serviceType)&&(identical(other.status, status) || other.status == status)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,serviceType,status,provider,date,time,address);

@override
String toString() {
  return 'BookingModelResponse(id: $id, serviceType: $serviceType, status: $status, provider: $provider, date: $date, time: $time, address: $address)';
}


}

/// @nodoc
abstract mixin class $BookingModelResponseCopyWith<$Res>  {
  factory $BookingModelResponseCopyWith(BookingModelResponse value, $Res Function(BookingModelResponse) _then) = _$BookingModelResponseCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'service_type') String serviceType, String status, ProviderModel provider, String date, String time, String address
});


$ProviderModelCopyWith<$Res> get provider;

}
/// @nodoc
class _$BookingModelResponseCopyWithImpl<$Res>
    implements $BookingModelResponseCopyWith<$Res> {
  _$BookingModelResponseCopyWithImpl(this._self, this._then);

  final BookingModelResponse _self;
  final $Res Function(BookingModelResponse) _then;

/// Create a copy of BookingModelResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? serviceType = null,Object? status = null,Object? provider = null,Object? date = null,Object? time = null,Object? address = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,serviceType: null == serviceType ? _self.serviceType : serviceType // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as ProviderModel,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of BookingModelResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProviderModelCopyWith<$Res> get provider {
  
  return $ProviderModelCopyWith<$Res>(_self.provider, (value) {
    return _then(_self.copyWith(provider: value));
  });
}
}


/// Adds pattern-matching-related methods to [BookingModelResponse].
extension BookingModelResponsePatterns on BookingModelResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingModelResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingModelResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingModelResponse value)  $default,){
final _that = this;
switch (_that) {
case _BookingModelResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingModelResponse value)?  $default,){
final _that = this;
switch (_that) {
case _BookingModelResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'service_type')  String serviceType,  String status,  ProviderModel provider,  String date,  String time,  String address)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingModelResponse() when $default != null:
return $default(_that.id,_that.serviceType,_that.status,_that.provider,_that.date,_that.time,_that.address);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'service_type')  String serviceType,  String status,  ProviderModel provider,  String date,  String time,  String address)  $default,) {final _that = this;
switch (_that) {
case _BookingModelResponse():
return $default(_that.id,_that.serviceType,_that.status,_that.provider,_that.date,_that.time,_that.address);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'service_type')  String serviceType,  String status,  ProviderModel provider,  String date,  String time,  String address)?  $default,) {final _that = this;
switch (_that) {
case _BookingModelResponse() when $default != null:
return $default(_that.id,_that.serviceType,_that.status,_that.provider,_that.date,_that.time,_that.address);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookingModelResponse implements BookingModelResponse {
   _BookingModelResponse({required this.id, @JsonKey(name: 'service_type') required this.serviceType, required this.status, required this.provider, required this.date, required this.time, required this.address});
  factory _BookingModelResponse.fromJson(Map<String, dynamic> json) => _$BookingModelResponseFromJson(json);

@override final  int id;
@override@JsonKey(name: 'service_type') final  String serviceType;
@override final  String status;
@override final  ProviderModel provider;
@override final  String date;
@override final  String time;
@override final  String address;

/// Create a copy of BookingModelResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingModelResponseCopyWith<_BookingModelResponse> get copyWith => __$BookingModelResponseCopyWithImpl<_BookingModelResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookingModelResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingModelResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.serviceType, serviceType) || other.serviceType == serviceType)&&(identical(other.status, status) || other.status == status)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,serviceType,status,provider,date,time,address);

@override
String toString() {
  return 'BookingModelResponse(id: $id, serviceType: $serviceType, status: $status, provider: $provider, date: $date, time: $time, address: $address)';
}


}

/// @nodoc
abstract mixin class _$BookingModelResponseCopyWith<$Res> implements $BookingModelResponseCopyWith<$Res> {
  factory _$BookingModelResponseCopyWith(_BookingModelResponse value, $Res Function(_BookingModelResponse) _then) = __$BookingModelResponseCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'service_type') String serviceType, String status, ProviderModel provider, String date, String time, String address
});


@override $ProviderModelCopyWith<$Res> get provider;

}
/// @nodoc
class __$BookingModelResponseCopyWithImpl<$Res>
    implements _$BookingModelResponseCopyWith<$Res> {
  __$BookingModelResponseCopyWithImpl(this._self, this._then);

  final _BookingModelResponse _self;
  final $Res Function(_BookingModelResponse) _then;

/// Create a copy of BookingModelResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? serviceType = null,Object? status = null,Object? provider = null,Object? date = null,Object? time = null,Object? address = null,}) {
  return _then(_BookingModelResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,serviceType: null == serviceType ? _self.serviceType : serviceType // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as ProviderModel,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of BookingModelResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProviderModelCopyWith<$Res> get provider {
  
  return $ProviderModelCopyWith<$Res>(_self.provider, (value) {
    return _then(_self.copyWith(provider: value));
  });
}
}


/// @nodoc
mixin _$ProviderModel {

 int get id; String get name; double get rating; String get numberPhone; String? get image;
/// Create a copy of ProviderModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProviderModelCopyWith<ProviderModel> get copyWith => _$ProviderModelCopyWithImpl<ProviderModel>(this as ProviderModel, _$identity);

  /// Serializes this ProviderModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProviderModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.numberPhone, numberPhone) || other.numberPhone == numberPhone)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,rating,numberPhone,image);

@override
String toString() {
  return 'ProviderModel(id: $id, name: $name, rating: $rating, numberPhone: $numberPhone, image: $image)';
}


}

/// @nodoc
abstract mixin class $ProviderModelCopyWith<$Res>  {
  factory $ProviderModelCopyWith(ProviderModel value, $Res Function(ProviderModel) _then) = _$ProviderModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, double rating, String numberPhone, String? image
});




}
/// @nodoc
class _$ProviderModelCopyWithImpl<$Res>
    implements $ProviderModelCopyWith<$Res> {
  _$ProviderModelCopyWithImpl(this._self, this._then);

  final ProviderModel _self;
  final $Res Function(ProviderModel) _then;

/// Create a copy of ProviderModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? rating = null,Object? numberPhone = null,Object? image = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,numberPhone: null == numberPhone ? _self.numberPhone : numberPhone // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProviderModel].
extension ProviderModelPatterns on ProviderModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProviderModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProviderModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProviderModel value)  $default,){
final _that = this;
switch (_that) {
case _ProviderModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProviderModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProviderModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  double rating,  String numberPhone,  String? image)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProviderModel() when $default != null:
return $default(_that.id,_that.name,_that.rating,_that.numberPhone,_that.image);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  double rating,  String numberPhone,  String? image)  $default,) {final _that = this;
switch (_that) {
case _ProviderModel():
return $default(_that.id,_that.name,_that.rating,_that.numberPhone,_that.image);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  double rating,  String numberPhone,  String? image)?  $default,) {final _that = this;
switch (_that) {
case _ProviderModel() when $default != null:
return $default(_that.id,_that.name,_that.rating,_that.numberPhone,_that.image);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProviderModel implements ProviderModel {
  const _ProviderModel({required this.id, required this.name, required this.rating, required this.numberPhone, this.image});
  factory _ProviderModel.fromJson(Map<String, dynamic> json) => _$ProviderModelFromJson(json);

@override final  int id;
@override final  String name;
@override final  double rating;
@override final  String numberPhone;
@override final  String? image;

/// Create a copy of ProviderModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProviderModelCopyWith<_ProviderModel> get copyWith => __$ProviderModelCopyWithImpl<_ProviderModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProviderModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProviderModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.numberPhone, numberPhone) || other.numberPhone == numberPhone)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,rating,numberPhone,image);

@override
String toString() {
  return 'ProviderModel(id: $id, name: $name, rating: $rating, numberPhone: $numberPhone, image: $image)';
}


}

/// @nodoc
abstract mixin class _$ProviderModelCopyWith<$Res> implements $ProviderModelCopyWith<$Res> {
  factory _$ProviderModelCopyWith(_ProviderModel value, $Res Function(_ProviderModel) _then) = __$ProviderModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, double rating, String numberPhone, String? image
});




}
/// @nodoc
class __$ProviderModelCopyWithImpl<$Res>
    implements _$ProviderModelCopyWith<$Res> {
  __$ProviderModelCopyWithImpl(this._self, this._then);

  final _ProviderModel _self;
  final $Res Function(_ProviderModel) _then;

/// Create a copy of ProviderModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? rating = null,Object? numberPhone = null,Object? image = freezed,}) {
  return _then(_ProviderModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,numberPhone: null == numberPhone ? _self.numberPhone : numberPhone // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$BookingDetailseModelResponse {

 int get id;@JsonKey(name: 'service_type') String get serviceType; String get status; ProviderModel get provider; String get date; String get time; String get address; int get workingHour; int get servicesCharge; int get deepCleaning;
/// Create a copy of BookingDetailseModelResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingDetailseModelResponseCopyWith<BookingDetailseModelResponse> get copyWith => _$BookingDetailseModelResponseCopyWithImpl<BookingDetailseModelResponse>(this as BookingDetailseModelResponse, _$identity);

  /// Serializes this BookingDetailseModelResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingDetailseModelResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.serviceType, serviceType) || other.serviceType == serviceType)&&(identical(other.status, status) || other.status == status)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.address, address) || other.address == address)&&(identical(other.workingHour, workingHour) || other.workingHour == workingHour)&&(identical(other.servicesCharge, servicesCharge) || other.servicesCharge == servicesCharge)&&(identical(other.deepCleaning, deepCleaning) || other.deepCleaning == deepCleaning));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,serviceType,status,provider,date,time,address,workingHour,servicesCharge,deepCleaning);

@override
String toString() {
  return 'BookingDetailseModelResponse(id: $id, serviceType: $serviceType, status: $status, provider: $provider, date: $date, time: $time, address: $address, workingHour: $workingHour, servicesCharge: $servicesCharge, deepCleaning: $deepCleaning)';
}


}

/// @nodoc
abstract mixin class $BookingDetailseModelResponseCopyWith<$Res>  {
  factory $BookingDetailseModelResponseCopyWith(BookingDetailseModelResponse value, $Res Function(BookingDetailseModelResponse) _then) = _$BookingDetailseModelResponseCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'service_type') String serviceType, String status, ProviderModel provider, String date, String time, String address, int workingHour, int servicesCharge, int deepCleaning
});


$ProviderModelCopyWith<$Res> get provider;

}
/// @nodoc
class _$BookingDetailseModelResponseCopyWithImpl<$Res>
    implements $BookingDetailseModelResponseCopyWith<$Res> {
  _$BookingDetailseModelResponseCopyWithImpl(this._self, this._then);

  final BookingDetailseModelResponse _self;
  final $Res Function(BookingDetailseModelResponse) _then;

/// Create a copy of BookingDetailseModelResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? serviceType = null,Object? status = null,Object? provider = null,Object? date = null,Object? time = null,Object? address = null,Object? workingHour = null,Object? servicesCharge = null,Object? deepCleaning = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,serviceType: null == serviceType ? _self.serviceType : serviceType // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as ProviderModel,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,workingHour: null == workingHour ? _self.workingHour : workingHour // ignore: cast_nullable_to_non_nullable
as int,servicesCharge: null == servicesCharge ? _self.servicesCharge : servicesCharge // ignore: cast_nullable_to_non_nullable
as int,deepCleaning: null == deepCleaning ? _self.deepCleaning : deepCleaning // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of BookingDetailseModelResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProviderModelCopyWith<$Res> get provider {
  
  return $ProviderModelCopyWith<$Res>(_self.provider, (value) {
    return _then(_self.copyWith(provider: value));
  });
}
}


/// Adds pattern-matching-related methods to [BookingDetailseModelResponse].
extension BookingDetailseModelResponsePatterns on BookingDetailseModelResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingDetailseModelResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingDetailseModelResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingDetailseModelResponse value)  $default,){
final _that = this;
switch (_that) {
case _BookingDetailseModelResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingDetailseModelResponse value)?  $default,){
final _that = this;
switch (_that) {
case _BookingDetailseModelResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'service_type')  String serviceType,  String status,  ProviderModel provider,  String date,  String time,  String address,  int workingHour,  int servicesCharge,  int deepCleaning)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingDetailseModelResponse() when $default != null:
return $default(_that.id,_that.serviceType,_that.status,_that.provider,_that.date,_that.time,_that.address,_that.workingHour,_that.servicesCharge,_that.deepCleaning);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'service_type')  String serviceType,  String status,  ProviderModel provider,  String date,  String time,  String address,  int workingHour,  int servicesCharge,  int deepCleaning)  $default,) {final _that = this;
switch (_that) {
case _BookingDetailseModelResponse():
return $default(_that.id,_that.serviceType,_that.status,_that.provider,_that.date,_that.time,_that.address,_that.workingHour,_that.servicesCharge,_that.deepCleaning);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'service_type')  String serviceType,  String status,  ProviderModel provider,  String date,  String time,  String address,  int workingHour,  int servicesCharge,  int deepCleaning)?  $default,) {final _that = this;
switch (_that) {
case _BookingDetailseModelResponse() when $default != null:
return $default(_that.id,_that.serviceType,_that.status,_that.provider,_that.date,_that.time,_that.address,_that.workingHour,_that.servicesCharge,_that.deepCleaning);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookingDetailseModelResponse implements BookingDetailseModelResponse {
  const _BookingDetailseModelResponse({required this.id, @JsonKey(name: 'service_type') required this.serviceType, required this.status, required this.provider, required this.date, required this.time, required this.address, required this.workingHour, required this.servicesCharge, required this.deepCleaning});
  factory _BookingDetailseModelResponse.fromJson(Map<String, dynamic> json) => _$BookingDetailseModelResponseFromJson(json);

@override final  int id;
@override@JsonKey(name: 'service_type') final  String serviceType;
@override final  String status;
@override final  ProviderModel provider;
@override final  String date;
@override final  String time;
@override final  String address;
@override final  int workingHour;
@override final  int servicesCharge;
@override final  int deepCleaning;

/// Create a copy of BookingDetailseModelResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingDetailseModelResponseCopyWith<_BookingDetailseModelResponse> get copyWith => __$BookingDetailseModelResponseCopyWithImpl<_BookingDetailseModelResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookingDetailseModelResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingDetailseModelResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.serviceType, serviceType) || other.serviceType == serviceType)&&(identical(other.status, status) || other.status == status)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.address, address) || other.address == address)&&(identical(other.workingHour, workingHour) || other.workingHour == workingHour)&&(identical(other.servicesCharge, servicesCharge) || other.servicesCharge == servicesCharge)&&(identical(other.deepCleaning, deepCleaning) || other.deepCleaning == deepCleaning));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,serviceType,status,provider,date,time,address,workingHour,servicesCharge,deepCleaning);

@override
String toString() {
  return 'BookingDetailseModelResponse(id: $id, serviceType: $serviceType, status: $status, provider: $provider, date: $date, time: $time, address: $address, workingHour: $workingHour, servicesCharge: $servicesCharge, deepCleaning: $deepCleaning)';
}


}

/// @nodoc
abstract mixin class _$BookingDetailseModelResponseCopyWith<$Res> implements $BookingDetailseModelResponseCopyWith<$Res> {
  factory _$BookingDetailseModelResponseCopyWith(_BookingDetailseModelResponse value, $Res Function(_BookingDetailseModelResponse) _then) = __$BookingDetailseModelResponseCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'service_type') String serviceType, String status, ProviderModel provider, String date, String time, String address, int workingHour, int servicesCharge, int deepCleaning
});


@override $ProviderModelCopyWith<$Res> get provider;

}
/// @nodoc
class __$BookingDetailseModelResponseCopyWithImpl<$Res>
    implements _$BookingDetailseModelResponseCopyWith<$Res> {
  __$BookingDetailseModelResponseCopyWithImpl(this._self, this._then);

  final _BookingDetailseModelResponse _self;
  final $Res Function(_BookingDetailseModelResponse) _then;

/// Create a copy of BookingDetailseModelResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? serviceType = null,Object? status = null,Object? provider = null,Object? date = null,Object? time = null,Object? address = null,Object? workingHour = null,Object? servicesCharge = null,Object? deepCleaning = null,}) {
  return _then(_BookingDetailseModelResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,serviceType: null == serviceType ? _self.serviceType : serviceType // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as ProviderModel,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,workingHour: null == workingHour ? _self.workingHour : workingHour // ignore: cast_nullable_to_non_nullable
as int,servicesCharge: null == servicesCharge ? _self.servicesCharge : servicesCharge // ignore: cast_nullable_to_non_nullable
as int,deepCleaning: null == deepCleaning ? _self.deepCleaning : deepCleaning // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of BookingDetailseModelResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProviderModelCopyWith<$Res> get provider {
  
  return $ProviderModelCopyWith<$Res>(_self.provider, (value) {
    return _then(_self.copyWith(provider: value));
  });
}
}

// dart format on
