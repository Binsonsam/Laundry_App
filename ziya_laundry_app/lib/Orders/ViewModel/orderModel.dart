
import 'package:flutter/material.dart';

enum OrderState {
  completed,
  live,
  pending,
}

class OrderStep {
  final String title;
  final String description;
  final String statusText;
  final String gif;
  final IconData icon;
  final OrderState state;

  OrderStep({
    required this.title,
    required this.description,
    required this.statusText,
    required this.gif,
    required this.icon,
    required this.state,
  });
}