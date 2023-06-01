import 'package:go_router/go_router.dart';

import '../features/startup/screens/splash_screen.dart';

class AppRouter {
  const AppRouter._();

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: SplashScreen.routeName,
        builder: (_, __) => const SplashScreen(),
      ),
    ],
  );
}
