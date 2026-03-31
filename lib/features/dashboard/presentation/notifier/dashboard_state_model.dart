import 'package:blood_donation_management_system/features/dashboard/data/model/dashboard_data_model.dart';

class DashboardStateModel {
  final bool isLoading;
  final bool isSuccess;
  final bool isFailed;
  String? errorMessage;
 DashboardDataModel?  dashboardDataModel;

  DashboardStateModel({required this.isLoading, required this.isSuccess, required this.isFailed , this.dashboardDataModel , this.errorMessage});

DashboardStateModel copyWith({ bool? isLoading, bool? isSuccess, bool? isFailed, DashboardDataModel? dashboardDataModel , String? errorMessage}){
  return DashboardStateModel(isLoading: isLoading ?? this.isLoading, isSuccess: isSuccess ?? this.isSuccess, isFailed: this.isFailed, dashboardDataModel:  dashboardDataModel ?? this.dashboardDataModel, errorMessage:  errorMessage ?? this.errorMessage);
}

}