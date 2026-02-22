import 'product_dto.dart';
import 'routine_step_dto.dart';

class ProductRepository {
  // Демо-JSON (как будто от бэка)
  List<Map<String, dynamic>> get _productsJson => [
        {
          "id": 1,
          "name": "Gentle Cleanser",
          "brand": "GlowLab",
          "category": "skincare",
          "imageUrl": "https://images.unsplash.com/photo-1611930022073-b7a4ba5fcccd?auto=format&fit=crop&w=900&q=60",
          "openedAt": DateTime.now().subtract(const Duration(days: 20)).toIso8601String(),
          "pAoMonths": 12,
          "price": 18.99
        },
        {
          "id": 2,
          "name": "Hydrating Toner",
          "brand": "AquaSkin",
          "category": "skincare",
          "imageUrl": "https://images.unsplash.com/photo-1612810806695-30f7a8252b4c?auto=format&fit=crop&w=900&q=60",
          "openedAt": DateTime.now().subtract(const Duration(days: 55)).toIso8601String(),
          "pAoMonths": 12,
          "price": 12.50
        },
        {
          "id": 3,
          "name": "Vitamin C Serum",
          "brand": "BrightCo",
          "category": "skincare",
          "imageUrl": "https://images.unsplash.com/photo-1611930022073-b7a4ba5fcccd?auto=format&fit=crop&w=900&q=60",
          "openedAt": DateTime.now().subtract(const Duration(days: 90)).toIso8601String(),
          "pAoMonths": 6,
          "price": 24.00
        },
        {
          "id": 4,
          "name": "Moisturizer Cream",
          "brand": "SoftCare",
          "category": "skincare",
          "imageUrl": "https://images.unsplash.com/photo-1620916566393-0f1f0f0d3f4c?auto=format&fit=crop&w=900&q=60",
          "openedAt": DateTime.now().subtract(const Duration(days: 10)).toIso8601String(),
          "pAoMonths": 12,
          "price": 19.75
        },
        {
          "id": 5,
          "name": "SPF 50 Sunscreen",
          "brand": "SunSafe",
          "category": "skincare",
          "imageUrl": "https://images.unsplash.com/photo-1620916566393-0f1f0f0d3f4c?auto=format&fit=crop&w=900&q=60",
          "openedAt": DateTime.now().subtract(const Duration(days: 130)).toIso8601String(),
          "pAoMonths": 12,
          "price": 15.00
        },
        {
          "id": 6,
          "name": "Repair Shampoo",
          "brand": "HairPro",
          "category": "haircare",
          "imageUrl": "https://images.unsplash.com/photo-1608571423539-e951b9fc3f2f?auto=format&fit=crop&w=900&q=60",
          "openedAt": DateTime.now().subtract(const Duration(days: 35)).toIso8601String(),
          "pAoMonths": 12,
          "price": 10.99
        },
        {
          "id": 7,
          "name": "Silky Conditioner",
          "brand": "HairPro",
          "category": "haircare",
          "imageUrl": "https://images.unsplash.com/photo-1608571423539-e951b9fc3f2f?auto=format&fit=crop&w=900&q=60",
          "openedAt": DateTime.now().subtract(const Duration(days: 40)).toIso8601String(),
          "pAoMonths": 12,
          "price": 11.49
        },
        {
          "id": 8,
          "name": "Hair Mask",
          "brand": "Nourish",
          "category": "haircare",
          "imageUrl": "https://images.unsplash.com/photo-1615396899839-c99c121888b0?auto=format&fit=crop&w=900&q=60",
          "openedAt": DateTime.now().subtract(const Duration(days: 170)).toIso8601String(),
          "pAoMonths": 6,
          "price": 14.20
        },
      ];

  List<Map<String, dynamic>> get _routineJson => [
        {"id": 1, "timeOfDay": "morning", "stepType": "cleanser", "productId": 1},
        {"id": 2, "timeOfDay": "morning", "stepType": "serum", "productId": 3},
        {"id": 3, "timeOfDay": "morning", "stepType": "cream", "productId": 4},
        {"id": 4, "timeOfDay": "morning", "stepType": "sunscreen", "productId": 5},
        {"id": 5, "timeOfDay": "evening", "stepType": "cleanser", "productId": 1},
        {"id": 6, "timeOfDay": "evening", "stepType": "toner", "productId": 2},
        {"id": 7, "timeOfDay": "evening", "stepType": "cream", "productId": 4},
        {"id": 8, "timeOfDay": "evening", "stepType": "hair mask", "productId": 8},
      ];

  List<ProductDto> getProducts() => _productsJson.map(ProductDto.fromJson).toList();

  ProductDto? getById(int id) {
    final all = getProducts();
    for (final p in all) {
      if (p.id == id) return p;
    }
    return null;
  }

  List<RoutineStepDto> getRoutineSteps(String timeOfDay) {
    final list = _routineJson.map(RoutineStepDto.fromJson).toList();
    return list.where((s) => s.timeOfDay == timeOfDay).toList();
  }
}