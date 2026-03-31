import 'package:blood_donation_management_system/features/dashboard/data/model/dashboard_data_model.dart';
import 'package:blood_donation_management_system/features/dashboard/data/service/dashboard_service.dart';
import 'package:blood_donation_management_system/features/dashboard/domain/repository/i_dashboard_repository.dart';

class DashboardRepositoryImpl implements IdashboardRepository{
  final DashboardService _dashboardService;
  DashboardRepositoryImpl(this._dashboardService);

  @override
  Future<DashboardDataModel?> getDashboardData() async{
    try{
      final DashboardDataModel? dashboardDataModel =  await _dashboardService.getDashboardData();
      if(dashboardDataModel != null)  return dashboardDataModel;
      return null;
    }catch(e){
      print(e);
    }

  }
}