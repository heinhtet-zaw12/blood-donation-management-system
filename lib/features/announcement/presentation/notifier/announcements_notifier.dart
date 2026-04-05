import 'package:blood_donation_management_system/features/announcement/presentation/notifier/announcements_state_model.dart';
import 'package:blood_donation_management_system/features/announcement/presentation/provier/announcements_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/result/result.dart';

class AnnouncementsNotifier extends Notifier<AnnouncementsStateModel>{
  @override
  AnnouncementsStateModel build() => AnnouncementsStateModel(isLoading: false, isFailed: false, isSuccess: false);
  void getAnnouncements () async{
    state = state.copyWith(isLoading: true, isFailed:  false, isSuccess:  false);
    final result = await ref.read(announcementsRepositoryProvider).getAnnouncements();

    state = switch (result) {
      Success(data: final model) => state.copyWith(
          isLoading: false,
          isSuccess: true,
          errorMessage: null,
          announcementModel : model
      ),
      Failure(error: final msg) => state.copyWith(
          isLoading: false,
          isFailed: true,
          errorMessage: msg
      ),
    };

  }

}