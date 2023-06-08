import 'package:go_router/go_router.dart';

import '../core/features/app_settings/presentation/screens/app_settings_screen.dart';
import '../core/features/auth/presentation/screens/forgot_password_screen.dart';
import '../core/features/auth/presentation/screens/login_screen.dart';
import '../core/features/auth/presentation/screens/sign_up_screen.dart';
import '../features/item_showcase/presentation/screens/item_details_screen.dart';
import '../features/ratings_and_reviews/presentation/ratings_and_reviews_screen.dart';
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
        path: SignUpScreen.routeName,
        builder: (_, __) => const SignUpScreen(),
      ),
      GoRoute(
        path: ForgotPasswordScreen.routeName,
        builder: (_, __) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: ItemDetailsScreen.routeName,
        builder: (_, __) => const ItemDetailsScreen(),
      ),
      GoRoute(
        path: RatingsAndReviewsScreen.routeName,
        builder: (_, __) => RatingsAndReviewsScreen(),
      ),
      GoRoute(
        path: AppSettingsScreen.routeName,
        builder: (_, __) => const AppSettingsScreen(),
      ),
    ],
  );
}
