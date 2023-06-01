import 'package:flutter/material.dart';

import 'router/app_router.dart';

void main() {
  runApp(const ToxicSpeechClassifierApp());
}

class ToxicSpeechClassifierApp extends StatelessWidget {
  const ToxicSpeechClassifierApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Toxic Speech Classifier',
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
