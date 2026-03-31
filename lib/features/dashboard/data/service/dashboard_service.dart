import 'package:blood_donation_management_system/core/const/url_const.dart';
import 'package:blood_donation_management_system/features/dashboard/data/model/dashboard_data_model.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class DashboardService {
 final  Dio _dio = GetIt.I.get<Dio>(instanceName: 'auth');
  Future<DashboardDataModel?> getDashboardData() async{
    try{
    final  response = await _dio.get(UrlConst.dashboard);
    if (response.statusCode == 200) {
      return   DashboardDataModel.fromJson(response.data);
    }
    return null;
    }on DioException catch(e){
      final errorMessage = e.response?.data['message'] ?? 'Failed';
      throw Exception(errorMessage);
    }
  }


}