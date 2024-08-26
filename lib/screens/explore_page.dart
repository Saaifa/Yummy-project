import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project/api/mock_yummy_service.dart';
import 'package:project/components/restuarant_section.dart';
import 'package:project/components/category_section.dart';
import 'package:project/components/post_section.dart';
import 'package:project/models/order_manager.dart';
import 'package:project/models/cart_manager.dart';

class ExplorePage extends StatelessWidget {
  final mockService = MockYummyService();
  final CartManager cartManager;
  final OrderManager orderManager;

   ExplorePage({super.key,
   required this.cartManager,
   required this.orderManager});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
// 2
      future: mockService.getExploreData(),
// 3
      builder: (context, AsyncSnapshot<ExploreData> snapshot) {
// 4
        if (snapshot.connectionState == ConnectionState.done) {
// 5
          final restaurants = snapshot.data?.restaurants ?? [];
          final categories = snapshot.data?.categories ?? [];
          final posts = snapshot.data?.friendPosts ?? [];

          // TODO: Wrap in a ListView
          return ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              RestaurantSection(restaurants: restaurants,
                cartManager: cartManager,
                orderManager: orderManager,),
              CategorySection(categories: categories),
              PostSection(posts: posts),


              // Container(
              //   height: 300,
              //   // color: Colors.green,
              // ),
              //
              // Container(
              //   height: 300,
              //   // color: Colors.orange,
              // )
            ],
          );
          //
          //   RestaurantSection(restaurants: restaurants);
          // return const Center(
          //   child: SizedBox(
          //     child: Text('Show RestaurantSection'),
          //   ),
          // );
        }
        else {
// 6
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
