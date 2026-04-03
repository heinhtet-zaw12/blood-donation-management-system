import 'package:blood_donation_management_system/core/result/result.dart';
import 'package:blood_donation_management_system/features/dashboard/data/model/dashboard_data_model.dart';
import 'package:blood_donation_management_system/features/dashboard/data/service/dashboard_service.dart';
import 'package:blood_donation_management_system/features/dashboard/domain/repository/i_dashboard_repository.dart';

class DashboardRepositoryImpl implements IdashboardRepository{
  final DashboardService _dashboardService;
  DashboardRepositoryImpl(this._dashboardService);

  @override
  Future<Result<DashboardDataModel,String>> getDashboardData() async{
    try{
      final dashboardDataModel =  await _dashboardService.getDashboardData();
      if(dashboardDataModel != null)  return Success(dashboardDataModel);
      return Failure("Failed to Load");
    }catch(e){
      return Failure(e.toString().replaceAll("Exception: ", ""));
    }
  }
}