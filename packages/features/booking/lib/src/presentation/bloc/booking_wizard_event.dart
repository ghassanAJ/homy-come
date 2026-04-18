part of 'booking_wizard_bloc.dart';

sealed class BookingWizardEvent {
  const BookingWizardEvent();
}

// ── Step 0 ────────────────────────────────────────────────────────────────────

/// Kick off – loads the full service details from the repository.
final class LoadServiceDetails extends BookingWizardEvent {
  const LoadServiceDetails({required this.serviceId});
  final String serviceId;
}

/// User presses "Add" on an add-on card on the service-details screen.
final class ToggleAddOnFromServiceDetails extends BookingWizardEvent {
  const ToggleAddOnFromServiceDetails({required this.addOnId});
  final AddOnServiceModel addOnId;
}

/// Navigates from step 0 → step 1.
final class ProceedToStep1 extends BookingWizardEvent {
  const ProceedToStep1();
}

// ── Step 1 ────────────────────────────────────────────────────────────────────

final class UpdateDurationHours extends BookingWizardEvent {
  const UpdateDurationHours({required this.hours});
  final int hours;
}

final class UpdateProfessionalCount extends BookingWizardEvent {
  const UpdateProfessionalCount({required this.count});
  final String count;
}

final class UpdateNeedCleaningMaterials extends BookingWizardEvent {
  const UpdateNeedCleaningMaterials({required this.value});
  final bool value;
}

final class UpdateNotes extends BookingWizardEvent {
  const UpdateNotes({required this.notes});
  final String notes;
}

/// Validates step 1 and navigates to step 2 if valid.
final class ProceedToStep2 extends BookingWizardEvent {
  const ProceedToStep2();
}

// ── Step 2 ────────────────────────────────────────────────────────────────────

/// Toggle an add-on from the dedicated add-ons step.
final class ToggleAddOn extends BookingWizardEvent {
  const ToggleAddOn({required this.addOnId});
  final AddOnServiceModel addOnId;
}

/// Validates step 2 and navigates to step 3 if valid.
final class ProceedToStep3 extends BookingWizardEvent {
  const ProceedToStep3();
}

// ── Step 3 ────────────────────────────────────────────────────────────────────

final class SelectProvider extends BookingWizardEvent {
  const SelectProvider({required this.providerId});
  final String providerId;
}

final class SelectScheduledAt extends BookingWizardEvent {
  const SelectScheduledAt({required this.scheduledAt});
  final DateTime scheduledAt;
}

/// Validates step 3 and navigates to the summary screen.
final class ProceedToSummary extends BookingWizardEvent {
  const ProceedToSummary();
}

// ── Submission ────────────────────────────────────────────────────────────────

final class SubmitBooking extends BookingWizardEvent {
  const SubmitBooking({
    required this.serviceId,
    required this.customerId,
    required this.addressId,
    required this.addressLatitude,
    required this.addressLongitude,
    required this.addressName,
  });

  final String serviceId;
  final String customerId;
  final String addressId;
  final double addressLatitude;
  final double addressLongitude;
  final String addressName;
}

// ── General ───────────────────────────────────────────────────────────────────

/// Resets the entire wizard back to its initial state.
final class ResetWizard extends BookingWizardEvent {
  const ResetWizard();
}
