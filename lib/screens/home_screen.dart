import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/screens/bloc/restaurant_bloc.dart';
import 'package:food_delivery_app/screens/bloc/restaurant_event.dart';
import 'package:food_delivery_app/screens/bloc/resto_states.dart';
import 'package:food_delivery_app/screens/widgets/custom_text.dart';
import 'package:food_delivery_app/screens/widgets/restaurant_card.dart';
import 'package:food_delivery_app/screens/widgets/search_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<RestaurantBloc>().add(FetchRestaurantsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Deliver to'),
        leading: Image.asset('assets/images/menu_bar.png'),
        actions: [ Image.asset('assets/images/shopping_bag.png')],),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchBarWidget(controller: searchController, onChanged: (p0) {

            },),
            Padding(padding: EdgeInsets.all(10),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [CustomText(text: 'All Categories',fontSize: 20,),
                Row(children: [CustomText(text: 'See All',fontSize: 18,),
                IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)
                )])
          ],),),


            SizedBox(
              height: 55,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildCategory(
                    'assets/images/fire.png',
                    'All',
                  ),
                  _buildCategory(
                    'assets/images/hot_dog.png',
                    'Hot Dog',
                  ),
                  _buildCategory(
                    'assets/images/burger.png',
                    'Burger',
                  ),
                ],
              ),
            ),

            Padding(padding: EdgeInsets.all(10),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [CustomText(text: 'Open Restaurants',fontSize: 20,),
                Row(children: [CustomText(text: 'See All',fontSize: 18,),
                  IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)
                  )])
              ],),),

            BlocBuilder<RestaurantBloc,RestoStates>(builder: (context,state){
              if(state is FoodLoading){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if(state is FoodError){
                return  Center(
                  child: CustomText(text: state.message),
                );
              }

              if (state is FoodLoaded) {

                if (state.restaurants.isEmpty) {
                  return const Center(
                    child: Text('No restaurants found'),
                  );
                }

               return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.restaurants.length,
                  itemBuilder: (context, index) {
                    return RestaurantCard(state.restaurants[index]);
                  },
                );
              }

              return Center(child: ElevatedButton(onPressed: (){
                context.read<RestaurantBloc>().add(FetchRestaurantsEvent());

              }, child: CustomText(text: 'Load Data')),);
            })

          ],
    ),)
    ,
    );
  }
}


Widget _buildCategory(String image, String title) {
  return Container(
    margin: const EdgeInsets.only(right: 12),
    padding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 8,
    ),
    decoration: BoxDecoration(
      color: Colors.amberAccent.withOpacity(0.15),
      borderRadius: BorderRadius.circular(25),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          image,
          height: 25,
          width: 25,
        ),
        const SizedBox(width: 8),
        CustomText(
          text: title,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ],
    ),
  );
}

