import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CarDetailsPage extends StatelessWidget {
  final String model;
  final String imageUrl;
  final String characteristics;

  const CarDetailsPage({
    Key? key,
    required this.model,
    required this.imageUrl,
    required this.characteristics,
  }) : super(key: key);


  void onRentButtonPressed(BuildContext context) async {

    bool confirmed = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Rent'),
          content: const Text('Are you sure you want to rent this car?'),
          actions: [
            TextButton(
              onPressed: () {

                Navigator.of(context).pop(true);
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {

                Navigator.of(context).pop(false);
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );

    if (confirmed == true) {
      final user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        final userUID = user.uid;

        FirebaseFirestore.instance
            .collection('UserRentedCars')
            .doc(userUID)
            .collection('RentedCars')
            .add({
          'model': model,
          'imageUrl': imageUrl,
          'characteristics': characteristics,
        });
      }
      // ignore: use_build_context_synchronously
      Navigator.popUntil(context, ModalRoute.withName('/'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Details - $model'),
      ),
      body: Column(
        children: [
          Image.network(
            imageUrl,
            height: 200,
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
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              onRentButtonPressed(context);
            },
            child: const Text('Rent this car'),
          ),
        ],
      ),
    );
  }
}
