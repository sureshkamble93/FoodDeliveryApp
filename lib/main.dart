import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/domain/api_repository.dart';
import 'package:food_delivery_app/screens/bloc/restaurant_bloc.dart';
import 'package:food_delivery_app/screens/bloc/restaurant_event.dart';
import 'package:food_delivery_app/screens/home_screen.dart';
import 'package:http/http.dart'as http;

import 'data/apiservice/apiservice.dart';

void main() {
  final client=http.Client();
  final apiService= ApiService(client);
  final repository= ApiRepository(apiService);
  runApp(MaterialApp(
    home: BlocProvider(create: (_)=> RestaurantBloc(repository)..add(FetchRestaurantsEvent()),child: HomeScreen(),),
  ));
}

