import 'dart:convert';

import 'package:food_delivery_app/data/model/restaurant_model.dart';
import 'package:http/http.dart'as http;

class ApiService {
  final http.Client client;
  ApiService(this.client);

  Future <List<RestaurantModel>> getRestaurants() async {
    final url= Uri.parse('https://mocki.io/v1/524abf70-4c78-483c-8e04-c3468d388bc3');

    final response =await client.get(url);

    if(response.statusCode==200){
      final data= jsonDecode(response.body);

      List restaurants=data['data'];

      return  restaurants.map((e)=> RestaurantModel.fromJson(e)).toList();
    }else{
      throw Exception("Failed to get restaurants");
    }

  }
}