import 'package:blood_donation_management_system/features/announcement/data/repository/announcements_repository_impl.dart';
import 'package:blood_donation_management_system/features/announcement/data/service/announcements_service.dart';
import 'package:blood_donation_management_system/features/announcement/domain/i_announcement_repository.dart';
import 'package:blood_donation_management_system/features/announcement/presentation/notifier/announcements_notifier.dart';
import 'package:blood_donation_management_system/features/announcement/presentation/notifier/announcements_state_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final announcementsServiceProvider = Provider<AnnouncementsService>((ref) => AnnouncementsService());

final announcementsRepositoryProvider = Provider<IAnnouncementRepository>((ref){
  final announcementsService = ref.watch(announcementsServiceProvider);
  return AnnouncementsRepositoryImpl(announcementsService);
});

final announcementNotifierProvider = NotifierProvider<AnnouncementsNotifier,AnnouncementsStateModel>(() => AnnouncementsNotifier());