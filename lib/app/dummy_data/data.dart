// Dummy expense data
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final List<Map<String, dynamic>> recentTransactions = [
  {
    'title': 'Grocery Shopping',
    'amount': 58.20,
    'date': DateTime.now().subtract(const Duration(days: 1)),
    'category': 'Food',
    'icon': FontAwesomeIcons.cartShopping,
    'color': const Color(0xFF6C63FF),
  },
  {
    'title': 'Netflix Subscription',
    'amount': 15.99,
    'date': DateTime.now().subtract(const Duration(days: 2)),
    'category': 'Entertainment',
    'icon': FontAwesomeIcons.tv,
    'color': const Color(0xFFFF6584),
  },
  {
    'title': 'Uber Ride',
    'amount': 24.50,
    'date': DateTime.now().subtract(const Duration(days: 3)),
    'category': 'Transport',
    'icon': FontAwesomeIcons.car,
    'color': const Color(0xFF4ECDC4),
  },
  {
    'title': 'Coffee Shop',
    'amount': 8.75,
    'date': DateTime.now().subtract(const Duration(days: 3)),
    'category': 'Food',
    'icon': FontAwesomeIcons.mugHot,
    'color': const Color(0xFFFFAA33),
  },
  {
    'title': 'Phone Bill',
    'amount': 45.00,
    'date': DateTime.now().subtract(const Duration(days: 5)),
    'category': 'Utilities',
    'icon': FontAwesomeIcons.mobileScreen,
    'color': const Color(0xFF6C63FF),
  },
];

// Dummy spending by category data
final List<Map<String, dynamic>> spendingByCategory = [
  {
    'category': 'Food',
    'amount': 350.50,
    'color': const Color(0xFF6C63FF),
    'icon': FontAwesomeIcons.utensils,
  },
  {
    'category': 'Transport',
    'amount': 175.30,
    'color': const Color(0xFF4ECDC4),
    'icon': FontAwesomeIcons.bus,
  },
  {
    'category': 'Entertainment',
    'amount': 120.75,
    'color': const Color(0xFFFF6584),
    'icon': FontAwesomeIcons.film,
  },
  {
    'category': 'Utilities',
    'amount': 210.20,
    'color': const Color(0xFFFFAA33),
    'icon': FontAwesomeIcons.bolt,
  },
];

// Example categories and wallets
final List<String> categories = [
  'Food',
  'Transport',
  'Entertainment',
  'Shopping',
  'Utilities'
];
final List<String> wallets = [
  'Mpesa',
  'Cash',
  'Credit Card',
  'Debit Card',
  'Savings'
];

// Monthly spending data
final List<double> monthlyData = [1250, 1420, 1350, 1250, 1600, 1780];
