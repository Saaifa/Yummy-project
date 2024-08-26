import 'package:flutter/material.dart';

enum ColorSelection{
  deepPurple('Deep Purple', Colors.deepPurple),
  orange('Orange', Colors.orange),
  red('Red', Colors.red),
  blue('Blue', Colors.blue),
  green('Green', Colors.green),
  pink('Pink', Colors.pink),
  yellow('yellow', Colors.yellow),
  teal('Teal', Colors.teal),
  purple('Purple', Colors.purple),
  indigo('Indigo', Colors.indigo),
  deepOrange('Deep Orange', Colors.deepOrange);

  const ColorSelection(this.label, this.color);
  final String label;
  final Color color;
}

