
import 'package:blood_donation_management_system/features/Home/Dashboard/presentation/dashboard.dart';
import 'package:blood_donation_management_system/features/authentication/Login/presentation/login_screen.dart';
import 'package:blood_donation_management_system/features/authentication/register/presentation/register_screen.dart';
import 'package:blood_donation_management_system/features/donation/donate/presentation/donate.dart';
import 'package:blood_donation_management_system/features/home/dashboard/presentation/homeView.dart';
import 'package:blood_donation_management_system/features/home/home/presentation/home.dart';
import 'package:blood_donation_management_system/features/profile/presentation/profile.dart';
import 'package:blood_donation_management_system/features/request/appointment/presentation/appointment.dart';
import 'package:blood_donation_management_system/features/request/request/presentation/request.dart';
import 'package:go_router/go_router.dart';

import '../../features/donation/record/presentation/records.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/',
      builder: (context, state) => Home(),
    ),
    GoRoute(path: '/login',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(path: '/register',
      builder: (context, state) => RegisterScreen(),
    ),

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