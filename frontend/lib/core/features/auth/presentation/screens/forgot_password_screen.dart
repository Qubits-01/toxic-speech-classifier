import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  static const routeName = '/forgot-password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Forgot Password')),
      body: const Center(
        child: Text('Ohh what a dumb fuck.\n'
            'You forgot your password huh?\n'
            'Shame on you!\n'
            'tsk tsk tsk...'),
      ),
    );
  }
}
