import 'dart:math';

import 'package:blood_donation_management_system/features/announcement/data/model/announcement_model.dart';

class AnnouncementsStateModel {
  final bool isLoading;
  final bool isFailed;
  final bool isSuccess;
  AnnouncementModel? announcementModel;
  String? errorMessage;

  AnnouncementsStateModel({required this.isLoading, required this.isFailed, required this.isSuccess, this.announcementModel, this.errorMessage});

AnnouncementsStateModel copyWith({bool? isLoading, bool? isFailed, bool? isSuccess, AnnouncementModel? announcementModel, String? errorMessage}){
  return AnnouncementsStateModel(isLoading: isLoading ?? this.isLoading , isFailed: isFailed ?? this.isFailed, isSuccess: isSuccess ?? this.isSuccess , announcementModel:  announcementModel ?? this.announcementModel, errorMessage:  errorMessage ?? this.errorMessage);
}

}