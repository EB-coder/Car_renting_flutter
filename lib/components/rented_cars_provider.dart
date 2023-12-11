import 'package:flutter/material.dart';

class RentedCarsProvider extends ChangeNotifier {
  final List<Map<String, String>> _rentedCars = [];

  List<Map<String, String>> get rentedCars => _rentedCars;

  void addRentedCar(Map<String, String> car) {
    _rentedCars.add(car);
    notifyListeners();
  }

  void removeRentedCar(Map<String, String> car) {
    _rentedCars.remove(car);
    notifyListeners();
  }
}
