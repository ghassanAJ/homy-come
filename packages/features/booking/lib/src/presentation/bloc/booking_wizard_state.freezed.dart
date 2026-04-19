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
 int get professionalCount; bool get needCleaningMaterials; String get notes; String? get step1ValidationError;// ── Step 2 – Add-ons ──────────────────────────────────────────────────────
 List<AddOnServiceModel> get selectedAddOns; String? get step2ValidationError;// ── Step 3 – Date, Time & Provider ───────────────────────────────────────
 List<ProviderModel> get selectedProviders; List<ProviderModel> get availableProviders; DateTime? get scheduledAt; String? get step3ValidationError;// ── Submission ────────────────────────────────────────────────────────────
 bool get isSubmitting; bool get submitSuccess; APIException? get submitError; APIException? get slotsError; APIException? get providersError; int get selectedDayIndex; List<TimeSlotModel> get timeSlots; bool get loadingSlots; bool get loadingProviders; List<DayModel> get availableDays;
/// Create a copy of BookingWizardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingWizardStateCopyWith<BookingWizardState> get copyWith => _$BookingWizardStateCopyWithImpl<BookingWizardState>(this as BookingWizardState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingWizardState&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.serviceDetails, serviceDetails) || other.serviceDetails == serviceDetails)&&(identical(other.serviceDetailsLoading, serviceDetailsLoading) || other.serviceDetailsLoading == serviceDetailsLoading)&&(identical(other.serviceDetailsError, serviceDetailsError) || other.serviceDetailsError == serviceDetailsError)&&(identical(other.durationHours, durationHours) || other.durationHours == durationHours)&&(identical(other.total, total) || other.total == total)&&(identical(other.totalAfterDiscount, totalAfterDiscount) || other.totalAfterDiscount == totalAfterDiscount)&&(identical(other.professionalCount, professionalCount) || other.professionalCount == professionalCount)&&(identical(other.needCleaningMaterials, needCleaningMaterials) || other.needCleaningMaterials == needCleaningMaterials)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.step1ValidationError, step1ValidationError) || other.step1ValidationError == step1ValidationError)&&const DeepCollectionEquality().equals(other.selectedAddOns, selectedAddOns)&&(identical(other.step2ValidationError, step2ValidationError) || other.step2ValidationError == step2ValidationError)&&const DeepCollectionEquality().equals(other.selectedProviders, selectedProviders)&&const DeepCollectionEquality().equals(other.availableProviders, availableProviders)&&(identical(other.scheduledAt, scheduledAt) || other.scheduledAt == scheduledAt)&&(identical(other.step3ValidationError, step3ValidationError) || other.step3ValidationError == step3ValidationError)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.submitSuccess, submitSuccess) || other.submitSuccess == submitSuccess)&&(identical(other.submitError, submitError) || other.submitError == submitError)&&(identical(other.slotsError, slotsError) || other.slotsError == slotsError)&&(identical(other.providersError, providersError) || other.providersError == providersError)&&(identical(other.selectedDayIndex, selectedDayIndex) || other.selectedDayIndex == selectedDayIndex)&&const DeepCollectionEquality().equals(other.timeSlots, timeSlots)&&(identical(other.loadingSlots, loadingSlots) || other.loadingSlots == loadingSlots)&&(identical(other.loadingProviders, loadingProviders) || other.loadingProviders == loadingProviders)&&const DeepCollectionEquality().equals(other.availableDays, availableDays));
}


@override
int get hashCode => Object.hashAll([runtimeType,currentStep,serviceDetails,serviceDetailsLoading,serviceDetailsError,durationHours,total,totalAfterDiscount,professionalCount,needCleaningMaterials,notes,step1ValidationError,const DeepCollectionEquality().hash(selectedAddOns),step2ValidationError,const DeepCollectionEquality().hash(selectedProviders),const DeepCollectionEquality().hash(availableProviders),scheduledAt,step3ValidationError,isSubmitting,submitSuccess,submitError,slotsError,providersError,selectedDayIndex,const DeepCollectionEquality().hash(timeSlots),loadingSlots,loadingProviders,const DeepCollectionEquality().hash(availableDays)]);

@override
String toString() {
  return 'BookingWizardState(currentStep: $currentStep, serviceDetails: $serviceDetails, serviceDetailsLoading: $serviceDetailsLoading, serviceDetailsError: $serviceDetailsError, durationHours: $durationHours, total: $total, totalAfterDiscount: $totalAfterDiscount, professionalCount: $professionalCount, needCleaningMaterials: $needCleaningMaterials, notes: $notes, step1ValidationError: $step1ValidationError, selectedAddOns: $selectedAddOns, step2ValidationError: $step2ValidationError, selectedProviders: $selectedProviders, availableProviders: $availableProviders, scheduledAt: $scheduledAt, step3ValidationError: $step3ValidationError, isSubmitting: $isSubmitting, submitSuccess: $submitSuccess, submitError: $submitError, slotsError: $slotsError, providersError: $providersError, selectedDayIndex: $selectedDayIndex, timeSlots: $timeSlots, loadingSlots: $loadingSlots, loadingProviders: $loadingProviders, availableDays: $availableDays)';
}


}

/// @nodoc
abstract mixin class $BookingWizardStateCopyWith<$Res>  {
  factory $BookingWizardStateCopyWith(BookingWizardState value, $Res Function(BookingWizardState) _then) = _$BookingWizardStateCopyWithImpl;
@useResult
$Res call({
 BookingWizardStep currentStep, ServiceDetailsResponseModel? serviceDetails, bool serviceDetailsLoading, APIException? serviceDetailsError, int durationHours, double total, double totalAfterDiscount, int professionalCount, bool needCleaningMaterials, String notes, String? step1ValidationError, List<AddOnServiceModel> selectedAddOns, String? step2ValidationError, List<ProviderModel> selectedProviders, List<ProviderModel> availableProviders, DateTime? scheduledAt, String? step3ValidationError, bool isSubmitting, bool submitSuccess, APIException? submitError, APIException? slotsError, APIException? providersError, int selectedDayIndex, List<TimeSlotModel> timeSlots, bool loadingSlots, bool loadingProviders, List<DayModel> availableDays
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
@pragma('vm:prefer-inline') @override $Res call({Object? currentStep = null,Object? serviceDetails = freezed,Object? serviceDetailsLoading = null,Object? serviceDetailsError = freezed,Object? durationHours = null,Object? total = null,Object? totalAfterDiscount = null,Object? professionalCount = null,Object? needCleaningMaterials = null,Object? notes = null,Object? step1ValidationError = freezed,Object? selectedAddOns = null,Object? step2ValidationError = freezed,Object? selectedProviders = null,Object? availableProviders = null,Object? scheduledAt = freezed,Object? step3ValidationError = freezed,Object? isSubmitting = null,Object? submitSuccess = null,Object? submitError = freezed,Object? slotsError = freezed,Object? providersError = freezed,Object? selectedDayIndex = null,Object? timeSlots = null,Object? loadingSlots = null,Object? loadingProviders = null,Object? availableDays = null,}) {
  return _then(_self.copyWith(
currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as BookingWizardStep,serviceDetails: freezed == serviceDetails ? _self.serviceDetails : serviceDetails // ignore: cast_nullable_to_non_nullable
as ServiceDetailsResponseModel?,serviceDetailsLoading: null == serviceDetailsLoading ? _self.serviceDetailsLoading : serviceDetailsLoading // ignore: cast_nullable_to_non_nullable
as bool,serviceDetailsError: freezed == serviceDetailsError ? _self.serviceDetailsError : serviceDetailsError // ignore: cast_nullable_to_non_nullable
as APIException?,durationHours: null == durationHours ? _self.durationHours : durationHours // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,totalAfterDiscount: null == totalAfterDiscount ? _self.totalAfterDiscount : totalAfterDiscount // ignore: cast_nullable_to_non_nullable
as double,professionalCount: null == professionalCount ? _self.professionalCount : professionalCount // ignore: cast_nullable_to_non_nullable
as int,needCleaningMaterials: null == needCleaningMaterials ? _self.needCleaningMaterials : needCleaningMaterials // ignore: cast_nullable_to_non_nullable
as bool,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,step1ValidationError: freezed == step1ValidationError ? _self.step1ValidationError : step1ValidationError // ignore: cast_nullable_to_non_nullable
as String?,selectedAddOns: null == selectedAddOns ? _self.selectedAddOns : selectedAddOns // ignore: cast_nullable_to_non_nullable
as List<AddOnServiceModel>,step2ValidationError: freezed == step2ValidationError ? _self.step2ValidationError : step2ValidationError // ignore: cast_nullable_to_non_nullable
as String?,selectedProviders: null == selectedProviders ? _self.selectedProviders : selectedProviders // ignore: cast_nullable_to_non_nullable
as List<ProviderModel>,availableProviders: null == availableProviders ? _self.availableProviders : availableProviders // ignore: cast_nullable_to_non_nullable
as List<ProviderModel>,scheduledAt: freezed == scheduledAt ? _self.scheduledAt : scheduledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,step3ValidationError: freezed == step3ValidationError ? _self.step3ValidationError : step3ValidationError // ignore: cast_nullable_to_non_nullable
as String?,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,submitSuccess: null == submitSuccess ? _self.submitSuccess : submitSuccess // ignore: cast_nullable_to_non_nullable
as bool,submitError: freezed == submitError ? _self.submitError : submitError // ignore: cast_nullable_to_non_nullable
as APIException?,slotsError: freezed == slotsError ? _self.slotsError : slotsError // ignore: cast_nullable_to_non_nullable
as APIException?,providersError: freezed == providersError ? _self.providersError : providersError // ignore: cast_nullable_to_non_nullable
as APIException?,selectedDayIndex: null == selectedDayIndex ? _self.selectedDayIndex : selectedDayIndex // ignore: cast_nullable_to_non_nullable
as int,timeSlots: null == timeSlots ? _self.timeSlots : timeSlots // ignore: cast_nullable_to_non_nullable
as List<TimeSlotModel>,loadingSlots: null == loadingSlots ? _self.loadingSlots : loadingSlots // ignore: cast_nullable_to_non_nullable
as bool,loadingProviders: null == loadingProviders ? _self.loadingProviders : loadingProviders // ignore: cast_nullable_to_non_nullable
as bool,availableDays: null == availableDays ? _self.availableDays : availableDays // ignore: cast_nullable_to_non_nullable
as List<DayModel>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BookingWizardStep currentStep,  ServiceDetailsResponseModel? serviceDetails,  bool serviceDetailsLoading,  APIException? serviceDetailsError,  int durationHours,  double total,  double totalAfterDiscount,  int professionalCount,  bool needCleaningMaterials,  String notes,  String? step1ValidationError,  List<AddOnServiceModel> selectedAddOns,  String? step2ValidationError,  List<ProviderModel> selectedProviders,  List<ProviderModel> availableProviders,  DateTime? scheduledAt,  String? step3ValidationError,  bool isSubmitting,  bool submitSuccess,  APIException? submitError,  APIException? slotsError,  APIException? providersError,  int selectedDayIndex,  List<TimeSlotModel> timeSlots,  bool loadingSlots,  bool loadingProviders,  List<DayModel> availableDays)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingWizardState() when $default != null:
return $default(_that.currentStep,_that.serviceDetails,_that.serviceDetailsLoading,_that.serviceDetailsError,_that.durationHours,_that.total,_that.totalAfterDiscount,_that.professionalCount,_that.needCleaningMaterials,_that.notes,_that.step1ValidationError,_that.selectedAddOns,_that.step2ValidationError,_that.selectedProviders,_that.availableProviders,_that.scheduledAt,_that.step3ValidationError,_that.isSubmitting,_that.submitSuccess,_that.submitError,_that.slotsError,_that.providersError,_that.selectedDayIndex,_that.timeSlots,_that.loadingSlots,_that.loadingProviders,_that.availableDays);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BookingWizardStep currentStep,  ServiceDetailsResponseModel? serviceDetails,  bool serviceDetailsLoading,  APIException? serviceDetailsError,  int durationHours,  double total,  double totalAfterDiscount,  int professionalCount,  bool needCleaningMaterials,  String notes,  String? step1ValidationError,  List<AddOnServiceModel> selectedAddOns,  String? step2ValidationError,  List<ProviderModel> selectedProviders,  List<ProviderModel> availableProviders,  DateTime? scheduledAt,  String? step3ValidationError,  bool isSubmitting,  bool submitSuccess,  APIException? submitError,  APIException? slotsError,  APIException? providersError,  int selectedDayIndex,  List<TimeSlotModel> timeSlots,  bool loadingSlots,  bool loadingProviders,  List<DayModel> availableDays)  $default,) {final _that = this;
switch (_that) {
case _BookingWizardState():
return $default(_that.currentStep,_that.serviceDetails,_that.serviceDetailsLoading,_that.serviceDetailsError,_that.durationHours,_that.total,_that.totalAfterDiscount,_that.professionalCount,_that.needCleaningMaterials,_that.notes,_that.step1ValidationError,_that.selectedAddOns,_that.step2ValidationError,_that.selectedProviders,_that.availableProviders,_that.scheduledAt,_that.step3ValidationError,_that.isSubmitting,_that.submitSuccess,_that.submitError,_that.slotsError,_that.providersError,_that.selectedDayIndex,_that.timeSlots,_that.loadingSlots,_that.loadingProviders,_that.availableDays);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BookingWizardStep currentStep,  ServiceDetailsResponseModel? serviceDetails,  bool serviceDetailsLoading,  APIException? serviceDetailsError,  int durationHours,  double total,  double totalAfterDiscount,  int professionalCount,  bool needCleaningMaterials,  String notes,  String? step1ValidationError,  List<AddOnServiceModel> selectedAddOns,  String? step2ValidationError,  List<ProviderModel> selectedProviders,  List<ProviderModel> availableProviders,  DateTime? scheduledAt,  String? step3ValidationError,  bool isSubmitting,  bool submitSuccess,  APIException? submitError,  APIException? slotsError,  APIException? providersError,  int selectedDayIndex,  List<TimeSlotModel> timeSlots,  bool loadingSlots,  bool loadingProviders,  List<DayModel> availableDays)?  $default,) {final _that = this;
switch (_that) {
case _BookingWizardState() when $default != null:
return $default(_that.currentStep,_that.serviceDetails,_that.serviceDetailsLoading,_that.serviceDetailsError,_that.durationHours,_that.total,_that.totalAfterDiscount,_that.professionalCount,_that.needCleaningMaterials,_that.notes,_that.step1ValidationError,_that.selectedAddOns,_that.step2ValidationError,_that.selectedProviders,_that.availableProviders,_that.scheduledAt,_that.step3ValidationError,_that.isSubmitting,_that.submitSuccess,_that.submitError,_that.slotsError,_that.providersError,_that.selectedDayIndex,_that.timeSlots,_that.loadingSlots,_that.loadingProviders,_that.availableDays);case _:
  return null;

}
}

}

/// @nodoc


class _BookingWizardState extends BookingWizardState {
  const _BookingWizardState({this.currentStep = BookingWizardStep.serviceDetails, this.serviceDetails, this.serviceDetailsLoading = false, this.serviceDetailsError, this.durationHours = 1, this.total = 0.0, this.totalAfterDiscount = 0.0, this.professionalCount = 1, this.needCleaningMaterials = false, this.notes = '', this.step1ValidationError, final  List<AddOnServiceModel> selectedAddOns = const [], this.step2ValidationError, final  List<ProviderModel> selectedProviders = const [], final  List<ProviderModel> availableProviders = const [], this.scheduledAt, this.step3ValidationError, this.isSubmitting = false, this.submitSuccess = false, this.submitError, this.slotsError, this.providersError, this.selectedDayIndex = 0, final  List<TimeSlotModel> timeSlots = const [], this.loadingSlots = false, this.loadingProviders = false, final  List<DayModel> availableDays = const []}): _selectedAddOns = selectedAddOns,_selectedProviders = selectedProviders,_availableProviders = availableProviders,_timeSlots = timeSlots,_availableDays = availableDays,super._();
  

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
@override@JsonKey() final  int professionalCount;
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
 final  List<ProviderModel> _selectedProviders;
// ── Step 3 – Date, Time & Provider ───────────────────────────────────────
@override@JsonKey() List<ProviderModel> get selectedProviders {
  if (_selectedProviders is EqualUnmodifiableListView) return _selectedProviders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedProviders);
}

 final  List<ProviderModel> _availableProviders;
@override@JsonKey() List<ProviderModel> get availableProviders {
  if (_availableProviders is EqualUnmodifiableListView) return _availableProviders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_availableProviders);
}

@override final  DateTime? scheduledAt;
@override final  String? step3ValidationError;
// ── Submission ────────────────────────────────────────────────────────────
@override@JsonKey() final  bool isSubmitting;
@override@JsonKey() final  bool submitSuccess;
@override final  APIException? submitError;
@override final  APIException? slotsError;
@override final  APIException? providersError;
@override@JsonKey() final  int selectedDayIndex;
 final  List<TimeSlotModel> _timeSlots;
@override@JsonKey() List<TimeSlotModel> get timeSlots {
  if (_timeSlots is EqualUnmodifiableListView) return _timeSlots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_timeSlots);
}

@override@JsonKey() final  bool loadingSlots;
@override@JsonKey() final  bool loadingProviders;
 final  List<DayModel> _availableDays;
@override@JsonKey() List<DayModel> get availableDays {
  if (_availableDays is EqualUnmodifiableListView) return _availableDays;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_availableDays);
}


/// Create a copy of BookingWizardState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingWizardStateCopyWith<_BookingWizardState> get copyWith => __$BookingWizardStateCopyWithImpl<_BookingWizardState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingWizardState&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.serviceDetails, serviceDetails) || other.serviceDetails == serviceDetails)&&(identical(other.serviceDetailsLoading, serviceDetailsLoading) || other.serviceDetailsLoading == serviceDetailsLoading)&&(identical(other.serviceDetailsError, serviceDetailsError) || other.serviceDetailsError == serviceDetailsError)&&(identical(other.durationHours, durationHours) || other.durationHours == durationHours)&&(identical(other.total, total) || other.total == total)&&(identical(other.totalAfterDiscount, totalAfterDiscount) || other.totalAfterDiscount == totalAfterDiscount)&&(identical(other.professionalCount, professionalCount) || other.professionalCount == professionalCount)&&(identical(other.needCleaningMaterials, needCleaningMaterials) || other.needCleaningMaterials == needCleaningMaterials)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.step1ValidationError, step1ValidationError) || other.step1ValidationError == step1ValidationError)&&const DeepCollectionEquality().equals(other._selectedAddOns, _selectedAddOns)&&(identical(other.step2ValidationError, step2ValidationError) || other.step2ValidationError == step2ValidationError)&&const DeepCollectionEquality().equals(other._selectedProviders, _selectedProviders)&&const DeepCollectionEquality().equals(other._availableProviders, _availableProviders)&&(identical(other.scheduledAt, scheduledAt) || other.scheduledAt == scheduledAt)&&(identical(other.step3ValidationError, step3ValidationError) || other.step3ValidationError == step3ValidationError)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.submitSuccess, submitSuccess) || other.submitSuccess == submitSuccess)&&(identical(other.submitError, submitError) || other.submitError == submitError)&&(identical(other.slotsError, slotsError) || other.slotsError == slotsError)&&(identical(other.providersError, providersError) || other.providersError == providersError)&&(identical(other.selectedDayIndex, selectedDayIndex) || other.selectedDayIndex == selectedDayIndex)&&const DeepCollectionEquality().equals(other._timeSlots, _timeSlots)&&(identical(other.loadingSlots, loadingSlots) || other.loadingSlots == loadingSlots)&&(identical(other.loadingProviders, loadingProviders) || other.loadingProviders == loadingProviders)&&const DeepCollectionEquality().equals(other._availableDays, _availableDays));
}


@override
int get hashCode => Object.hashAll([runtimeType,currentStep,serviceDetails,serviceDetailsLoading,serviceDetailsError,durationHours,total,totalAfterDiscount,professionalCount,needCleaningMaterials,notes,step1ValidationError,const DeepCollectionEquality().hash(_selectedAddOns),step2ValidationError,const DeepCollectionEquality().hash(_selectedProviders),const DeepCollectionEquality().hash(_availableProviders),scheduledAt,step3ValidationError,isSubmitting,submitSuccess,submitError,slotsError,providersError,selectedDayIndex,const DeepCollectionEquality().hash(_timeSlots),loadingSlots,loadingProviders,const DeepCollectionEquality().hash(_availableDays)]);

@override
String toString() {
  return 'BookingWizardState(currentStep: $currentStep, serviceDetails: $serviceDetails, serviceDetailsLoading: $serviceDetailsLoading, serviceDetailsError: $serviceDetailsError, durationHours: $durationHours, total: $total, totalAfterDiscount: $totalAfterDiscount, professionalCount: $professionalCount, needCleaningMaterials: $needCleaningMaterials, notes: $notes, step1ValidationError: $step1ValidationError, selectedAddOns: $selectedAddOns, step2ValidationError: $step2ValidationError, selectedProviders: $selectedProviders, availableProviders: $availableProviders, scheduledAt: $scheduledAt, step3ValidationError: $step3ValidationError, isSubmitting: $isSubmitting, submitSuccess: $submitSuccess, submitError: $submitError, slotsError: $slotsError, providersError: $providersError, selectedDayIndex: $selectedDayIndex, timeSlots: $timeSlots, loadingSlots: $loadingSlots, loadingProviders: $loadingProviders, availableDays: $availableDays)';
}


}

/// @nodoc
abstract mixin class _$BookingWizardStateCopyWith<$Res> implements $BookingWizardStateCopyWith<$Res> {
  factory _$BookingWizardStateCopyWith(_BookingWizardState value, $Res Function(_BookingWizardState) _then) = __$BookingWizardStateCopyWithImpl;
@override @useResult
$Res call({
 BookingWizardStep currentStep, ServiceDetailsResponseModel? serviceDetails, bool serviceDetailsLoading, APIException? serviceDetailsError, int durationHours, double total, double totalAfterDiscount, int professionalCount, bool needCleaningMaterials, String notes, String? step1ValidationError, List<AddOnServiceModel> selectedAddOns, String? step2ValidationError, List<ProviderModel> selectedProviders, List<ProviderModel> availableProviders, DateTime? scheduledAt, String? step3ValidationError, bool isSubmitting, bool submitSuccess, APIException? submitError, APIException? slotsError, APIException? providersError, int selectedDayIndex, List<TimeSlotModel> timeSlots, bool loadingSlots, bool loadingProviders, List<DayModel> availableDays
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
@override @pragma('vm:prefer-inline') $Res call({Object? currentStep = null,Object? serviceDetails = freezed,Object? serviceDetailsLoading = null,Object? serviceDetailsError = freezed,Object? durationHours = null,Object? total = null,Object? totalAfterDiscount = null,Object? professionalCount = null,Object? needCleaningMaterials = null,Object? notes = null,Object? step1ValidationError = freezed,Object? selectedAddOns = null,Object? step2ValidationError = freezed,Object? selectedProviders = null,Object? availableProviders = null,Object? scheduledAt = freezed,Object? step3ValidationError = freezed,Object? isSubmitting = null,Object? submitSuccess = null,Object? submitError = freezed,Object? slotsError = freezed,Object? providersError = freezed,Object? selectedDayIndex = null,Object? timeSlots = null,Object? loadingSlots = null,Object? loadingProviders = null,Object? availableDays = null,}) {
  return _then(_BookingWizardState(
currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as BookingWizardStep,serviceDetails: freezed == serviceDetails ? _self.serviceDetails : serviceDetails // ignore: cast_nullable_to_non_nullable
as ServiceDetailsResponseModel?,serviceDetailsLoading: null == serviceDetailsLoading ? _self.serviceDetailsLoading : serviceDetailsLoading // ignore: cast_nullable_to_non_nullable
as bool,serviceDetailsError: freezed == serviceDetailsError ? _self.serviceDetailsError : serviceDetailsError // ignore: cast_nullable_to_non_nullable
as APIException?,durationHours: null == durationHours ? _self.durationHours : durationHours // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,totalAfterDiscount: null == totalAfterDiscount ? _self.totalAfterDiscount : totalAfterDiscount // ignore: cast_nullable_to_non_nullable
as double,professionalCount: null == professionalCount ? _self.professionalCount : professionalCount // ignore: cast_nullable_to_non_nullable
as int,needCleaningMaterials: null == needCleaningMaterials ? _self.needCleaningMaterials : needCleaningMaterials // ignore: cast_nullable_to_non_nullable
as bool,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,step1ValidationError: freezed == step1ValidationError ? _self.step1ValidationError : step1ValidationError // ignore: cast_nullable_to_non_nullable
as String?,selectedAddOns: null == selectedAddOns ? _self._selectedAddOns : selectedAddOns // ignore: cast_nullable_to_non_nullable
as List<AddOnServiceModel>,step2ValidationError: freezed == step2ValidationError ? _self.step2ValidationError : step2ValidationError // ignore: cast_nullable_to_non_nullable
as String?,selectedProviders: null == selectedProviders ? _self._selectedProviders : selectedProviders // ignore: cast_nullable_to_non_nullable
as List<ProviderModel>,availableProviders: null == availableProviders ? _self._availableProviders : availableProviders // ignore: cast_nullable_to_non_nullable
as List<ProviderModel>,scheduledAt: freezed == scheduledAt ? _self.scheduledAt : scheduledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,step3ValidationError: freezed == step3ValidationError ? _self.step3ValidationError : step3ValidationError // ignore: cast_nullable_to_non_nullable
as String?,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,submitSuccess: null == submitSuccess ? _self.submitSuccess : submitSuccess // ignore: cast_nullable_to_non_nullable
as bool,submitError: freezed == submitError ? _self.submitError : submitError // ignore: cast_nullable_to_non_nullable
as APIException?,slotsError: freezed == slotsError ? _self.slotsError : slotsError // ignore: cast_nullable_to_non_nullable
as APIException?,providersError: freezed == providersError ? _self.providersError : providersError // ignore: cast_nullable_to_non_nullable
as APIException?,selectedDayIndex: null == selectedDayIndex ? _self.selectedDayIndex : selectedDayIndex // ignore: cast_nullable_to_non_nullable
as int,timeSlots: null == timeSlots ? _self._timeSlots : timeSlots // ignore: cast_nullable_to_non_nullable
as List<TimeSlotModel>,loadingSlots: null == loadingSlots ? _self.loadingSlots : loadingSlots // ignore: cast_nullable_to_non_nullable
as bool,loadingProviders: null == loadingProviders ? _self.loadingProviders : loadingProviders // ignore: cast_nullable_to_non_nullable
as bool,availableDays: null == availableDays ? _self._availableDays : availableDays // ignore: cast_nullable_to_non_nullable
as List<DayModel>,
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
