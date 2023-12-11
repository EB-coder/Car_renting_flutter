import 'package:flutter/material.dart';
import 'package:flutter_car_rent_1/pages/CarDetailsPage.dart';

class CarCard extends StatelessWidget {
  final String model;
  final String imageUrl;
  final String characteristics;

  const CarCard({
    Key? key,
    required this.model,
    required this.imageUrl,
    required this.characteristics,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(
            imageUrl,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          ListTile(
            title: Text(model),
            subtitle: Column(
              children: [
                Text(characteristics),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CarDetailsPage(
                    model: model,
                    imageUrl: imageUrl,
                    characteristics: characteristics,
                  ),
                ),
              );
            },
            child: const Text('Show'),
          ),
        ],
      ),
    );
  }
}
