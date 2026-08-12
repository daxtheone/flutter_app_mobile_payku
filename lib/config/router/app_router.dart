import 'package:go_router/go_router.dart';
import 'package:payku_mobile/features/auth/presentation/screens/splash_screen.dart';
import 'package:payku_mobile/features/screem_test1.dart';

import '../../features/screem_test2.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
    GoRoute(path: '/screem1', builder: (context, state) => const ScreemTest1()),
    GoRoute(path: '/screem2', builder: (context, state) => const ScreemTest2()),
  ],
);