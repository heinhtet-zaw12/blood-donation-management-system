import 'package:blood_donation_management_system/features/appointment/data/model/appointment_model.dart';
import 'package:blood_donation_management_system/features/donate/data/model/donate_model.dart';
import 'package:blood_donation_management_system/features/donate/data/repository/donate_repo.dart';
import 'package:blood_donation_management_system/features/donate/data/service/donate_service.dart';
import 'package:blood_donation_management_system/features/donate/presentation/notifier/donate_notifier.dart';
import 'package:blood_donation_management_system/features/donate/presentation/notifier/donate_notifier_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

/// FORM
final donateFormProvider =
    StateProvider<DonateModel>((ref) => DonateModel());

/// STEP
enum DonateStep { first, second, third, submit }

final donateStepProvider =
    StateProvider<DonateStep>((ref) => DonateStep.first);

/// API
final donateApiProvider = Provider((ref) => DonateApiService());

final donateRepositoryProvider = Provider(
  (ref) => DonateRepository(ref.read(donateApiProvider)),
);

final donateNotifierProvider =
    NotifierProvider<DonateNotifier, DonateNotifierState>(
  DonateNotifier.new,
);
