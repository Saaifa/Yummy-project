import 'package:flutter/material.dart';
import 'package:project/models/cart_manager.dart';
import 'package:project/models/order_manager.dart';

import 'package:project/models/restaurant.dart';
import 'package:project/screens/restaurant_page.dart';


class RestaurantLandscapeCard extends StatefulWidget {
  final Restaurant restaurant;
  final CartManager cartManager;
  final OrderManager orderManager;


  const RestaurantLandscapeCard({super.key,
  required this.restaurant,
    required this.cartManager,
    required this.orderManager
  });

  @override
  State<RestaurantLandscapeCard> createState() => _RestaurantLandscapeCardState();
}

class _RestaurantLandscapeCardState extends State<RestaurantLandscapeCard> {
  bool _isFavourited = false;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context)
        .textTheme
    .apply(displayColor: Theme.of(context).colorScheme.onSurface);
   return Card(
     child: Column(
       mainAxisSize: MainAxisSize.min,
       children: [
         ClipRRect(
           borderRadius: const BorderRadius.vertical(
             top: Radius.circular(8.0),
           ),
           child: AspectRatio(
             aspectRatio: 2,
             child: Stack(
               fit: StackFit.expand,
               children: [
                 Image.asset(widget.restaurant.imageUrl,
                 fit: BoxFit.cover,
                 ),
                 Positioned(
                   top: 4.0,
                   right: 4.0,
                   child: IconButton(
                     icon: Icon(
                       _isFavourited
                       ? Icons.favorite//
                       : Icons.favorite_border,
                     ),
                     iconSize: 30.0,
                     color: Colors.red[400],
                     onPressed: (){
                       setState(() {
                         _isFavourited = !_isFavourited;
                       });
                     },

                   ),
                 )
               ],
             ),
           ),
         ),
         ListTile(
           title: Text(
             widget.restaurant.name,
             style: textTheme.titleSmall,
           ),
           subtitle: Text(
             widget.restaurant.attributes,
             maxLines: 1,
             style: textTheme.bodySmall,
           ),
           onTap: (){
             Navigator.push(
                 context,
                 MaterialPageRoute(
                   builder: (context)=>
                       RestaurantPage(restaurant: widget.restaurant, cartManager: widget.cartManager,
                          ordersManager: widget.orderManager,
                       ),
                 )
             );
           },
         )
       ],
     ),
   );
  }
}
