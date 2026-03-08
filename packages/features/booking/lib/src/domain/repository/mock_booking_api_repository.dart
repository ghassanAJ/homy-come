import 'package:booking/booking.dart';
import 'package:injectable/injectable.dart';
import 'package:util/util.dart';

@Injectable(as: BookingRepository, env: ['mock'])
class MockBookingRepository implements BookingRepository {
  bool failNextGetServiceDetails = false;

  @override
  Future<Result<ServiceDetailsResponseModel, APIException>> getServiceDetails(
    GetServiceDetailsRequestModel request,
  ) async {
    if (failNextGetServiceDetails) {
      failNextGetServiceDetails = false;
      return failure(APIException.error('Mock getServiceDetails failure'));
    }

    await Future.delayed(const Duration(milliseconds: 500));
    return success(_mockServiceDetails);
  }
}

// ---------------------------------------------------------------------------
// Shared image assets (same CDN links used in home_mock_data.dart)
// ---------------------------------------------------------------------------
const _imgHomeCleaning = 'https://i.ibb.co/vCPn6j6p/Home-Cleaning.jpg';
const _imgFurnitureCleaning =
    'https://i.ibb.co/ynSmvwph/Furniture-Cleaning.jpg';
const _imgKitchenCleaning =
    'https://i.ibb.co/Q7LbN1HF/Complete-Kitchen-Cleaning.png';
const _imgDeepCleaning = 'https://i.ibb.co/YFcNnFFp/Home-Deep-Cleaning.jpg';
const _imgPlumber = 'https://i.ibb.co/7tgS7hR6/Plumber-service-1.jpg';

// ---------------------------------------------------------------------------
// Helper — builds a uniform AddOnServiceModel for a given category
// ---------------------------------------------------------------------------
AddOnServiceModel _service({
  required String id,
  required String name,
  required String image,
  required double currentPrice,
  required double newPrice,
  int durationMinutes = 60,
}) => AddOnServiceModel(
  id: id,
  documentId: id,
  durationMinutes: durationMinutes,
  info: InfoModel(id: id, name: name, image: image),
  price: ServicePriceModel(currentPrice: currentPrice, newPrice: newPrice),
);

// ---------------------------------------------------------------------------
// Mock service-details response
// ---------------------------------------------------------------------------
final ServiceDetailsResponseModel _mockServiceDetails =
    ServiceDetailsResponseModel(
      id: 'home-deep-cleaning',
      rating: 5,
      reviewsCount: 331,
      info: InfoModel(
        id: 'home-deep-cleaning',
        name: 'Home Deep Cleaning',
        description:
            'Professional deep cleaning for every corner of your home.',
        image: _imgDeepCleaning,
      ),
      price: ServicePriceModel(
        currentPrice: 89,
        newPrice: 120,
        currency: 'USD',
      ),
      categories: [
        // ── 1. Standard Cleaning ───────────────────────────────────────────
        AddOnCategoryModel(
          id: 'cat-1',
          documentId: 'cat-1',
          info: const InfoModel(
            id: 'cat-1',
            name: 'Standard Cleaning',
            description: 'Everyday essentials to keep your home fresh.',
          ),
          services: [
            _service(
              id: 's-1-1',
              name: 'Living Room Clean',
              image: _imgHomeCleaning,
              currentPrice: 25,
              newPrice: 35,
            ),
            _service(
              id: 's-1-2',
              name: 'Bedroom Clean',
              image: _imgHomeCleaning,
              currentPrice: 20,
              newPrice: 28,
            ),
            _service(
              id: 's-1-3',
              name: 'Bathroom Scrub',
              image: _imgDeepCleaning,
              currentPrice: 18,
              newPrice: 25,
              durationMinutes: 45,
            ),
          ],
        ),

        // ── 2. Kitchen Cleaning ────────────────────────────────────────────
        AddOnCategoryModel(
          id: 'cat-2',
          documentId: 'cat-2',
          info: const InfoModel(
            id: 'cat-2',
            name: 'Kitchen Cleaning',
            description: 'Degreasing, cabinet wipe-down, and appliance clean.',
          ),
          services: [
            _service(
              id: 's-2-1',
              name: 'Full Kitchen Clean',
              image: _imgKitchenCleaning,
              currentPrice: 45,
              newPrice: 60,
              durationMinutes: 90,
            ),
            _service(
              id: 's-2-2',
              name: 'Oven & Hob Deep Clean',
              image: _imgKitchenCleaning,
              currentPrice: 30,
              newPrice: 40,
              durationMinutes: 75,
            ),
            _service(
              id: 's-2-3',
              name: 'Refrigerator Clean',
              image: _imgKitchenCleaning,
              currentPrice: 20,
              newPrice: 28,
              durationMinutes: 45,
            ),
            _service(
              id: 's-2-4',
              name: 'Cabinet & Pantry Wipe',
              image: _imgKitchenCleaning,
              currentPrice: 15,
              newPrice: 22,
              durationMinutes: 30,
            ),
          ],
        ),

        // ── 3. Furniture Cleaning ──────────────────────────────────────────
        AddOnCategoryModel(
          id: 'cat-3',
          documentId: 'cat-3',
          info: const InfoModel(
            id: 'cat-3',
            name: 'Furniture Cleaning',
            description: 'Sofa, mattress, and upholstery deep treatment.',
          ),
          services: [
            _service(
              id: 's-3-1',
              name: 'Sofa Steam Clean',
              image: _imgFurnitureCleaning,
              currentPrice: 55,
              newPrice: 75,
              durationMinutes: 120,
            ),
            _service(
              id: 's-3-2',
              name: 'Mattress Sanitisation',
              image: _imgFurnitureCleaning,
              currentPrice: 40,
              newPrice: 55,
              durationMinutes: 90,
            ),
            _service(
              id: 's-3-3',
              name: 'Chair & Ottoman Clean',
              image: _imgFurnitureCleaning,
              currentPrice: 25,
              newPrice: 35,
              durationMinutes: 60,
            ),
          ],
        ),

        // ── 4. Window & Glass ──────────────────────────────────────────────
        AddOnCategoryModel(
          id: 'cat-4',
          documentId: 'cat-4',
          info: const InfoModel(
            id: 'cat-4',
            name: 'Window & Glass',
            description: 'Streak-free interior and exterior window cleaning.',
          ),
          services: [
            _service(
              id: 's-4-1',
              name: 'Interior Windows (per room)',
              image: _imgHomeCleaning,
              currentPrice: 12,
              newPrice: 18,
              durationMinutes: 30,
            ),
            _service(
              id: 's-4-2',
              name: 'Exterior Windows',
              image: _imgHomeCleaning,
              currentPrice: 20,
              newPrice: 28,
              durationMinutes: 45,
            ),
            _service(
              id: 's-4-3',
              name: 'Glass Doors & Mirrors',
              image: _imgHomeCleaning,
              currentPrice: 10,
              newPrice: 15,
              durationMinutes: 20,
            ),
          ],
        ),

        // ── 5. Plumbing Add-ons ────────────────────────────────────────────
        AddOnCategoryModel(
          id: 'cat-5',
          documentId: 'cat-5',
          info: const InfoModel(
            id: 'cat-5',
            name: 'Plumbing Add-ons',
            description: 'Drain unclogging and fixture maintenance.',
          ),
          services: [
            _service(
              id: 's-5-1',
              name: 'Drain Unclogging',
              image: _imgPlumber,
              currentPrice: 35,
              newPrice: 50,
              durationMinutes: 45,
            ),
            _service(
              id: 's-5-2',
              name: 'Tap & Faucet Service',
              image: _imgPlumber,
              currentPrice: 25,
              newPrice: 35,
              durationMinutes: 30,
            ),
          ],
        ),
      ],
    );
