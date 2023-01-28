import 'package:flutter/material.dart';

class DogModel {
  late String status;
  late String message;
  DogModel({
    required this.status,
    required this.message,
  });
  factory DogModel.fromJson(Map<String, dynamic> json) {
    return DogModel(
      status: json['status'] ?? "",
      message: json['message'] ?? "",
    );
  }
}
