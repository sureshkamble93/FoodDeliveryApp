import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/domain/api_repository.dart';
import 'package:food_delivery_app/screens/bloc/restaurant_event.dart';
import 'package:food_delivery_app/screens/bloc/resto_states.dart';

class RestaurantBloc extends Bloc<RestaurantEvent,RestoStates>{
  final ApiRepository repository;

  RestaurantBloc(this.repository):super(FoodInitial()){

    on<FetchRestaurantsEvent>((event,emit) async{
      emit(FoodLoading());
    try{
      final restaurants=await repository.fetchRestaurants();

      emit(FoodLoaded(restaurants));

    }catch(e){
      emit(FoodError(e.toString()));
    }
    });
  }
}