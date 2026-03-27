
import 'package:blood_donation_management_system/features/authentication/Login/presentation/view/login_screen.dart';
import 'package:blood_donation_management_system/features/authentication/register/presentation/register_screen.dart';
import 'package:blood_donation_management_system/features/dashboard/presentation/dashboard.dart';
import 'package:blood_donation_management_system/features/dashboard/presentation/homeView.dart';
import 'package:blood_donation_management_system/features/donate/presentation/donate.dart';
import 'package:blood_donation_management_system/features/home/presentation/home.dart';
import 'package:blood_donation_management_system/features/profile/presentation/view/profile.dart';
import 'package:blood_donation_management_system/features/appointment/presentation/view/appointment.dart';
import 'package:blood_donation_management_system/features/request/presentation/request.dart';
import 'package:go_router/go_router.dart';

import '../../features/record/presentation/records.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) =>  Home(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) =>  RegisterScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) =>  LoginScreen(),
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
              pageBuilder: (context, state) => NoTransitionPage(
                child: DashboardScreen(),
              ),
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