import 'package:apilogin/components/my_button.dart';
import 'package:apilogin/components/my_textfield.dart';
import 'package:apilogin/pages/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController userNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // login method
  void login() {
    final String userNumber = userNumberController.text;
    final String password = passwordController.text;

    if (userNumber.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Please fill all fields"),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
      return;
    }

    // fill in the login logic here

    // if login is successful, navigate to home page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.local_activity,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(height: 25),
            // app slogan

            Text(
              'JOEs App',
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 25),

            // user number
            MyTextField(
              controller: userNumberController,
              hintText: "User Number",
              obscureText: false,
            ),

            const SizedBox(height: 10),

            // password
            MyTextField(
              controller: passwordController,
              hintText: "Password",
              obscureText: true,
            ),

            const SizedBox(height: 10),

            // sign in button
            MyButton(
              text: "Sign In",
              onTap: login,
            ),

            // not a user, register
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a user? ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Register now",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
