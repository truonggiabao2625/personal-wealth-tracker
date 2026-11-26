import 'package:go_router/go_router.dart';

import '../../features/assets/screens/assets_screen.dart';
import '../../features/dashboard/screens/dashboard_screen.dart';
import '../../features/goals/screens/goals_screen.dart';
import '../../features/settings/screens/settings_screen.dart';
import '../../shared/widgets/home_shell.dart';

/// Toàn bộ đường dẫn màn hình của app.
/// Màn hình đăng nhập (TV1) sẽ thêm route `/dang-nhap` và `redirect` ở đây.
final appRouter = GoRouter(
  initialLocation: '/tong-quan',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          HomeShell(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/tong-quan',
            builder: (context, state) => const DashboardScreen(),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/tai-san',
            builder: (context, state) => const AssetsScreen(),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/muc-tieu',
            builder: (context, state) => const GoalsScreen(),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/cai-dat',
            builder: (context, state) => const SettingsScreen(),
          ),
        ]),
      ],
    ),
  ],
);
