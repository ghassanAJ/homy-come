// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_booking_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateBookingResponseModel {

@JsonKey(name: 'scheduled_at') DateTime get scheduledAt;@JsonKey(name: 'duration_minutes') int get durationMinutes;@JsonKey(name: 'final_price') double get finalPrice;@JsonKey(name: 'commission_amount') double get commissionAmount;@JsonKey(name: 'provider_earning') double get providerEarning; String get status; String get service;@JsonKey(name: 'add_ons') List<String> get addOns; String get customer; BookingAddressModel get address; List<String> get providers;@JsonKey(name: 'need_cleaning_materials') bool get needCleaningMaterials;@JsonKey(name: 'specifc_instructions') String? get specificInstructions;
/// Create a copy of CreateBookingResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateBookingResponseModelCopyWith<CreateBookingResponseModel> get copyWith => _$CreateBookingResponseModelCopyWithImpl<CreateBookingResponseModel>(this as CreateBookingResponseModel, _$identity);

  /// Serializes this CreateBookingResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateBookingResponseModel&&(identical(other.scheduledAt, scheduledAt) || other.scheduledAt == scheduledAt)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.finalPrice, finalPrice) || other.finalPrice == finalPrice)&&(identical(other.commissionAmount, commissionAmount) || other.commissionAmount == commissionAmount)&&(identical(other.providerEarning, providerEarning) || other.providerEarning == providerEarning)&&(identical(other.status, status) || other.status == status)&&(identical(other.service, service) || other.service == service)&&const DeepCollectionEquality().equals(other.addOns, addOns)&&(identical(other.customer, customer) || other.customer == customer)&&(identical(other.address, address) || other.address == address)&&const DeepCollectionEquality().equals(other.providers, providers)&&(identical(other.needCleaningMaterials, needCleaningMaterials) || other.needCleaningMaterials == needCleaningMaterials)&&(identical(other.specificInstructions, specificInstructions) || other.specificInstructions == specificInstructions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,scheduledAt,durationMinutes,finalPrice,commissionAmount,providerEarning,status,service,const DeepCollectionEquality().hash(addOns),customer,address,const DeepCollectionEquality().hash(providers),needCleaningMaterials,specificInstructions);

@override
String toString() {
  return 'CreateBookingResponseModel(scheduledAt: $scheduledAt, durationMinutes: $durationMinutes, finalPrice: $finalPrice, commissionAmount: $commissionAmount, providerEarning: $providerEarning, status: $status, service: $service, addOns: $addOns, customer: $customer, address: $address, providers: $providers, needCleaningMaterials: $needCleaningMaterials, specificInstructions: $specificInstructions)';
}


}

/// @nodoc
abstract mixin class $CreateBookingResponseModelCopyWith<$Res>  {
  factory $CreateBookingResponseModelCopyWith(CreateBookingResponseModel value, $Res Function(CreateBookingResponseModel) _then) = _$CreateBookingResponseModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'scheduled_at') DateTime scheduledAt,@JsonKey(name: 'duration_minutes') int durationMinutes,@JsonKey(name: 'final_price') double finalPrice,@JsonKey(name: 'commission_amount') double commissionAmount,@JsonKey(name: 'provider_earning') double providerEarning, String status, String service,@JsonKey(name: 'add_ons') List<String> addOns, String customer, BookingAddressModel address, List<String> providers,@JsonKey(name: 'need_cleaning_materials') bool needCleaningMaterials,@JsonKey(name: 'specifc_instructions') String? specificInstructions
});


$BookingAddressModelCopyWith<$Res> get address;

}
/// @nodoc
class _$CreateBookingResponseModelCopyWithImpl<$Res>
    implements $CreateBookingResponseModelCopyWith<$Res> {
  _$CreateBookingResponseModelCopyWithImpl(this._self, this._then);

  final CreateBookingResponseModel _self;
  final $Res Function(CreateBookingResponseModel) _then;

/// Create a copy of CreateBookingResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? scheduledAt = null,Object? durationMinutes = null,Object? finalPrice = null,Object? commissionAmount = null,Object? providerEarning = null,Object? status = null,Object? service = null,Object? addOns = null,Object? customer = null,Object? address = null,Object? providers = null,Object? needCleaningMaterials = null,Object? specificInstructions = freezed,}) {
  return _then(_self.copyWith(
scheduledAt: null == scheduledAt ? _self.scheduledAt : scheduledAt // ignore: cast_nullable_to_non_nullable
as DateTime,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int,finalPrice: null == finalPrice ? _self.finalPrice : finalPrice // ignore: cast_nullable_to_non_nullable
as double,commissionAmount: null == commissionAmount ? _self.commissionAmount : commissionAmount // ignore: cast_nullable_to_non_nullable
as double,providerEarning: null == providerEarning ? _self.providerEarning : providerEarning // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,service: null == service ? _self.service : service // ignore: cast_nullable_to_non_nullable
as String,addOns: null == addOns ? _self.addOns : addOns // ignore: cast_nullable_to_non_nullable
as List<String>,customer: null == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as BookingAddressModel,providers: null == providers ? _self.providers : providers // ignore: cast_nullable_to_non_nullable
as List<String>,needCleaningMaterials: null == needCleaningMaterials ? _self.needCleaningMaterials : needCleaningMaterials // ignore: cast_nullable_to_non_nullable
as bool,specificInstructions: freezed == specificInstructions ? _self.specificInstructions : specificInstructions // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of CreateBookingResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingAddressModelCopyWith<$Res> get address {
  
  return $BookingAddressModelCopyWith<$Res>(_self.address, (value) {
    return _then(_self.copyWith(address: value));
  });
}
}


/// Adds pattern-matching-related methods to [CreateBookingResponseModel].
extension CreateBookingResponseModelPatterns on CreateBookingResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateBookingResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateBookingResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateBookingResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _CreateBookingResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateBookingResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _CreateBookingResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'scheduled_at')  DateTime scheduledAt, @JsonKey(name: 'duration_minutes')  int durationMinutes, @JsonKey(name: 'final_price')  double finalPrice, @JsonKey(name: 'commission_amount')  double commissionAmount, @JsonKey(name: 'provider_earning')  double providerEarning,  String status,  String service, @JsonKey(name: 'add_ons')  List<String> addOns,  String customer,  BookingAddressModel address,  List<String> providers, @JsonKey(name: 'need_cleaning_materials')  bool needCleaningMaterials, @JsonKey(name: 'specifc_instructions')  String? specificInstructions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateBookingResponseModel() when $default != null:
return $default(_that.scheduledAt,_that.durationMinutes,_that.finalPrice,_that.commissionAmount,_that.providerEarning,_that.status,_that.service,_that.addOns,_that.customer,_that.address,_that.providers,_that.needCleaningMaterials,_that.specificInstructions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'scheduled_at')  DateTime scheduledAt, @JsonKey(name: 'duration_minutes')  int durationMinutes, @JsonKey(name: 'final_price')  double finalPrice, @JsonKey(name: 'commission_amount')  double commissionAmount, @JsonKey(name: 'provider_earning')  double providerEarning,  String status,  String service, @JsonKey(name: 'add_ons')  List<String> addOns,  String customer,  BookingAddressModel address,  List<String> providers, @JsonKey(name: 'need_cleaning_materials')  bool needCleaningMaterials, @JsonKey(name: 'specifc_instructions')  String? specificInstructions)  $default,) {final _that = this;
switch (_that) {
case _CreateBookingResponseModel():
return $default(_that.scheduledAt,_that.durationMinutes,_that.finalPrice,_that.commissionAmount,_that.providerEarning,_that.status,_that.service,_that.addOns,_that.customer,_that.address,_that.providers,_that.needCleaningMaterials,_that.specificInstructions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'scheduled_at')  DateTime scheduledAt, @JsonKey(name: 'duration_minutes')  int durationMinutes, @JsonKey(name: 'final_price')  double finalPrice, @JsonKey(name: 'commission_amount')  double commissionAmount, @JsonKey(name: 'provider_earning')  double providerEarning,  String status,  String service, @JsonKey(name: 'add_ons')  List<String> addOns,  String customer,  BookingAddressModel address,  List<String> providers, @JsonKey(name: 'need_cleaning_materials')  bool needCleaningMaterials, @JsonKey(name: 'specifc_instructions')  String? specificInstructions)?  $default,) {final _that = this;
switch (_that) {
case _CreateBookingResponseModel() when $default != null:
return $default(_that.scheduledAt,_that.durationMinutes,_that.finalPrice,_that.commissionAmount,_that.providerEarning,_that.status,_that.service,_that.addOns,_that.customer,_that.address,_that.providers,_that.needCleaningMaterials,_that.specificInstructions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateBookingResponseModel implements CreateBookingResponseModel {
  const _CreateBookingResponseModel({@JsonKey(name: 'scheduled_at') required this.scheduledAt, @JsonKey(name: 'duration_minutes') required this.durationMinutes, @JsonKey(name: 'final_price') required this.finalPrice, @JsonKey(name: 'commission_amount') required this.commissionAmount, @JsonKey(name: 'provider_earning') required this.providerEarning, required this.status, required this.service, @JsonKey(name: 'add_ons') required final  List<String> addOns, required this.customer, required this.address, required final  List<String> providers, @JsonKey(name: 'need_cleaning_materials') required this.needCleaningMaterials, @JsonKey(name: 'specifc_instructions') this.specificInstructions}): _addOns = addOns,_providers = providers;
  factory _CreateBookingResponseModel.fromJson(Map<String, dynamic> json) => _$CreateBookingResponseModelFromJson(json);

@override@JsonKey(name: 'scheduled_at') final  DateTime scheduledAt;
@override@JsonKey(name: 'duration_minutes') final  int durationMinutes;
@override@JsonKey(name: 'final_price') final  double finalPrice;
@override@JsonKey(name: 'commission_amount') final  double commissionAmount;
@override@JsonKey(name: 'provider_earning') final  double providerEarning;
@override final  String status;
@override final  String service;
 final  List<String> _addOns;
@override@JsonKey(name: 'add_ons') List<String> get addOns {
  if (_addOns is EqualUnmodifiableListView) return _addOns;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_addOns);
}

@override final  String customer;
@override final  BookingAddressModel address;
 final  List<String> _providers;
@override List<String> get providers {
  if (_providers is EqualUnmodifiableListView) return _providers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_providers);
}

@override@JsonKey(name: 'need_cleaning_materials') final  bool needCleaningMaterials;
@override@JsonKey(name: 'specifc_instructions') final  String? specificInstructions;

/// Create a copy of CreateBookingResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateBookingResponseModelCopyWith<_CreateBookingResponseModel> get copyWith => __$CreateBookingResponseModelCopyWithImpl<_CreateBookingResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateBookingResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateBookingResponseModel&&(identical(other.scheduledAt, scheduledAt) || other.scheduledAt == scheduledAt)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.finalPrice, finalPrice) || other.finalPrice == finalPrice)&&(identical(other.commissionAmount, commissionAmount) || other.commissionAmount == commissionAmount)&&(identical(other.providerEarning, providerEarning) || other.providerEarning == providerEarning)&&(identical(other.status, status) || other.status == status)&&(identical(other.service, service) || other.service == service)&&const DeepCollectionEquality().equals(other._addOns, _addOns)&&(identical(other.customer, customer) || other.customer == customer)&&(identical(other.address, address) || other.address == address)&&const DeepCollectionEquality().equals(other._providers, _providers)&&(identical(other.needCleaningMaterials, needCleaningMaterials) || other.needCleaningMaterials == needCleaningMaterials)&&(identical(other.specificInstructions, specificInstructions) || other.specificInstructions == specificInstructions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,scheduledAt,durationMinutes,finalPrice,commissionAmount,providerEarning,status,service,const DeepCollectionEquality().hash(_addOns),customer,address,const DeepCollectionEquality().hash(_providers),needCleaningMaterials,specificInstructions);

@override
String toString() {
  return 'CreateBookingResponseModel(scheduledAt: $scheduledAt, durationMinutes: $durationMinutes, finalPrice: $finalPrice, commissionAmount: $commissionAmount, providerEarning: $providerEarning, status: $status, service: $service, addOns: $addOns, customer: $customer, address: $address, providers: $providers, needCleaningMaterials: $needCleaningMaterials, specificInstructions: $specificInstructions)';
}


}

/// @nodoc
abstract mixin class _$CreateBookingResponseModelCopyWith<$Res> implements $CreateBookingResponseModelCopyWith<$Res> {
  factory _$CreateBookingResponseModelCopyWith(_CreateBookingResponseModel value, $Res Function(_CreateBookingResponseModel) _then) = __$CreateBookingResponseModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'scheduled_at') DateTime scheduledAt,@JsonKey(name: 'duration_minutes') int durationMinutes,@JsonKey(name: 'final_price') double finalPrice,@JsonKey(name: 'commission_amount') double commissionAmount,@JsonKey(name: 'provider_earning') double providerEarning, String status, String service,@JsonKey(name: 'add_ons') List<String> addOns, String customer, BookingAddressModel address, List<String> providers,@JsonKey(name: 'need_cleaning_materials') bool needCleaningMaterials,@JsonKey(name: 'specifc_instructions') String? specificInstructions
});


@override $BookingAddressModelCopyWith<$Res> get address;

}
/// @nodoc
class __$CreateBookingResponseModelCopyWithImpl<$Res>
    implements _$CreateBookingResponseModelCopyWith<$Res> {
  __$CreateBookingResponseModelCopyWithImpl(this._self, this._then);

  final _CreateBookingResponseModel _self;
  final $Res Function(_CreateBookingResponseModel) _then;

/// Create a copy of CreateBookingResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? scheduledAt = null,Object? durationMinutes = null,Object? finalPrice = null,Object? commissionAmount = null,Object? providerEarning = null,Object? status = null,Object? service = null,Object? addOns = null,Object? customer = null,Object? address = null,Object? providers = null,Object? needCleaningMaterials = null,Object? specificInstructions = freezed,}) {
  return _then(_CreateBookingResponseModel(
scheduledAt: null == scheduledAt ? _self.scheduledAt : scheduledAt // ignore: cast_nullable_to_non_nullable
as DateTime,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int,finalPrice: null == finalPrice ? _self.finalPrice : finalPrice // ignore: cast_nullable_to_non_nullable
as double,commissionAmount: null == commissionAmount ? _self.commissionAmount : commissionAmount // ignore: cast_nullable_to_non_nullable
as double,providerEarning: null == providerEarning ? _self.providerEarning : providerEarning // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,service: null == service ? _self.service : service // ignore: cast_nullable_to_non_nullable
as String,addOns: null == addOns ? _self._addOns : addOns // ignore: cast_nullable_to_non_nullable
as List<String>,customer: null == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as BookingAddressModel,providers: null == providers ? _self._providers : providers // ignore: cast_nullable_to_non_nullable
as List<String>,needCleaningMaterials: null == needCleaningMaterials ? _self.needCleaningMaterials : needCleaningMaterials // ignore: cast_nullable_to_non_nullable
as bool,specificInstructions: freezed == specificInstructions ? _self.specificInstructions : specificInstructions // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of CreateBookingResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingAddressModelCopyWith<$Res> get address {
  
  return $BookingAddressModelCopyWith<$Res>(_self.address, (value) {
    return _then(_self.copyWith(address: value));
  });
}
}

// dart format on
