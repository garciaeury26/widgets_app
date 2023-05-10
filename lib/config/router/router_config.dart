import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentations/screens/screens.dart';

// GoRouter configuration
final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(path: '/buttons',builder: (context, state) => const ButtonScreen()),
  ],
);
