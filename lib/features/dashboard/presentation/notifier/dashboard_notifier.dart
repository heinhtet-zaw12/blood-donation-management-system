import 'package:blood_donation_management_system/features/dashboard/data/model/dashboard_data_model.dart';
import 'package:blood_donation_management_system/features/dashboard/presentation/notifier/dashboard_state_model.dart';
import 'package:blood_donation_management_system/features/dashboard/presentation/provider/dashboard_provier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardNotifier extends Notifier<DashboardStateModel>{
  @override
  DashboardStateModel build() => DashboardStateModel(isLoading: false, isSuccess: false, isFailed: false);
  void getDashboard() async{
      try{
        state = state.copyWith(isLoading:  true, isSuccess:  false, isFailed:  false);
        final DashboardDataModel? dashboardDataModel = await ref.read(dashboardRepositoryProvider).getDashboardData();
        if(dashboardDataModel != null){
          state = state.copyWith(isLoading:  false, isSuccess:  true, isFailed:  false , dashboardDataModel:  dashboardDataModel);
        }
        else {
          state = state.copyWith(isLoading: false, isFailed: true, errorMessage: "Failed to fetch Dashboard.");
        }
      }catch(e){
        state = state.copyWith(
          isLoading: false,
          isFailed : true,
          errorMessage: e.toString().replaceAll("Exception: ", ""),
        );
      }
    }

}