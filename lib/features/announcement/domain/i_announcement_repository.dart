import 'package:blood_donation_management_system/core/result/result.dart';
import 'package:blood_donation_management_system/features/announcement/data/model/announcement_model.dart';

abstract class IAnnouncementRepository {
  Future<Result<AnnouncementModel,String>> getAnnouncements();
}