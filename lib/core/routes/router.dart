
import 'package:blood_donation_management_system/features/Home/Dashboard/presentation/dashboard.dart';
import 'package:blood_donation_management_system/features/donation/presentation/donate.dart';
import 'package:blood_donation_management_system/features/home/dashboard/presentation/homeView.dart';
import 'package:blood_donation_management_system/features/home/home/presentation/home.dart';
import 'package:blood_donation_management_system/features/profile/presentation/profile.dart';
import 'package:blood_donation_management_system/features/appointment/presentation/appointment.dart';
import 'package:blood_donation_management_system/features/request/presentation/request.dart';
import 'package:go_router/go_router.dart';

import '../../features/record/presentation/records.dart';

final router = GoRouter(
  initialLocation: '/dashboard',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return HomeView(shell: navigationShell,);
      },
      branches: [
        // Tab 1: Dashboard
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/dashboard',
              builder: (context, state) => const DashboardScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/donate',
              builder: (context, state) => Donate(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/request',
              builder: (context, state) => Request(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/appointment',
              builder: (context, state) => Appointment(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/records',
              builder: (context, state) => Records(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              builder: (context, state) => ProfileScreen(),
            ),
          ],
        ),
        
     ],
    ),
  ],
);