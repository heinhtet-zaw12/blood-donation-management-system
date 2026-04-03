import 'package:blood_donation_management_system/features/dashboard/data/model/dashboard_data_model.dart';
import 'package:blood_donation_management_system/features/dashboard/presentation/notifier/dashboard_state_model.dart';
import 'package:blood_donation_management_system/features/dashboard/presentation/provider/dashboard_provier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/result/result.dart';

class DashboardNotifier extends Notifier<DashboardStateModel>{
  @override
  DashboardStateModel build() => DashboardStateModel(isLoading: false, isSuccess: false, isFailed: false);
  void getDashboard() async{
    state = state.copyWith(isLoading:  true, isSuccess:  false, isFailed:  false);
    final  result = await ref.read(dashboardRepositoryProvider).getDashboardData();
    state = switch (result) {
      Success(data: final model) => state.copyWith(
          isLoading: false,
          isSuccess: true,
         dashboardDataModel  : model
      ),
      Failure(error: final msg) => state.copyWith(
          isLoading: false,
          isFailed: true,
          errorMessage: msg
      ),
    };
    }

}