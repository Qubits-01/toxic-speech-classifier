import 'package:go_router/go_router.dart';

import '../core/features/app_settings/presentation/screens/app_settings_screen.dart';
import '../core/features/auth/presentation/screens/login_screen.dart';
import '../features/startup/screens/splash_screen.dart';

class AppRouter {
  const AppRouter._();

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: SplashScreen.routeName,
        builder: (_, __) => const SplashScreen(),
      ),
      GoRoute(
        path: LoginScreen.routeName,
        builder: (_, __) => const LoginScreen(),
      ),
      GoRoute(
        path: AppSettingsScreen.routeName,
        builder: (_, __) => const AppSettingsScreen(),
      ),
    ],
  );
}
