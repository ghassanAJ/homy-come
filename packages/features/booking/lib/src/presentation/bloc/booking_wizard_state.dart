import 'package:booking/booking.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:util/util.dart';

part 'booking_wizard_state.freezed.dart';

enum BookingWizardStep {
  serviceDetails,
  hoursStep,
  popularsAddOn,
  selectDateTimeStep,
  summary,
}

@freezed
abstract class BookingWizardState with _$BookingWizardState {
  const factory BookingWizardState({
    // ── Navigation ────────────────────────────────────────────────────────────
    @Default(BookingWizardStep.serviceDetails) BookingWizardStep currentStep,

    // ── Step 0 – Service Details ──────────────────────────────────────────────
    ServiceDetailsResponseModel? serviceDetails,
    @Default(false) bool serviceDetailsLoading,
    APIException? serviceDetailsError,

    // ── Step 1 – Booking Options ──────────────────────────────────────────────
    @Default(1) int durationHours,
    @Default(0.0) double total,
    @Default(0.0) double totalAfterDiscount,

    /// Raw label stored ("One Professional", "2 to 4", etc.)
    @Default('One Professional') String professionalCount,
    @Default(false) bool needCleaningMaterials,
    @Default('') String notes,
    String? step1ValidationError,

    // ── Step 2 – Add-ons ──────────────────────────────────────────────────────
    @Default([]) List<AddOnServiceModel> selectedAddOns,
    String? step2ValidationError,

    // ── Step 3 – Date, Time & Provider ───────────────────────────────────────
    @Default([]) List<String> selectedProviderIds,
    DateTime? scheduledAt,
    String? step3ValidationError,

    // ── Submission ────────────────────────────────────────────────────────────
    @Default(false) bool isSubmitting,
    @Default(false) bool submitSuccess,
    APIException? submitError,
  }) = _BookingWizardState;

  const BookingWizardState._();

  bool get canAdvanceFromStep1 =>
      durationHours > 0 && professionalCount.isNotEmpty;

  bool get canAdvanceFromStep2 => true; // add-ons are optional

  bool get canAdvanceFromStep3 =>
      selectedProviderIds.isNotEmpty && scheduledAt != null;
}
