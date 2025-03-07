import 'package:flutter/material.dart';
import 'package:project/components/restaurant_landscape_card.dart';
import 'package:project/models/cart_manager.dart';
import 'package:project/models/order_manager.dart';
import 'package:project/models/restaurant.dart';

class RestaurantSection extends StatelessWidget {
  // 2
  final List<Restaurant> restaurants;
  final CartManager cartManager;
  final OrderManager orderManager;

  const RestaurantSection({
    super.key,
    required this.restaurants,
    required this.cartManager,
    required this.orderManager
  });

  @override
  Widget build(BuildContext context) {
    // 3
    return Padding(
        padding: const EdgeInsets.all(8.0),
    // 4
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    const Padding(
    padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
    // 5
      child: Text(
        'Food near me',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
// TODO: Add Restaurant List View
    SizedBox(
      height: 230,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: restaurants.length,
        itemBuilder: (context, index){
          return SizedBox(
            width: 300,

            child: RestaurantLandscapeCard(
              restaurant: restaurants[index],
              cartManager: cartManager,
              orderManager: orderManager,
            ),
          );
        },
      ),
    ),
//       Container(
//         height: 300,
// // TODO: Add ListView Here
//         color: Colors.grey,
//       ),
    ],
    ),
    );
  }
}