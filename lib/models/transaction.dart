import 'package:flutter/material.dart';

class Transaction{
  final double amount;
  final DateTime date;
  final String id;
  final String title;

  Transaction({
  required this.id,
  required this.title,
  required this.amount,
  required this.date
  });
}