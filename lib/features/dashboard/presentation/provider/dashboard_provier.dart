import 'package:blood_donation_management_system/features/dashboard/data/repository/dashboard_repository_impl.dart';
import 'package:blood_donation_management_system/features/dashboard/data/service/dashboard_service.dart';
import 'package:blood_donation_management_system/features/dashboard/domain/repository/i_dashboard_repository.dart';
import 'package:blood_donation_management_system/features/dashboard/presentation/notifier/dashboard_notifier.dart';
import 'package:blood_donation_management_system/features/dashboard/presentation/notifier/dashboard_state_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dashboardServiceProvider = Provider((ref) => DashboardService());
final dashboardRepositoryProvider = Provider((ref)  {
  final dashboardService = ref.watch(dashboardServiceProvider);
 return  DashboardRepositoryImpl(dashboardService);
});
final dashboardNotifierProvider = NotifierProvider<DashboardNotifier,DashboardStateModel>(()=>DashboardNotifier());
