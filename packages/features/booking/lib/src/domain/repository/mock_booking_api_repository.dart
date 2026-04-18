import 'package:booking/booking.dart';
import 'package:injectable/injectable.dart';
import 'package:util/util.dart';

@Injectable(as: BookingRepository, env: ['mock'])
class MockBookingRepository implements BookingRepository {
  bool failNextGetServiceDetails = false;
  bool failNextCreateBooking = false;

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

  @override
  Future<Result<CreateBookingResponseModel, APIException>> createBooking(
    CreateBookingRequestModel request,
  ) async {
    if (failNextCreateBooking) {
      failNextCreateBooking = false;
      return failure(APIException.error('Mock createBooking failure'));
    }

    await Future.delayed(const Duration(milliseconds: 500));
    return success(
      CreateBookingResponseModel(
        scheduledAt: request.scheduledAt,
        durationMinutes: request.durationMinutes,
        finalPrice: request.finalPrice,
        commissionAmount: request.commissionAmount,
        providerEarning: request.providerEarning,
        status: 'draft',
        service: request.service,
        addOns: request.addOns,
        customer: request.customer,
        address: request.address,
        providers: request.providers,
        needCleaningMaterials: request.needCleaningMaterials,
        specificInstructions: request.specificInstructions,
      ),
    );
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
  id: int.tryParse(id) ?? 0,
  documentId: id,
  durationMinutes: durationMinutes,
  info: InfoModel(
    id: int.parse(id),
    name: name,
    image: image,
    description:
        'Reliable Door lock installation & repair for improved home safety & function ',
  ),
  price: ServicePriceModel(
    currentPrice: currentPrice,
    newPrice: newPrice,
    currency: 'AED',
    id: int.parse(id),
  ),
);

// ---------------------------------------------------------------------------
// Mock service-details response
// ---------------------------------------------------------------------------
final ServiceDetailsResponseModel _mockServiceDetails =
    ServiceDetailsResponseModel(
      id: int.parse('1'),
      rating: 5,
      reviewsCount: 331,
      info: InfoModel(
        id: 2,
        name: 'Home Deep Cleaning',
        description:
            'Professional deep cleaning for every corner of your home.',
        image: _imgDeepCleaning,
      ),
      price: ServicePriceModel(
        id: 1,
        currentPrice: 89,
        newPrice: 120,
        currency: 'USD',
      ),
      addonCategories: [
        // ── 1. Standard Cleaning ───────────────────────────────────────────
        AddOnCategoryModel(
          id: 1,
          documentId: 'cat-1',
          info: const InfoModel(
            id: 1,
            name: 'Standard Cleaning',
            description: 'Everyday essentials to keep your home fresh.',
          ),
          services: [
            _service(
              id: '1',
              name: 'Living Room Clean',

              image: _imgHomeCleaning,
              currentPrice: 25,
              newPrice: 35,
            ),
            _service(
              id: '2',
              name: 'Bedroom Clean',
              image: _imgHomeCleaning,
              currentPrice: 20,
              newPrice: 28,
            ),
            _service(
              id: '3',
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
          id: 2,
          documentId: '2',
          info: const InfoModel(
            id: 2,
            name: 'Kitchen Cleaning',
            description: 'Degreasing, cabinet wipe-down, and appliance clean.',
          ),
          services: [
            _service(
              id: '4',
              name: 'Full Kitchen Clean',
              image: _imgKitchenCleaning,
              currentPrice: 45,
              newPrice: 60,
              durationMinutes: 90,
            ),
            _service(
              id: '5',
              name: 'Oven & Hob Deep Clean',
              image: _imgKitchenCleaning,
              currentPrice: 30,
              newPrice: 40,
              durationMinutes: 75,
            ),
            _service(
              id: '6',
              name: 'Refrigerator Clean',
              image: _imgKitchenCleaning,
              currentPrice: 20,
              newPrice: 28,
              durationMinutes: 45,
            ),
            _service(
              id: '7',
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
          id: 3,
          documentId: '3',
          info: const InfoModel(
            id: 3,
            name: 'Furniture Cleaning',
            description: 'Sofa, mattress, and upholstery deep treatment.',
          ),
          services: [
            _service(
              id: '8',
              name: 'Sofa Steam Clean',
              image: _imgFurnitureCleaning,
              currentPrice: 55,
              newPrice: 75,
              durationMinutes: 120,
            ),
            _service(
              id: '9',
              name: 'Mattress Sanitisation',
              image: _imgFurnitureCleaning,
              currentPrice: 40,
              newPrice: 55,
              durationMinutes: 90,
            ),
            _service(
              id: '10',
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
          id: 4,
          documentId: '4',
          info: const InfoModel(
            id: 4,
            name: 'Window & Glass',
            description: 'Streak-free interior and exterior window cleaning.',
          ),
          services: [
            _service(
              id: '11',
              name: 'Interior Windows (per room)',
              image: _imgHomeCleaning,
              currentPrice: 12,
              newPrice: 18,
              durationMinutes: 30,
            ),
            _service(
              id: '12',
              name: 'Exterior Windows',
              image: _imgHomeCleaning,
              currentPrice: 20,
              newPrice: 28,
              durationMinutes: 45,
            ),
            _service(
              id: '13',
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
          id: 5,
          documentId: '5',
          info: const InfoModel(
            id: 5,
            name: 'Plumbing Add-ons',
            description: 'Drain unclogging and fixture maintenance.',
          ),
          services: [
            _service(
              id: '14',
              name: 'Drain Unclogging',
              image: _imgPlumber,
              currentPrice: 35,
              newPrice: 50,
              durationMinutes: 45,
            ),
            _service(
              id: '15',
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
