import 'package:food_delivery_app/data/apiservice/apiservice.dart';
import 'package:food_delivery_app/data/model/restaurant_model.dart';

class ApiRepository {
  final ApiService apiService;

  ApiRepository(this.apiService);

  Future<List<RestaurantModel>> fetchRestaurants() async {
    return await apiService.getRestaurants();
  }
}
