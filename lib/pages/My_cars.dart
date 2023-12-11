
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_car_rent_1/components/rented_cars_provider.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class My_cars extends StatelessWidget {
  const My_cars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      final userUID = user.uid;

      return Scaffold(
        appBar: AppBar(
          title: const Text('My Cars'),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('UserRentedCars')
              .doc(userUID)
              .collection('RentedCars')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final rentedCarsDocs = snapshot.data!.docs;

              return ListView.builder(
                itemCount: rentedCarsDocs.length,
                itemBuilder: (context, index) {
                  final rentedCar = rentedCarsDocs[index].data()
                      as Map<String, dynamic>;

                  return ListTile(
                    title: Text(rentedCar['model'] ?? ''),
                    subtitle: Column(
                      children: [
                        Text(rentedCar['characteristics'] ?? ''),
                      ],
                    ),
                    leading: Image.network(
                      rentedCar['imageUrl'] ?? '',
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {
                       
                        final rentedCarsProvider =
                            Provider.of<RentedCarsProvider>(context, listen: false);

                     
                        final DocumentSnapshot rentedCarSnapshot = rentedCarsDocs[index];
                        final Map<String, dynamic>? rentedCarData = rentedCarSnapshot.data() as Map<String, dynamic>?;

                        if (rentedCarData != null) {
       
                          final Map<String, String> rentedCar = {
                            'model': rentedCarData['model'].toString(),
                            'characteristics': rentedCarData['characteristics'].toString(),
                          };

                          rentedCarsProvider.removeRentedCar(rentedCar);

                          FirebaseFirestore.instance
                              .collection('UserRentedCars')
                              .doc(userUID)
                              .collection('RentedCars')
                              .doc(rentedCarSnapshot.id)
                              .delete();
                        }
                      },

                      child: const Text('Remove'),
                    ),
                  );
                },
              );
            }
          },
        ),
      );
    } else {
      return const Center(
        child: Text('User not authenticated'),
      );
    }
  }
}
