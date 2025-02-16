import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rentmate/data/repositories/rental_repository_impl.dart';
import 'package:rentmate/domain/entities/rental_item.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final RentalRepositoryImpl _rentalRepository;
  List<RentalItem> _allItems = []; // Stores all fetched items

  HomeCubit(this._rentalRepository) : super(HomeInitial());

  void fetchRentalItems() async {
    emit(HomeLoading());
    try {
      final items = await _rentalRepository.fetchRentalItems();
      _allItems = items; // Store all items locally
      emit(HomeLoaded(items));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  void applyFilters(String query, double? minPrice, double? maxPrice) {
    List<RentalItem> filteredItems = _allItems;

    // Apply search query
    if (query.isNotEmpty) {
      filteredItems = filteredItems
          .where(
              (item) => item.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    // Apply price range
    if (minPrice != null) {
      filteredItems =
          filteredItems.where((item) => item.price >= minPrice).toList();
    }
    if (maxPrice != null) {
      filteredItems =
          filteredItems.where((item) => item.price <= maxPrice).toList();
    }

    emit(HomeLoaded(filteredItems));
  }
}
