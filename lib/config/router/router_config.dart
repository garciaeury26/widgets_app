import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentations/screens/animated/animeted_screen.dart';
import 'package:widgets_app/presentations/screens/cards/cards_screen.dart';
import 'package:widgets_app/presentations/screens/counter/counter_screen.dart';
import 'package:widgets_app/presentations/screens/drawer/drawer.dart';
import 'package:widgets_app/presentations/screens/screens.dart';
import 'package:widgets_app/presentations/screens/theme/theme_screen.dart';

// GoRouter configuration
final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
        path: '/buttons',
        // para acceder a las rutas por nombro => opcional
        name: ButtonScreen.routerName, // opcional
        builder: (context, state) => const ButtonScreen()),
    GoRoute(
        path: '/cards',
        name: 'cards',
        builder: (context, state) => const CardsScreen()),
    GoRoute(
      path: '/pogress',
      name: const ProgresSCreen().name,
      builder: (context, state) => const ProgresSCreen(),
    ),
    GoRoute(
      path: '/snackbar',
      name: const SnackbarScreen().name,
      builder: (context, state) => const SnackbarScreen(),
    ),
    GoRoute(
      path: '/animacion',
      name: const AnimatedScreen().name,
      builder: (context, state) => const AnimatedScreen(),
    ),
    GoRoute(
      path: '/uicontrols',
      name: const UiScreenControllers().name,
      builder: (context, state) => const UiScreenControllers(),
    ),
    GoRoute(
      path: '/tutorial',
      name: const AppTutorialScreen().name,
      builder: (context, state) => const AppTutorialScreen(),
    ),
    GoRoute(
        path: '/infiniteScroll',
        name: 'infiniteScroll',
        builder: ((context, state) => const InfiniteScrollScreen())),
    GoRoute(
        path: '/counter',
        name: 'counter',
        builder: ((context, state) => const CouterSCreen())),
    GoRoute(
        path: '/theme',
        name: 'theme',
        builder: ((context, state) => const ThemeScreen())),
  ],
);
