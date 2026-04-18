// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_wizard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BookingWizardState {

// ── Navigation ────────────────────────────────────────────────────────────
 BookingWizardStep get currentStep;// ── Step 0 – Service Details ──────────────────────────────────────────────
 ServiceDetailsResponseModel? get serviceDetails; bool get serviceDetailsLoading; APIException? get serviceDetailsError;// ── Step 1 – Booking Options ──────────────────────────────────────────────
 int get durationHours; double get total; double get totalAfterDiscount;/// Raw label stored ("One Professional", "2 to 4", etc.)
 String get professionalCount; bool get needCleaningMaterials; String get notes; String? get step1ValidationError;// ── Step 2 – Add-ons ──────────────────────────────────────────────────────
 List<AddOnServiceModel> get selectedAddOns; String? get step2ValidationError;// ── Step 3 – Date, Time & Provider ───────────────────────────────────────
 List<String> get selectedProviderIds; DateTime? get scheduledAt; String? get step3ValidationError;// ── Submission ────────────────────────────────────────────────────────────
 bool get isSubmitting; bool get submitSuccess; APIException? get submitError;
/// Create a copy of BookingWizardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingWizardStateCopyWith<BookingWizardState> get copyWith => _$BookingWizardStateCopyWithImpl<BookingWizardState>(this as BookingWizardState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingWizardState&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.serviceDetails, serviceDetails) || other.serviceDetails == serviceDetails)&&(identical(other.serviceDetailsLoading, serviceDetailsLoading) || other.serviceDetailsLoading == serviceDetailsLoading)&&(identical(other.serviceDetailsError, serviceDetailsError) || other.serviceDetailsError == serviceDetailsError)&&(identical(other.durationHours, durationHours) || other.durationHours == durationHours)&&(identical(other.total, total) || other.total == total)&&(identical(other.totalAfterDiscount, totalAfterDiscount) || other.totalAfterDiscount == totalAfterDiscount)&&(identical(other.professionalCount, professionalCount) || other.professionalCount == professionalCount)&&(identical(other.needCleaningMaterials, needCleaningMaterials) || other.needCleaningMaterials == needCleaningMaterials)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.step1ValidationError, step1ValidationError) || other.step1ValidationError == step1ValidationError)&&const DeepCollectionEquality().equals(other.selectedAddOns, selectedAddOns)&&(identical(other.step2ValidationError, step2ValidationError) || other.step2ValidationError == step2ValidationError)&&const DeepCollectionEquality().equals(other.selectedProviderIds, selectedProviderIds)&&(identical(other.scheduledAt, scheduledAt) || other.scheduledAt == scheduledAt)&&(identical(other.step3ValidationError, step3ValidationError) || other.step3ValidationError == step3ValidationError)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.submitSuccess, submitSuccess) || other.submitSuccess == submitSuccess)&&(identical(other.submitError, submitError) || other.submitError == submitError));
}


@override
int get hashCode => Object.hashAll([runtimeType,currentStep,serviceDetails,serviceDetailsLoading,serviceDetailsError,durationHours,total,totalAfterDiscount,professionalCount,needCleaningMaterials,notes,step1ValidationError,const DeepCollectionEquality().hash(selectedAddOns),step2ValidationError,const DeepCollectionEquality().hash(selectedProviderIds),scheduledAt,step3ValidationError,isSubmitting,submitSuccess,submitError]);

@override
String toString() {
  return 'BookingWizardState(currentStep: $currentStep, serviceDetails: $serviceDetails, serviceDetailsLoading: $serviceDetailsLoading, serviceDetailsError: $serviceDetailsError, durationHours: $durationHours, total: $total, totalAfterDiscount: $totalAfterDiscount, professionalCount: $professionalCount, needCleaningMaterials: $needCleaningMaterials, notes: $notes, step1ValidationError: $step1ValidationError, selectedAddOns: $selectedAddOns, step2ValidationError: $step2ValidationError, selectedProviderIds: $selectedProviderIds, scheduledAt: $scheduledAt, step3ValidationError: $step3ValidationError, isSubmitting: $isSubmitting, submitSuccess: $submitSuccess, submitError: $submitError)';
}


}

/// @nodoc
abstract mixin class $BookingWizardStateCopyWith<$Res>  {
  factory $BookingWizardStateCopyWith(BookingWizardState value, $Res Function(BookingWizardState) _then) = _$BookingWizardStateCopyWithImpl;
@useResult
$Res call({
 BookingWizardStep currentStep, ServiceDetailsResponseModel? serviceDetails, bool serviceDetailsLoading, APIException? serviceDetailsError, int durationHours, double total, double totalAfterDiscount, String professionalCount, bool needCleaningMaterials, String notes, String? step1ValidationError, List<AddOnServiceModel> selectedAddOns, String? step2ValidationError, List<String> selectedProviderIds, DateTime? scheduledAt, String? step3ValidationError, bool isSubmitting, bool submitSuccess, APIException? submitError
});


$ServiceDetailsResponseModelCopyWith<$Res>? get serviceDetails;

}
/// @nodoc
class _$BookingWizardStateCopyWithImpl<$Res>
    implements $BookingWizardStateCopyWith<$Res> {
  _$BookingWizardStateCopyWithImpl(this._self, this._then);

  final BookingWizardState _self;
  final $Res Function(BookingWizardState) _then;

/// Create a copy of BookingWizardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentStep = null,Object? serviceDetails = freezed,Object? serviceDetailsLoading = null,Object? serviceDetailsError = freezed,Object? durationHours = null,Object? total = null,Object? totalAfterDiscount = null,Object? professionalCount = null,Object? needCleaningMaterials = null,Object? notes = null,Object? step1ValidationError = freezed,Object? selectedAddOns = null,Object? step2ValidationError = freezed,Object? selectedProviderIds = null,Object? scheduledAt = freezed,Object? step3ValidationError = freezed,Object? isSubmitting = null,Object? submitSuccess = null,Object? submitError = freezed,}) {
  return _then(_self.copyWith(
currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as BookingWizardStep,serviceDetails: freezed == serviceDetails ? _self.serviceDetails : serviceDetails // ignore: cast_nullable_to_non_nullable
as ServiceDetailsResponseModel?,serviceDetailsLoading: null == serviceDetailsLoading ? _self.serviceDetailsLoading : serviceDetailsLoading // ignore: cast_nullable_to_non_nullable
as bool,serviceDetailsError: freezed == serviceDetailsError ? _self.serviceDetailsError : serviceDetailsError // ignore: cast_nullable_to_non_nullable
as APIException?,durationHours: null == durationHours ? _self.durationHours : durationHours // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,totalAfterDiscount: null == totalAfterDiscount ? _self.totalAfterDiscount : totalAfterDiscount // ignore: cast_nullable_to_non_nullable
as double,professionalCount: null == professionalCount ? _self.professionalCount : professionalCount // ignore: cast_nullable_to_non_nullable
as String,needCleaningMaterials: null == needCleaningMaterials ? _self.needCleaningMaterials : needCleaningMaterials // ignore: cast_nullable_to_non_nullable
as bool,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,step1ValidationError: freezed == step1ValidationError ? _self.step1ValidationError : step1ValidationError // ignore: cast_nullable_to_non_nullable
as String?,selectedAddOns: null == selectedAddOns ? _self.selectedAddOns : selectedAddOns // ignore: cast_nullable_to_non_nullable
as List<AddOnServiceModel>,step2ValidationError: freezed == step2ValidationError ? _self.step2ValidationError : step2ValidationError // ignore: cast_nullable_to_non_nullable
as String?,selectedProviderIds: null == selectedProviderIds ? _self.selectedProviderIds : selectedProviderIds // ignore: cast_nullable_to_non_nullable
as List<String>,scheduledAt: freezed == scheduledAt ? _self.scheduledAt : scheduledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,step3ValidationError: freezed == step3ValidationError ? _self.step3ValidationError : step3ValidationError // ignore: cast_nullable_to_non_nullable
as String?,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,submitSuccess: null == submitSuccess ? _self.submitSuccess : submitSuccess // ignore: cast_nullable_to_non_nullable
as bool,submitError: freezed == submitError ? _self.submitError : submitError // ignore: cast_nullable_to_non_nullable
as APIException?,
  ));
}
/// Create a copy of BookingWizardState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ServiceDetailsResponseModelCopyWith<$Res>? get serviceDetails {
    if (_self.serviceDetails == null) {
    return null;
  }

  return $ServiceDetailsResponseModelCopyWith<$Res>(_self.serviceDetails!, (value) {
    return _then(_self.copyWith(serviceDetails: value));
  });
}
}


/// Adds pattern-matching-related methods to [BookingWizardState].
extension BookingWizardStatePatterns on BookingWizardState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingWizardState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingWizardState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingWizardState value)  $default,){
final _that = this;
switch (_that) {
case _BookingWizardState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingWizardState value)?  $default,){
final _that = this;
switch (_that) {
case _BookingWizardState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BookingWizardStep currentStep,  ServiceDetailsResponseModel? serviceDetails,  bool serviceDetailsLoading,  APIException? serviceDetailsError,  int durationHours,  double total,  double totalAfterDiscount,  String professionalCount,  bool needCleaningMaterials,  String notes,  String? step1ValidationError,  List<AddOnServiceModel> selectedAddOns,  String? step2ValidationError,  List<String> selectedProviderIds,  DateTime? scheduledAt,  String? step3ValidationError,  bool isSubmitting,  bool submitSuccess,  APIException? submitError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingWizardState() when $default != null:
return $default(_that.currentStep,_that.serviceDetails,_that.serviceDetailsLoading,_that.serviceDetailsError,_that.durationHours,_that.total,_that.totalAfterDiscount,_that.professionalCount,_that.needCleaningMaterials,_that.notes,_that.step1ValidationError,_that.selectedAddOns,_that.step2ValidationError,_that.selectedProviderIds,_that.scheduledAt,_that.step3ValidationError,_that.isSubmitting,_that.submitSuccess,_that.submitError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BookingWizardStep currentStep,  ServiceDetailsResponseModel? serviceDetails,  bool serviceDetailsLoading,  APIException? serviceDetailsError,  int durationHours,  double total,  double totalAfterDiscount,  String professionalCount,  bool needCleaningMaterials,  String notes,  String? step1ValidationError,  List<AddOnServiceModel> selectedAddOns,  String? step2ValidationError,  List<String> selectedProviderIds,  DateTime? scheduledAt,  String? step3ValidationError,  bool isSubmitting,  bool submitSuccess,  APIException? submitError)  $default,) {final _that = this;
switch (_that) {
case _BookingWizardState():
return $default(_that.currentStep,_that.serviceDetails,_that.serviceDetailsLoading,_that.serviceDetailsError,_that.durationHours,_that.total,_that.totalAfterDiscount,_that.professionalCount,_that.needCleaningMaterials,_that.notes,_that.step1ValidationError,_that.selectedAddOns,_that.step2ValidationError,_that.selectedProviderIds,_that.scheduledAt,_that.step3ValidationError,_that.isSubmitting,_that.submitSuccess,_that.submitError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BookingWizardStep currentStep,  ServiceDetailsResponseModel? serviceDetails,  bool serviceDetailsLoading,  APIException? serviceDetailsError,  int durationHours,  double total,  double totalAfterDiscount,  String professionalCount,  bool needCleaningMaterials,  String notes,  String? step1ValidationError,  List<AddOnServiceModel> selectedAddOns,  String? step2ValidationError,  List<String> selectedProviderIds,  DateTime? scheduledAt,  String? step3ValidationError,  bool isSubmitting,  bool submitSuccess,  APIException? submitError)?  $default,) {final _that = this;
switch (_that) {
case _BookingWizardState() when $default != null:
return $default(_that.currentStep,_that.serviceDetails,_that.serviceDetailsLoading,_that.serviceDetailsError,_that.durationHours,_that.total,_that.totalAfterDiscount,_that.professionalCount,_that.needCleaningMaterials,_that.notes,_that.step1ValidationError,_that.selectedAddOns,_that.step2ValidationError,_that.selectedProviderIds,_that.scheduledAt,_that.step3ValidationError,_that.isSubmitting,_that.submitSuccess,_that.submitError);case _:
  return null;

}
}

}

/// @nodoc


class _BookingWizardState extends BookingWizardState {
  const _BookingWizardState({this.currentStep = BookingWizardStep.serviceDetails, this.serviceDetails, this.serviceDetailsLoading = false, this.serviceDetailsError, this.durationHours = 1, this.total = 0.0, this.totalAfterDiscount = 0.0, this.professionalCount = 'One Professional', this.needCleaningMaterials = false, this.notes = '', this.step1ValidationError, final  List<AddOnServiceModel> selectedAddOns = const [], this.step2ValidationError, final  List<String> selectedProviderIds = const [], this.scheduledAt, this.step3ValidationError, this.isSubmitting = false, this.submitSuccess = false, this.submitError}): _selectedAddOns = selectedAddOns,_selectedProviderIds = selectedProviderIds,super._();
  

// ── Navigation ────────────────────────────────────────────────────────────
@override@JsonKey() final  BookingWizardStep currentStep;
// ── Step 0 – Service Details ──────────────────────────────────────────────
@override final  ServiceDetailsResponseModel? serviceDetails;
@override@JsonKey() final  bool serviceDetailsLoading;
@override final  APIException? serviceDetailsError;
// ── Step 1 – Booking Options ──────────────────────────────────────────────
@override@JsonKey() final  int durationHours;
@override@JsonKey() final  double total;
@override@JsonKey() final  double totalAfterDiscount;
/// Raw label stored ("One Professional", "2 to 4", etc.)
@override@JsonKey() final  String professionalCount;
@override@JsonKey() final  bool needCleaningMaterials;
@override@JsonKey() final  String notes;
@override final  String? step1ValidationError;
// ── Step 2 – Add-ons ──────────────────────────────────────────────────────
 final  List<AddOnServiceModel> _selectedAddOns;
// ── Step 2 – Add-ons ──────────────────────────────────────────────────────
@override@JsonKey() List<AddOnServiceModel> get selectedAddOns {
  if (_selectedAddOns is EqualUnmodifiableListView) return _selectedAddOns;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedAddOns);
}

@override final  String? step2ValidationError;
// ── Step 3 – Date, Time & Provider ───────────────────────────────────────
 final  List<String> _selectedProviderIds;
// ── Step 3 – Date, Time & Provider ───────────────────────────────────────
@override@JsonKey() List<String> get selectedProviderIds {
  if (_selectedProviderIds is EqualUnmodifiableListView) return _selectedProviderIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedProviderIds);
}

@override final  DateTime? scheduledAt;
@override final  String? step3ValidationError;
// ── Submission ────────────────────────────────────────────────────────────
@override@JsonKey() final  bool isSubmitting;
@override@JsonKey() final  bool submitSuccess;
@override final  APIException? submitError;

/// Create a copy of BookingWizardState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingWizardStateCopyWith<_BookingWizardState> get copyWith => __$BookingWizardStateCopyWithImpl<_BookingWizardState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingWizardState&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.serviceDetails, serviceDetails) || other.serviceDetails == serviceDetails)&&(identical(other.serviceDetailsLoading, serviceDetailsLoading) || other.serviceDetailsLoading == serviceDetailsLoading)&&(identical(other.serviceDetailsError, serviceDetailsError) || other.serviceDetailsError == serviceDetailsError)&&(identical(other.durationHours, durationHours) || other.durationHours == durationHours)&&(identical(other.total, total) || other.total == total)&&(identical(other.totalAfterDiscount, totalAfterDiscount) || other.totalAfterDiscount == totalAfterDiscount)&&(identical(other.professionalCount, professionalCount) || other.professionalCount == professionalCount)&&(identical(other.needCleaningMaterials, needCleaningMaterials) || other.needCleaningMaterials == needCleaningMaterials)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.step1ValidationError, step1ValidationError) || other.step1ValidationError == step1ValidationError)&&const DeepCollectionEquality().equals(other._selectedAddOns, _selectedAddOns)&&(identical(other.step2ValidationError, step2ValidationError) || other.step2ValidationError == step2ValidationError)&&const DeepCollectionEquality().equals(other._selectedProviderIds, _selectedProviderIds)&&(identical(other.scheduledAt, scheduledAt) || other.scheduledAt == scheduledAt)&&(identical(other.step3ValidationError, step3ValidationError) || other.step3ValidationError == step3ValidationError)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.submitSuccess, submitSuccess) || other.submitSuccess == submitSuccess)&&(identical(other.submitError, submitError) || other.submitError == submitError));
}


@override
int get hashCode => Object.hashAll([runtimeType,currentStep,serviceDetails,serviceDetailsLoading,serviceDetailsError,durationHours,total,totalAfterDiscount,professionalCount,needCleaningMaterials,notes,step1ValidationError,const DeepCollectionEquality().hash(_selectedAddOns),step2ValidationError,const DeepCollectionEquality().hash(_selectedProviderIds),scheduledAt,step3ValidationError,isSubmitting,submitSuccess,submitError]);

@override
String toString() {
  return 'BookingWizardState(currentStep: $currentStep, serviceDetails: $serviceDetails, serviceDetailsLoading: $serviceDetailsLoading, serviceDetailsError: $serviceDetailsError, durationHours: $durationHours, total: $total, totalAfterDiscount: $totalAfterDiscount, professionalCount: $professionalCount, needCleaningMaterials: $needCleaningMaterials, notes: $notes, step1ValidationError: $step1ValidationError, selectedAddOns: $selectedAddOns, step2ValidationError: $step2ValidationError, selectedProviderIds: $selectedProviderIds, scheduledAt: $scheduledAt, step3ValidationError: $step3ValidationError, isSubmitting: $isSubmitting, submitSuccess: $submitSuccess, submitError: $submitError)';
}


}

/// @nodoc
abstract mixin class _$BookingWizardStateCopyWith<$Res> implements $BookingWizardStateCopyWith<$Res> {
  factory _$BookingWizardStateCopyWith(_BookingWizardState value, $Res Function(_BookingWizardState) _then) = __$BookingWizardStateCopyWithImpl;
@override @useResult
$Res call({
 BookingWizardStep currentStep, ServiceDetailsResponseModel? serviceDetails, bool serviceDetailsLoading, APIException? serviceDetailsError, int durationHours, double total, double totalAfterDiscount, String professionalCount, bool needCleaningMaterials, String notes, String? step1ValidationError, List<AddOnServiceModel> selectedAddOns, String? step2ValidationError, List<String> selectedProviderIds, DateTime? scheduledAt, String? step3ValidationError, bool isSubmitting, bool submitSuccess, APIException? submitError
});


@override $ServiceDetailsResponseModelCopyWith<$Res>? get serviceDetails;

}
/// @nodoc
class __$BookingWizardStateCopyWithImpl<$Res>
    implements _$BookingWizardStateCopyWith<$Res> {
  __$BookingWizardStateCopyWithImpl(this._self, this._then);

  final _BookingWizardState _self;
  final $Res Function(_BookingWizardState) _then;

/// Create a copy of BookingWizardState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentStep = null,Object? serviceDetails = freezed,Object? serviceDetailsLoading = null,Object? serviceDetailsError = freezed,Object? durationHours = null,Object? total = null,Object? totalAfterDiscount = null,Object? professionalCount = null,Object? needCleaningMaterials = null,Object? notes = null,Object? step1ValidationError = freezed,Object? selectedAddOns = null,Object? step2ValidationError = freezed,Object? selectedProviderIds = null,Object? scheduledAt = freezed,Object? step3ValidationError = freezed,Object? isSubmitting = null,Object? submitSuccess = null,Object? submitError = freezed,}) {
  return _then(_BookingWizardState(
currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as BookingWizardStep,serviceDetails: freezed == serviceDetails ? _self.serviceDetails : serviceDetails // ignore: cast_nullable_to_non_nullable
as ServiceDetailsResponseModel?,serviceDetailsLoading: null == serviceDetailsLoading ? _self.serviceDetailsLoading : serviceDetailsLoading // ignore: cast_nullable_to_non_nullable
as bool,serviceDetailsError: freezed == serviceDetailsError ? _self.serviceDetailsError : serviceDetailsError // ignore: cast_nullable_to_non_nullable
as APIException?,durationHours: null == durationHours ? _self.durationHours : durationHours // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,totalAfterDiscount: null == totalAfterDiscount ? _self.totalAfterDiscount : totalAfterDiscount // ignore: cast_nullable_to_non_nullable
as double,professionalCount: null == professionalCount ? _self.professionalCount : professionalCount // ignore: cast_nullable_to_non_nullable
as String,needCleaningMaterials: null == needCleaningMaterials ? _self.needCleaningMaterials : needCleaningMaterials // ignore: cast_nullable_to_non_nullable
as bool,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,step1ValidationError: freezed == step1ValidationError ? _self.step1ValidationError : step1ValidationError // ignore: cast_nullable_to_non_nullable
as String?,selectedAddOns: null == selectedAddOns ? _self._selectedAddOns : selectedAddOns // ignore: cast_nullable_to_non_nullable
as List<AddOnServiceModel>,step2ValidationError: freezed == step2ValidationError ? _self.step2ValidationError : step2ValidationError // ignore: cast_nullable_to_non_nullable
as String?,selectedProviderIds: null == selectedProviderIds ? _self._selectedProviderIds : selectedProviderIds // ignore: cast_nullable_to_non_nullable
as List<String>,scheduledAt: freezed == scheduledAt ? _self.scheduledAt : scheduledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,step3ValidationError: freezed == step3ValidationError ? _self.step3ValidationError : step3ValidationError // ignore: cast_nullable_to_non_nullable
as String?,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,submitSuccess: null == submitSuccess ? _self.submitSuccess : submitSuccess // ignore: cast_nullable_to_non_nullable
as bool,submitError: freezed == submitError ? _self.submitError : submitError // ignore: cast_nullable_to_non_nullable
as APIException?,
  ));
}

/// Create a copy of BookingWizardState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ServiceDetailsResponseModelCopyWith<$Res>? get serviceDetails {
    if (_self.serviceDetails == null) {
    return null;
  }

  return $ServiceDetailsResponseModelCopyWith<$Res>(_self.serviceDetails!, (value) {
    return _then(_self.copyWith(serviceDetails: value));
  });
}
}

// dart format on
