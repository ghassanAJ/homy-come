import 'dart:developer';

import 'package:booking/booking.dart';
import 'package:injectable/injectable.dart';
import 'package:user/features/home/domain/repository/home_api_repository.dart';
import 'package:user/features/home/presentation/bloc/home_bloc_event.dart';
import 'package:user/features/home/presentation/bloc/home_bloc_state.dart';

const cacheAvailable = false;

@lazySingleton
class HomeBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  HomeBloc(this._homeRepository, this._bookingRepository)
    : super(const HomeBlocState.initial()) {
    on<HomeBlocEvent>((event, emit) async {
      await switch (event) {
        LoadHomeContentEvent() => _loadCategories(event, emit),
        LoadSlidersEvent() => _loadSliders(event, emit),
        LoadOffersEvent() => _loadOffers(event, emit),
        LoadStoriesEvent() => _loadStories(event, emit),
        LoadSearchContentEvent() => _loadSearchContent(event, emit),
        LoadServiceDetailsEvent() => _loadServiceDetails(event, emit),
        LoadCategoryServicesEvent() => _loadCategoryServices(event, emit),
      };
    });
  }

  final HomeRepository _homeRepository;
  final BookingRepository _bookingRepository;

  final Map<String, ServiceDetailsResponseModel> _serviceDetailsCache = {};

  Future<void> _loadCategories(
    LoadHomeContentEvent event,
    Emitter<HomeBlocState> emit,
  ) async {
    emit(
      state.copyWith(
        categoriesLoading: true,
        slidersLoading: true,
        offersLoading: true,
      ),
    );
    final result = await _homeRepository.getCategories();
    result.fold(
      (data) => emit(
        state.copyWith(
          categories: data,
          categoriesLoading: false,
          slidersLoading: false,
          offersLoading: false,
          status: HomeBlocStatus.success,
          error: null,
        ),
      ),
      (error) => emit(
        state.copyWith(
          error: error,
          categoriesLoading: false,
          slidersLoading: false,
          offersLoading: false,
          status: HomeBlocStatus.error,
        ),
      ),
    );
  }

  Future<void> _loadSliders(
    LoadSlidersEvent event,
    Emitter<HomeBlocState> emit,
  ) async {
    emit(state.copyWith(slidersLoading: true));
    final result = await _homeRepository.getSliders();
    result.fold(
      (data) => emit(
        state.copyWith(
          sliders: data,
          slidersLoading: false,
          status: HomeBlocStatus.success,
          error: null,
        ),
      ),
      (error) => emit(
        state.copyWith(
          error: error,
          slidersLoading: false,
          status: HomeBlocStatus.error,
        ),
      ),
    );
  }

  Future<void> _loadOffers(
    LoadOffersEvent event,
    Emitter<HomeBlocState> emit,
  ) async {
    emit(state.copyWith(offersLoading: true));
    final result = await _homeRepository.getOffers();
    result.fold(
      (data) => emit(
        state.copyWith(
          offers: data,
          offersLoading: false,
          status: HomeBlocStatus.success,
          error: null,
        ),
      ),
      (error) => emit(
        state.copyWith(
          error: error,
          offersLoading: false,
          status: HomeBlocStatus.error,
        ),
      ),
    );
  }

  Future<void> _loadSearchContent(
    LoadSearchContentEvent event,
    Emitter<HomeBlocState> emit,
  ) async {
    emit(state.copyWith(searchContentLoading: true));
    final result = await _homeRepository.getSearchContent(event.qwery);
    result.fold(
      (data) => emit(
        state.copyWith(
          searchContent: data,
          searchContentLoading: false,
          categoryServices: data.services,
          status: HomeBlocStatus.success,
          error: null,
        ),
      ),
      (error) => emit(
        state.copyWith(
          error: error,
          searchContentLoading: false,
          status: HomeBlocStatus.error,
        ),
      ),
    );
  }

  Future<void> _loadServiceDetails(
    LoadServiceDetailsEvent event,
    Emitter<HomeBlocState> emit,
  ) async {
    final cached = _serviceDetailsCache[event.request.serviceId];
    if (cached != null) {
      emit(
        state.copyWith(
          serviceDetails: cached,
          serviceDetailsLoading: false,
          status: HomeBlocStatus.success,
          error: null,
        ),
      );
      return;
    }

    emit(state.copyWith(serviceDetailsLoading: true));
    final result = await _bookingRepository.getServiceDetails(event.request);
    result.fold(
      (data) {
        if (cacheAvailable) {
          _serviceDetailsCache[event.request.serviceId] = data;
        }
        emit(
          state.copyWith(
            serviceDetails: data,
            serviceDetailsLoading: false,
            status: HomeBlocStatus.success,
            error: null,
          ),
        );
      },
      (error) => emit(
        state.copyWith(
          error: error,
          serviceDetailsLoading: false,
          status: HomeBlocStatus.error,
        ),
      ),
    );
  }

  Future<void> _loadCategoryServices(
    LoadCategoryServicesEvent event,
    Emitter<HomeBlocState> emit,
  ) async {
    // List<ServicePreviewResponseModel> currentServices = [];
    // if (state.categories.isNotEmpty) {
    //   currentServices =
    //       List.from(state.categories ?? [])
    //           .firstWhere((category) => category.id == event.categoryId)
    //           .servicePreviews;
    // }

    // emit(state.copyWith(categoryServices: currentServices));
    // emit(state.copyWith(categoryServices: currentServices));
    final result = await _homeRepository.getCategoryServices(event.categoryId);
    log('result: ${result.fold((data) => data, (error) => error)}');
    result.fold(
      (data) => emit(
        state.copyWith(
          categoryServices: [...data.services],
          status: HomeBlocStatus.success,
          error: null,
        ),
      ),
      (error) =>
          emit(state.copyWith(error: error, status: HomeBlocStatus.error)),
    );
  }

  Future<void> _loadStories(
    HomeBlocEvent event,
    Emitter<HomeBlocState> emit,
  ) async {
    emit(state.copyWith(storiesLoading: true));
    final result = await _homeRepository.getStories();
    result.fold(
      (data) => emit(
        state.copyWith(
          stories: data,
          storiesLoading: false,
          status: HomeBlocStatus.success,
          error: null,
        ),
      ),
      (error) => emit(
        state.copyWith(
          error: error,
          storiesLoading: false,
          status: HomeBlocStatus.error,
        ),
      ),
    );
  }
}
