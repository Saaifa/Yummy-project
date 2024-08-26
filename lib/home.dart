import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/models/cart_manager.dart';
import 'package:project/screens/explore_page.dart';

import 'constant.dart';
import 'components/category_card.dart';
import 'components/post_card.dart';
import 'components/color_button.dart';
import 'components/restaurant_landscape_card.dart';
import 'components/theme_button.dart';
import 'models/food_category.dart';
import 'models/post.dart';
import 'models/restaurant.dart';
import 'models/cart_manager.dart';
import 'models/order_manager.dart';



class Home extends StatefulWidget {
  const Home({super.key,
  required this.changeTheme,
  required this.changeColor,
  required this.colorSelected,
  required this.appTitle,
    required this.cartManager,
     required this.ordersManager,
  });

  final CartManager cartManager;
  final OrderManager ordersManager;
  final ColorSelection colorSelected;
  final void Function(bool useLightMode) changeTheme;
  final void Function(int value) changeColor;
  final String appTitle;


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int tab = 0;
  List<NavigationDestination> appBarDestinations = const [
    NavigationDestination(
      icon: Icon(Icons.home),
      label: 'explore',
      selectedIcon: Icon(Icons.home),
    ),
    NavigationDestination(
        icon: Icon(Icons.format_list_bulleted),
        label: 'orders',
    selectedIcon: Icon(Icons.format_list_bulleted),
    ),
    NavigationDestination(icon: Icon(Icons.person),
        label: 'Account',
    selectedIcon: Icon(Icons.person),
    ),
  ];


  @override
  Widget build(BuildContext context) {
  final pages = [
    Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 300),
        child: ExplorePage(
          cartManager: widget.cartManager,
          orderManager: widget.ordersManager,
        ))),
    Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: PostCard(post: posts[0]))),
    Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400),
        child: RestaurantLandscapeCard(restaurant: restaurants[0],
          orderManager: widget.ordersManager,
          cartManager: widget.cartManager,))),


  ];
  return Scaffold(
    appBar: AppBar(
      title: Text(widget.appTitle),
      elevation: 4.0,
      backgroundColor: Theme.of(context).colorScheme.surface,
      actions: [
        ThemeButton(
          changeThemeMode: widget.changeTheme,
        ),
        ColorButton(
          changeColor: widget.changeColor,
          colorSelected: widget.colorSelected,
        ),
      ],
    ),

    body: IndexedStack(index: tab, children: pages),
    bottomNavigationBar: NavigationBar(
      selectedIndex: tab,
      onDestinationSelected: (index) {
        setState(() {
          tab = index;
        });
      },

      destinations: appBarDestinations,
    ),

    );
  }
}
