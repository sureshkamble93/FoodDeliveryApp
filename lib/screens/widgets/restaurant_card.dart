
import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/model/restaurant_model.dart';
import 'package:food_delivery_app/screens/widgets/custom_text.dart';

class RestaurantCard extends StatelessWidget {
  final RestaurantModel restaurantModel;

  const RestaurantCard(this.restaurantModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 150,
            width: double.infinity,
            child: Image.network(
              restaurantModel.image,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Icon(Icons.image_not_supported),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: restaurantModel.name,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),

                const SizedBox(height: 4),

                CustomText(
                  text: restaurantModel.type,
                  fontSize: 14,
                  color: Colors.grey,
                ),

                const SizedBox(height: 8),

                Row(
                  children: [
                    Image.asset(
                      'assets/images/star.png',
                      height: 18,
                      width: 18,
                    ),
                    const SizedBox(width: 5),
                    CustomText(
                      text: restaurantModel.rating.toString(),
                      fontSize: 14,
                    ),
                    const Spacer(),
                    CustomText(
                      text: restaurantModel.estDeliveryTime,
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
