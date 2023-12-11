import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../pages/My_cars.dart';

class MyDrawer extends StatelessWidget {
  final void Function()? onMyCarsTap;

  MyDrawer({super.key, this.onMyCarsTap});

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          const DrawerHeader(
            child: Icon(
              Icons.person,
              size: 60,
            ),
          ),
          Text("Hello \n${user.email!}"),
          const SizedBox(height: 25),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('H O M E'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('M Y  C A R S'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const My_cars(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
