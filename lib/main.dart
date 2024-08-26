import 'package:flutter/material.dart';
import 'package:project/models/order_manager.dart';
import 'package:project/models/cart_manager.dart';
import 'constant.dart';
import 'home.dart';
void main() {
  runApp(const Yummy());
}

class Yummy extends StatefulWidget {
  const Yummy({super.key});

  @override
  State<Yummy> createState() => _YummyState();
}

class _YummyState extends State<Yummy> {
  ThemeMode themeMode = ThemeMode.light;
  ColorSelection colorSelected = ColorSelection.purple;
  final CartManager _cartManager = CartManager();
  final OrderManager _orderManager = OrderManager();
  void changeThemeMode(bool useLightMode) {
    setState(() {
      themeMode = useLightMode? ThemeMode.light : ThemeMode.dark;

    });

  }

  void changeColor(int value){
    setState(() {
      colorSelected = ColorSelection.values[value];

    });
  }

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Bistro';

    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
        theme: ThemeData(
      colorSchemeSeed: colorSelected.color,
      useMaterial3: true,
      brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: colorSelected.color,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),

      home: Home(
        appTitle: appTitle,
        cartManager: _cartManager,
        ordersManager: _orderManager,
        changeTheme: changeThemeMode,
        changeColor: changeColor,
        colorSelected: colorSelected,
      ),

    );

  }
}
