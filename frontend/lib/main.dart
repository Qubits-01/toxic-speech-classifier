import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';

import 'router/app_router.dart';
import 'themes/app_theme.dart';

void main() {
  // // Initialize the Appwrite client.
  // Client client = Client();
  // client
  //     .setEndpoint('https://cloud.appwrite.io/v1')
  //     .setProject('toxic_speech_classifier')
  //     .setSelfSigned(status: true);
  // // For self signed certificates, only use for development.

  runApp(const ToxicSpeechClassifierApp());
}

class ToxicSpeechClassifierApp extends StatelessWidget {
  const ToxicSpeechClassifierApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Toxic Speech Classifier',
      routerConfig: AppRouter.router,
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
