import 'package:flutter/material.dart';
import 'package:flutter_car_rent_1/components/my_button.dart';
import 'package:flutter_car_rent_1/components/my_textfield.dart';
import 'package:flutter_car_rent_1/components/squar_tile.dart';

class LoginPage extends StatelessWidget{
  LoginPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn(){}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30),

              const Icon(
                Icons.car_rental,
                size: 100,
              ),

              const SizedBox(height: 25),

              Text(
                'Welcome back let\'s drive!',
                style: TextStyle(color: Colors.grey[700],
                fontSize: 16,
                ),
              ),

              const SizedBox(height: 45),

              MyTextField(
                controller: usernameController,
                hintText: 'Username',
                obscureText: false,
              ),

              const SizedBox(height: 15),


              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Forgot password?',
                    style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              MyButton(
                onTap: signUserIn,
              ),

              const SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text('Or continue with',
                      style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  SquareTile(imagePath: 'lib/images/google__logo2.png'),

                  SizedBox(width: 10,),

                  SquareTile(imagePath: 'lib/images/apple-logo1.png'),
                ],
              ),


              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style:TextStyle(
                      color:Colors.grey[700],),
                  ),

                  const SizedBox(width: 4),

                  const Text('Register now',
                  style: TextStyle(
                    color:Colors.blue, fontWeight: FontWeight.bold,),
                  ),
                ],
              ),





           ]
          ),
        ),
      ),
    );

  }
}