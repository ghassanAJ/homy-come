import 'package:booking/booking.dart';
import 'package:injectable/injectable.dart';

part 'booking_wizard_event.dart';

@injectable
class BookingWizardBloc extends Bloc<BookingWizardEvent, BookingWizardState> {
  BookingWizardBloc(this._repository) : super(const BookingWizardState()) {
    on<LoadServiceDetails>(_onLoadServiceDetails);
    on<ToggleAddOnFromServiceDetails>(_onToggleAddOnFromServiceDetails);
    on<ProceedToStep1>(_onProceedToStep1);
    on<UpdateDurationHours>(_onUpdateDurationHours);
    on<UpdateProfessionalCount>(_onUpdateProfessionalCount);
    on<UpdateNeedCleaningMaterials>(_onUpdateNeedCleaningMaterials);
    on<UpdateNotes>(_onUpdateNotes);
    on<ProceedToStep2>(_onProceedToStep2);
    on<ToggleAddOn>(_onToggleAddOn);
    on<ProceedToStep3>(_onProceedToStep3);
    on<SelectProvider>(_onSelectProvider);
    on<SelectScheduledAt>(_onSelectScheduledAt);
    on<ProceedToSummary>(_onProceedToSummary);
    on<SubmitBooking>(_onSubmitBooking);
    on<ResetWizard>(_onResetWizard);
  }

  final BookingRepository _repository;

  // ── Step 0 ──────────────────────────────────────────────────────────────────

  Future<void> _onLoadServiceDetails(
    LoadServiceDetails event,
    Emitter<BookingWizardState> emit,
  ) async {
    emit(
      state.copyWith(serviceDetailsLoading: true, serviceDetailsError: null),
    );

    final result =
        await GetServiceDetailsUseCase(
          _repository,
          GetServiceDetailsRequestModel(serviceId: event.serviceId),
        ).call();

    result.fold(
      (data) => emit(
        state.copyWith(serviceDetailsLoading: false, serviceDetails: data),
      ),
      (error) => emit(
        state.copyWith(
          serviceDetailsLoading: false,
          serviceDetailsError: error,
        ),
      ),
    );
  }

  void _onToggleAddOnFromServiceDetails(
    ToggleAddOnFromServiceDetails event,
    Emitter<BookingWizardState> emit,
  ) {
    final current = List<AddOnServiceModel>.from(state.selectedAddOns);
    if (current.contains(event.addOnId)) {
      current.remove(event.addOnId);
    } else {
      current.add(event.addOnId);
    }

    emit(
      state.copyWith(
        selectedAddOns: current,
        // total: state.total + (event.addOnId.price.currentPrice ?? 0.0),
        // totalAfterDiscount:
        //     state.totalAfterDiscount + (event.addOnId.price.newPrice ?? 0.0),
      ),
    ); //TODO
  }

  void _onProceedToStep1(
    ProceedToStep1 event,
    Emitter<BookingWizardState> emit,
  ) {
    if (state.serviceDetails == null) return;
    emit(state.copyWith(currentStep: BookingWizardStep.hoursStep));
  }

  // ── Step 1 ──────────────────────────────────────────────────────────────────

  void _onUpdateDurationHours(
    UpdateDurationHours event,
    Emitter<BookingWizardState> emit,
  ) => emit(
    state.copyWith(durationHours: event.hours, step1ValidationError: null),
  );

  void _onUpdateProfessionalCount(
    UpdateProfessionalCount event,
    Emitter<BookingWizardState> emit,
  ) => emit(
    state.copyWith(professionalCount: event.count, step1ValidationError: null),
  );

  void _onUpdateNeedCleaningMaterials(
    UpdateNeedCleaningMaterials event,
    Emitter<BookingWizardState> emit,
  ) => emit(state.copyWith(needCleaningMaterials: event.value));

  void _onUpdateNotes(UpdateNotes event, Emitter<BookingWizardState> emit) =>
      emit(state.copyWith(notes: event.notes));

  void _onProceedToStep2(
    ProceedToStep2 event,
    Emitter<BookingWizardState> emit,
  ) {
    if (!state.canAdvanceFromStep1) {
      emit(
        state.copyWith(
          step1ValidationError:
              'Please select duration hours and number of professionals.',
        ),
      );
      return;
    }
    emit(
      state.copyWith(
        currentStep: BookingWizardStep.popularsAddOn,
        step1ValidationError: null,
      ),
    );
  }

  // ── Step 2 ──────────────────────────────────────────────────────────────────

  void _onToggleAddOn(ToggleAddOn event, Emitter<BookingWizardState> emit) {
    final current = List<AddOnServiceModel>.from(state.selectedAddOns);
    if (current.contains(event.addOnId)) {
      current.remove(event.addOnId);
    } else {
      current.add(event.addOnId);
    }
    emit(state.copyWith(selectedAddOns: current, step2ValidationError: null));
  }

  void _onProceedToStep3(
    ProceedToStep3 event,
    Emitter<BookingWizardState> emit,
  ) {
    // Add-ons are optional – validation hook is available if needed.
    if (!state.canAdvanceFromStep2) {
      emit(state.copyWith(step2ValidationError: 'Please complete this step.'));
      return;
    }
    emit(
      state.copyWith(
        currentStep: BookingWizardStep.selectDateTimeStep,
        step2ValidationError: null,
      ),
    );
  }

  // ── Step 3 ──────────────────────────────────────────────────────────────────

  void _onSelectProvider(
    SelectProvider event,
    Emitter<BookingWizardState> emit,
  ) {
    emit(
      state.copyWith(
        selectedProviderIds: [event.providerId],
        step3ValidationError: null,
      ),
    );
  }

  void _onSelectScheduledAt(
    SelectScheduledAt event,
    Emitter<BookingWizardState> emit,
  ) => emit(
    state.copyWith(scheduledAt: event.scheduledAt, step3ValidationError: null),
  );

  void _onProceedToSummary(
    ProceedToSummary event,
    Emitter<BookingWizardState> emit,
  ) {
    if (!state.canAdvanceFromStep3) {
      emit(
        state.copyWith(
          step3ValidationError:
              'Please select a provider and a date & time slot.',
        ),
      );
      return;
    }
    emit(
      state.copyWith(
        currentStep: BookingWizardStep.summary,
        step3ValidationError: null,
      ),
    );
  }

  // ── Submission ───────────────────────────────────────────────────────────────

  Future<void> _onSubmitBooking(
    SubmitBooking event,
    Emitter<BookingWizardState> emit,
  ) async {
    if (!state.canAdvanceFromStep3) {
      emit(
        state.copyWith(
          step3ValidationError:
              'Please select a provider and a date & time slot.',
        ),
      );
      return;
    }

    emit(state.copyWith(isSubmitting: true, submitError: null));

    final request = CreateBookingRequestModel(
      scheduledAt: state.scheduledAt!,
      durationMinutes: state.durationHours * 60,
      finalPrice: (state.serviceDetails?.price.currentPrice ?? 0).toDouble(),
      commissionAmount: 0,
      providerEarning: 0,
      status: 'draft',
      service: event.serviceId,
      addOns: state.selectedAddOns.map((e) => e.id.toString()).toList(),
      customer: event.customerId,
      address: BookingAddressModel(
        id: event.addressId,
        latitude: event.addressLatitude,
        longitude: event.addressLongitude,
        name: event.addressName,
      ),
      providers: state.selectedProviderIds,
      needCleaningMaterials: state.needCleaningMaterials,
      specificInstructions: state.notes.isEmpty ? null : state.notes,
    );

    final result = await CreateBookingUseCase(_repository, request).call();

    result.fold(
      (_) => emit(state.copyWith(isSubmitting: false, submitSuccess: true)),
      (error) => emit(state.copyWith(isSubmitting: false, submitError: error)),
    );
  }

  // ── Reset ────────────────────────────────────────────────────────────────────

  void _onResetWizard(ResetWizard event, Emitter<BookingWizardState> emit) =>
      emit(const BookingWizardState());
}
