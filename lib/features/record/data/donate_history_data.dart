import 'package:blood_donation_management_system/features/record/model/donate_history_model.dart';

final List<DonateHistoryModel> dummyDonateData = [
  DonateHistoryModel(
    hospital: "Asia Royal", 
    units: 5, 
    dateTime: DateTime(2026,3,21), //year  month  day
    donateStatus: "Completed"
  ),

  DonateHistoryModel(
    hospital: "Yangon General Hospital", 
    units: 3, 
    dateTime: DateTime(2025,12,1), 
    donateStatus: "Completed"
  ),

  DonateHistoryModel(
    hospital: "Asia Royal", 
    units: 1, 
    dateTime: DateTime(2025,9,5), 
    donateStatus: "Rejected"
  ),

  DonateHistoryModel(
    hospital: "Asia Royal", 
    units: 10, 
    dateTime: DateTime(2026,3,21), 
    donateStatus: "Cancel"
  ),

  DonateHistoryModel(
    hospital: "Asia Royal", 
    units: 5, 
    dateTime: DateTime(2026,1,21), 
    donateStatus: "Completed"
  ),

  DonateHistoryModel(
    hospital: "Asia Royal", 
    units: 4, 
    dateTime: DateTime(2026,2,21), 
    donateStatus: "Completed"
  )
];