import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:payku_mobile/features/auth/presentation/screens/login_screen.dart';
import 'package:payku_mobile/features/auth/presentation/screens/splash_screen.dart';
import 'package:payku_mobile/features/home/home_screen.dart';

import 'package:payku_mobile/features/screem_test1.dart';
import '../../features/auth/presentation/providers/providers.dart';
import '../../features/screem_test2.dart';
import 'app_router_notifier.dart';

final goRouterProvider = Provider((ref){
  final goRouterNotifier = ref.read(goRouterNotifierProvider);
  return GoRouter(
      initialLocation: '/',
      refreshListenable: goRouterNotifier,
      routes: [
        GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
        GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
        GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
        GoRoute(path: '/screem1', builder: (context, state) => const ScreemTest1()),
        GoRoute(path: '/screem2', builder: (context, state) => const ScreemTest2()),
      ],
      redirect: (context, state) {
        final isGoingTo = state.matchedLocation;
        final authStatus = goRouterNotifier.authStatus;

        if ( isGoingTo == '/' && authStatus == AuthStatus.checking ) return null;
        if( authStatus== AuthStatus.notAuthenticated ){
          if ( isGoingTo == '/' || isGoingTo == '/login') return null;
          return '/login';
        }
        if( authStatus == AuthStatus.authenticated ) {
          if (isGoingTo == '/login' || isGoingTo == '/') return '/home';
        }

        print(state);
        return null;
      }
  );
});