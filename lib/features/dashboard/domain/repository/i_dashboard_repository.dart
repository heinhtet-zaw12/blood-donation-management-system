import 'package:blood_donation_management_system/features/dashboard/data/model/dashboard_data_model.dart';

abstract class IdashboardRepository {
  Future<DashboardDataModel?> getDashboardData();
}