import 'package:code_union/app/navigation/app_route.dart';
import 'package:code_union/app/ui/screens/auth/auth_screen.dart';
import 'package:code_union/app/ui/screens/auth/auth_screen_view_model.dart';
import 'package:code_union/app/ui/screens/main/main_screen.dart';
import 'package:code_union/app/ui/screens/splash/splash_screen.dart';
import 'package:code_union/app/ui/screens/splash/splash_screen_view_model.dart';
import 'package:code_union/core/di/inject.dart';
import 'package:code_union/domain/bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouterConfig {
  late final GoRouter router = GoRouter(
    routes: _routes,
    initialLocation: AppRoute.root,
  );

  late final _routes = <RouteBase>[
    GoRoute(
      path: '/',
      name: AppRoute.root,
      builder: (context, state) => SplashScreen(
        viewModel: SplashScreenViewModel(inject()),
      ),
    ),
    GoRoute(
      path: '/auth',
      name: AppRoute.auth,
      builder: (_, __) => BlocProvider(
        create: (_) => AuthBloc(
          inject(),
          inject(),
        ),
        child: AuthScreen(
          viewModel: AuthScreenViewModel(),
        ),
      ),
    ),
    GoRoute(
      path: '/main',
      name: AppRoute.main,
      builder: (_, __) => const MainScreen(),
    ),
  ];

  void dispose() {}
}
