import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:toxic_speech_classifier/features/item_showcase/presentation/screens/item_details_screen.dart';

import 'forgot_password_screen.dart';
import 'sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    Size displaySize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Welcome Text
              const SizedBox(height: 25.0),
              Text(
                'Login',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(height: 10.0),

              // Subtext
              const Text('Enter your credentials to access your account.'),
              const SizedBox(height: 25.0),

              // Google Login Button
              SizedBox(
                width: displaySize.width,
                child: TextButton.icon(
                  icon: const FaIcon(FontAwesomeIcons.google),
                  label: const Text('Login with Google'),
                  style: TextButton.styleFrom(
                    side: const BorderSide(color: Colors.white70),
                  ),
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 30.0),

              // Horizontal Divider
              Row(
                children: <Widget>[
                  const Expanded(child: Divider()),
                  Text(
                    ' or ',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Colors.white60),
                  ),
                  const Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 30.0),

              // Text Inputs
              // Email label
              Text(
                'Email',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 10.0),

              // Email input
              TextField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  isDense: true,
                ),
                onTap: () {},
              ),
              const SizedBox(height: 20.0),

              // Password label and Forgot password
              Row(
                children: <Widget>[
                  // Password label
                  Text(
                    'Password',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const Spacer(),

                  // Forgot password button
                  GestureDetector(
                    child: Text(
                      'Forgot Password?',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                    ),
                    onTap: () {
                      GoRouter.of(context).push(ForgotPasswordScreen.routeName);
                    },
                  ),
                ],
              ),

              const SizedBox(height: 10.0),

              // Password input
              const TextField(
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  isDense: true,
                ),
              ),
              const SizedBox(height: 5.0),

              // Remember Me Checkbox
              Row(
                children: <Widget>[
                  SizedBox(
                    child: Checkbox(
                      value: false,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: const VisualDensity(horizontal: -4),
                      onChanged: (bool? value) {},
                    ),
                  ),
                  const Text(' Remember me'),
                ],
              ),
              const SizedBox(height: 30.0),

              // Login Button
              SizedBox(
                width: displaySize.width,
                child: ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).push(ItemDetailsScreen.routeName);
                  },
                  child: const Text('Login'),
                ),
              ),
              const SizedBox(height: 30.0),

              // Not a member? Sign up here.
              Row(
                children: <Widget>[
                  const Text('Not a member? '),
                  // Forgot password button
                  GestureDetector(
                    child: Text(
                      ' Sign-up',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                    ),
                    onTap: () {
                      GoRouter.of(context).push(SignUpScreen.routeName);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
