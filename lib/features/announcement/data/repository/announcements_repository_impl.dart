import 'package:blood_donation_management_system/core/result/result.dart';
import 'package:blood_donation_management_system/features/announcement/data/model/announcement_model.dart';
import 'package:blood_donation_management_system/features/announcement/data/service/announcements_service.dart';
import 'package:blood_donation_management_system/features/announcement/domain/i_announcement_repository.dart';

class AnnouncementsRepositoryImpl implements IAnnouncementRepository{
  final AnnouncementsService _announcementsService;

  AnnouncementsRepositoryImpl(this._announcementsService);
  @override
  Future<Result<AnnouncementModel, String>> getAnnouncements() async{
   try{
     final announcements =  await _announcementsService.getAnnouncements();
     if(announcements != null) {
       return Success(announcements);
     }
     return Failure("Failed to get Announcements");
   }catch(e){
     return Failure(e.toString().replaceAll("Exception: ", ""));

   }
  }
}