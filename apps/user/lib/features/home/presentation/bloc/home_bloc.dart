import 'package:booking/booking.dart';
import 'package:injectable/injectable.dart';
import 'package:user/features/home/domain/repository/home_api_repository.dart';
import 'package:user/features/home/presentation/bloc/home_bloc_event.dart';
import 'package:user/features/home/presentation/bloc/home_bloc_state.dart';

@lazySingleton
class HomeBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  HomeBloc(this._homeRepository, this._bookingRepository)
    : super(const HomeBlocState.initial()) {
    on<HomeBlocEvent>((event, emit) async {
      await switch (event) {
        LoadHomeContentEvent() => _loadHomeContent(event, emit),
        LoadSlidersEvent() => _loadSliders(event, emit),
        LoadOffersEvent() => _loadOffers(event, emit),
        LoadSearchContentEvent() => _loadSearchContent(event, emit),
        LoadServiceDetailsEvent() => _loadServiceDetails(event, emit),

        LoadCategoryServicesEvent() => _loadCategoryServices(event, emit),
      };
    });
  }

  final HomeRepository _homeRepository;

  final BookingRepository _bookingRepository;

  Future<void> _loadHomeContent(
    LoadHomeContentEvent event,
    Emitter<HomeBlocState> emit,
  ) async {
    emit(state.copyWith(status: HomeBlocStatus.loadingCategories));
    final result = await _homeRepository.getHomeContent();
    result.fold(
      (data) => emit(
        state.copyWith(
          categories: data.categories,
          offers: data.offers,
          sliders: data.sliders,
          status: HomeBlocStatus.success,
          error: null,
        ),
      ),
      (error) =>
          emit(state.copyWith(error: error, status: HomeBlocStatus.error)),
    );
  }

  Future<void> _loadSliders(
    LoadSlidersEvent event,
    Emitter<HomeBlocState> emit,
  ) async {
    emit(state.copyWith(status: HomeBlocStatus.loadingSliders));
    final result = await _homeRepository.getHomeContent();
    result.fold(
      (data) => emit(
        state.copyWith(
          sliders: data.sliders,
          status: HomeBlocStatus.success,
          error: null,
        ),
      ),
      (error) =>
          emit(state.copyWith(error: error, status: HomeBlocStatus.error)),
    );
  }

  Future<void> _loadOffers(
    LoadOffersEvent event,
    Emitter<HomeBlocState> emit,
  ) async {
    emit(state.copyWith(status: HomeBlocStatus.loadingOffers));
    final result = await _homeRepository.getHomeContent();
    result.fold(
      (data) => emit(
        state.copyWith(
          offers: data.offers,
          status: HomeBlocStatus.success,
          error: null,
        ),
      ),
      (error) =>
          emit(state.copyWith(error: error, status: HomeBlocStatus.error)),
    );
  }

  Future<void> _loadSearchContent(
    LoadSearchContentEvent event,
    Emitter<HomeBlocState> emit,
  ) async {
    emit(state.copyWith(status: HomeBlocStatus.loadingSearchContent));
    final result = await _homeRepository.getSearchContent();
    result.fold(
      (data) => emit(
        state.copyWith(
          searchContent: data,
          status: HomeBlocStatus.success,
          error: null,
        ),
      ),
      (error) =>
          emit(state.copyWith(error: error, status: HomeBlocStatus.error)),
    );
  }

  Future<void> _loadServiceDetails(
    LoadServiceDetailsEvent event,
    Emitter<HomeBlocState> emit,
  ) async {
    emit(state.copyWith(status: HomeBlocStatus.loadingServiceDetails));
    final result = await _bookingRepository.getServiceDetails(event.request);
    result.fold(
      (data) => emit(
        state.copyWith(
          serviceDetails: data,
          status: HomeBlocStatus.success,
          error: null,
        ),
      ),
      (error) =>
          emit(state.copyWith(error: error, status: HomeBlocStatus.error)),
    );
  }

  Future<void> _loadCategoryServices(
    LoadCategoryServicesEvent event,
    Emitter<HomeBlocState> emit,
  ) async {
    final List<ServicePreviewResponseModel> currentServices =
        List.from(state.categories)
            .firstWhere((category) => category.id == event.categoryId)
            .servicePreviews;
    emit(state.copyWith(categoryServices: currentServices));
    final result = await _homeRepository.getCategoryServices(event.categoryId);
    result.fold(
      (data) => emit(
        state.copyWith(
          categoryServices: [...currentServices, ...data],
          status: HomeBlocStatus.success,
          error: null,
        ),
      ),
      (error) =>
          emit(state.copyWith(error: error, status: HomeBlocStatus.error)),
    );
  }
}
