import 'package:blood_donation_management_system/core/const/url_const.dart';
import 'package:blood_donation_management_system/features/appointment/data/model/appointment_model.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class AppointmentService {
  final _dio = GetIt.I.get<Dio>(instanceName: 'auth');
   Future<AppointmentModel?> getAppointments({required String userId})async{
     try{
       final response = await _dio.get('/$userId/${UrlConst.appointment}');
       if (response.statusCode == 200) {
         return  AppointmentModel.fromJson(response.data);
       }
       return null;
     }on DioException catch (e) {
       throw Exception('Failed to load appointments: ${e.message}');
     }
   }

 }