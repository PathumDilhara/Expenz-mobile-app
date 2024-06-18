// enum for expense category
import 'package:flutter/material.dart';

enum ExpenseCategory {
  food,
  transport,
  health,
  shopping,
  subscription,
}

// category images
final Map<ExpenseCategory, String> expenseCategoryImages = {
  ExpenseCategory.food: "assets/images/restaurant.png",
  ExpenseCategory.transport: "assets/images/car.png",
  ExpenseCategory.health: "assets/images/health.png",
  ExpenseCategory.shopping: "assets/images/bag.png",
  ExpenseCategory.subscription: "assets/images/bill.png",
};

// category colors
final Map<ExpenseCategory, Color> categoryColors = {
  ExpenseCategory.food: const Color(0xFFE57373),
  ExpenseCategory.transport: const Color(0xFF81C784),
  ExpenseCategory.health: const Color(0xFF64B5F6),
  ExpenseCategory.shopping: const Color(0xFFFFD54F),
  ExpenseCategory.subscription: const Color(0xFF9575CD),
};

// model for expense
class Expense {
  final int id;
  final String title;
  final double amount;
  final ExpenseCategory category;
  final DateTime date;
  final DateTime time;
  final String description;

  Expense({
    required this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
    required this.time,
    required this.description,
  });

  // Convert Expense obj to JSON obj/format / JSON Serialization
  Map<String, dynamic> toJSON() {
    return {
      "id": id,
      "title": title,
      "amount": amount,
      "category": category.index,
      "date": date.toIso8601String(),
      "time": time.toIso8601String(),
      "description": description,
    };
  }

  // Create Expense obj from JSON obj / JSON Deserialization
  factory Expense.fromJSON(Map<String, dynamic> json) {
    return Expense(
      id: json["id"],
      title: json ["title"],
      amount: json ["amount"],
      category: ExpenseCategory.values[json["category"]], //  we stored category as index
      date: DateTime.parse(json["Date"]),
      time: DateTime.parse(json["time"]),
      description: json ["description"],
    );
  }
}
