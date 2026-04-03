import 'package:blood_donation_management_system/core/const/url_const.dart';
import 'package:blood_donation_management_system/features/announcement/data/model/announcement_model.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class AnnouncementsService {
  final Dio _dio = GetIt.I.get<Dio>();
  Future<AnnouncementModel?> getAnnouncements() async{
  try{
    final response = await _dio.get(UrlConst.announcements);
    if(response.statusCode == 200) return AnnouncementModel.fromJson(response.data);
    return null;
  }on DioException catch(e){
    final errorMessage = e.response?.data['message'] ?? 'Registration failed';
    throw Exception(errorMessage);
  }
  }
}