
import 'package:food_delivery_app/data/model/restaurant_model.dart';

abstract class RestoStates {}

class FoodInitial extends RestoStates{}

class FoodLoading extends RestoStates{}

class FoodLoaded extends RestoStates{
  final List<RestaurantModel> restaurants;
  FoodLoaded(this.restaurants);
}

class FoodError extends RestoStates{
  final String message;

  FoodError(this.message);
}

