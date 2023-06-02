import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            const Text('Login'),
            const Text('Enter your credentials to access your account.'),
            TextButton.icon(
              icon: const Icon(
                Icons.login,
              ),
              label: const Text('Login with Google'),
              onPressed: () {},
            ),

            // Horizontal Divider
            const Divider(
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),

            // Text Inputs
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),

            // Remember Me Checkbox
            Row(
              children: <Widget>[
                Checkbox(
                  value: false,
                  onChanged: (bool? value) {},
                ),
                const Text('Remember me'),
              ],
            ),

            // Login Button
            ElevatedButton(
              onPressed: () {},
              child: const Text('Login'),
            ),

            // Not a member? Sign up here.
            TextButton(
              onPressed: () {},
              child: const Text('Not a member? Sign up here.'),
            ),
          ],
        ),
      ),
    );
  }
}
