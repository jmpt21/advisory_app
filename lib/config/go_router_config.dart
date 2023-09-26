import 'package:advisory_app/views/home_screen.dart';
import 'package:advisory_app/views/register_screen.dart';
import 'package:go_router/go_router.dart';

final routerConfig = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    name: HomeScreen.routeName,
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/login',
    name: RegisterScreen.routeName,
    builder: (context, state) => const RegisterScreen(),
  ),
]);
