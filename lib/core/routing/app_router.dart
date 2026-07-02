import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/view/authentication_page.dart';
import '../../features/home/home_page.dart';
import '../../features/not_found/not_found_page.dart';
import 'app_route.dart';
import 'custom_transition.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoute.homePath,
  errorBuilder: (context, state) {
    return const NotFoundPage();
  },

  routes: [
    GoRoute(
      path: AppRoute.homePath,
      name: AppRoute.home,
      pageBuilder: (context, state) {
        return webFadePage(
          context: context,
          state: state,
          child: const HomePage(),
        );
      },
    ),
    GoRoute(
      path: AppRoute.authPath,
      name: AppRoute.auth,
      pageBuilder: (context, state) {
        return webFadePage(
          context: context,
          state: state,
          child: const AuthenticationPage(),
        );
      },
    ),
  ],
);
