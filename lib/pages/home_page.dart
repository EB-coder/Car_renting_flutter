import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_car_rent_1/components/my_drawer.dart';
import 'package:flutter_car_rent_1/components/car_model.dart';

class HomePage extends StatelessWidget {
  HomePage ({super.key});
  

  final user = FirebaseAuth.instance.currentUser!;


  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: const Text("W A L L"),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        centerTitle: true,
        actions: [IconButton(
        onPressed: signOut,
        icon: const Icon(Icons.logout),
          )
        ],
      ),
      drawer: MyDrawer(),
      body: const CarList(),
    );
  }
}

class CarList extends StatelessWidget {
  const CarList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('Cars').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          final carDocs = snapshot.data!.docs;
          return ListView.builder(
            itemCount: carDocs.length,
            itemBuilder: (context, index) {
              final car = carDocs[index].data() as Map<String, dynamic>;
              return CarCard(
                model: car['model'],
                imageUrl: car['imageUrl'],
                characteristics: car['characteristics'],
              );
            },
          );
        }
      },
    );
  }
}
