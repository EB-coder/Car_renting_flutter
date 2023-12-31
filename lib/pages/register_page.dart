import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_car_rent_1/components/my_button.dart';
import 'package:flutter_car_rent_1/components/my_textfield.dart';
import 'package:flutter_car_rent_1/components/squar_tile.dart';


class RegisterPage extends StatefulWidget{
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  

  void signUserUp() async{

    showDialog(context: context, builder: (context) {
      return const Center(child: CircularProgressIndicator(),);
    },);

    try{
      if(passwordController.text == confirmPasswordController.text){
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text, 
      password: passwordController.text,
      );
      }else{
        Navigator.pop(context);
        showErrorMessage("Password not match!");
        return;
      }
    
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } on FirebaseAuthException catch (e){
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String message){
    showDialog(
      context: context, 
      builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.deepPurple,
        title: Center(
          child: Text(
            message, 
            style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 25),
          
                const Icon(
                  Icons.car_rental,
                  size: 100,
                ),
          
                const SizedBox(height: 5),
          
                Text(
                  'Let\'s create an account for you!',
                  style: TextStyle(color: Colors.grey[700],
                  fontSize: 16,
                  ),
                ),
          
                const SizedBox(height: 10),
          
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
          
                const SizedBox(height: 10),
          
          
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
          
                const SizedBox(height: 10),

                MyTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),
          
          
                const SizedBox(height: 20),
          
                MyButton(
                  text: "Sign Up",
                  onTap: signUserUp,
                ),
          
                const SizedBox(height: 25),
          
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
          
                    SizedBox(width: 10),
          
                    SquareTile(imagePath: 'lib/images/apple-logo1.png'),
                  ],
                ),
          
          
                const SizedBox(height: 25),
          
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style:TextStyle(
                        color:Colors.grey[700],),
                    ),
          
                    const SizedBox(width: 4),
          
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text('Login now',
                      style: TextStyle(
                        color:Colors.blue, fontWeight: FontWeight.bold,),
                      ),
                    ),
                  ],
                )
             ]
            ),
          ),
        ),
      ),
    );

  }
}