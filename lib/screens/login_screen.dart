import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// helper functions
import '../helper/helper_functions.dart';

// components
import '../components/my_textfield.dart';
import '../components/my_button.dart';

class LoginScreen extends StatefulWidget {
  final void Function()? onTap;

  const LoginScreen({super.key, required this.onTap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // text controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // login method
  void login() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    // try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // pop loading circle
      if (context.mounted) Navigator.pop(context);
    }
    // Display any errors
    on FirebaseAuthException catch (e) {
      // pop loading circle
      Navigator.pop(context);
      displayMessageToUser(e.code, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // logo
                Icon(
                  Icons.lock,
                  size: 80,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),

                const SizedBox(height: 25),
                // app name
                const Text(
                  "L O G I N",
                  style: TextStyle(fontSize: 20),
                ),

                const SizedBox(height: 50),
                // email textfield
                MyTextField(
                  hintText: "Email",
                  obscureText: false,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                ),

                const SizedBox(height: 10),
                // password textfield
                MyTextField(
                  hintText: "Password",
                  obscureText: true,
                  controller: passwordController,
                ),

                const SizedBox(height: 25),
                // sign in button
                MyButton(
                  text: "Login",
                  onTap: login,
                ),

                const SizedBox(height: 25),
                // don't have an account? Register here
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        " Register Here",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
