
import 'package:blood_donation_management_system/features/becomeDonor/data/repository/become_donor_repository_impl.dart';
import 'package:blood_donation_management_system/features/becomeDonor/data/service/become_donor_service.dart';
import 'package:blood_donation_management_system/features/becomeDonor/presentation/notifier/becomeDonor_notifier.dart';
import 'package:blood_donation_management_system/features/becomeDonor/presentation/notifier/becomeDonor_state_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final becomeDonorServiceProvider = Provider((ref) => BecomeDonorService());
final becomeDonorRepositoryProvider = Provider((ref) {
    final _service = ref.watch(becomeDonorServiceProvider);
  return BecomeDonorRepositoryImpl(_service);
});
final becomeDonorNotifierProvider = NotifierProvider<BecomedonorNotifier,BecomeDonorStateModel>(() => BecomedonorNotifier());